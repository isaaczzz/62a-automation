function result = run_rixs_batch(varargin)
%RUN_RIXS_BATCH Run onepotRIXS over matching RIXS .sif scans.
%
% Usage:
%   result = run_rixs_batch()
%   result = run_rixs_batch('AgNO3')
%   result = run_rixs_batch('AgNO3', 9, 1393)
%   result = run_rixs_batch('AgNO3', 9, 1393, 'DataDir', '/data/P1APA')
%   result = run_rixs_batch('AgNO3', 9, 1393, 'ScanNumbers', [1 2 7])
%
% Positional Inputs:
%   fileStem          - Optional stem at start of filename (e.g., 'AgNO3').
%   integrationWindow - Optional integration window (numeric scalar).
%   integrationCenter - Optional integration center (numeric scalar).
%
% Name-Value Options:
%   DataDir           - Directory to run in. Defaults to current directory.
%   ScanNumbers       - Optional inferred scan numbers to run.
%
% Notes:
%   - When called with no arguments, all '*RIXS*.sif' files in the current
%     directory are processed.
%   - Inferred scan numbers are parsed from text between '_RIXS_' and '.sif'.
%     Example: '*_RIXS_01_3359.50.sif' -> 1
%   - onepotRIXS is called with grouped wildcards per scan subset.
%     Example: 'AgNO3_AgLa_RIXS_01_3358.55.sif' -> 'AgNO3_AgLa_RIXS_01*.sif'
%
% Default integration values (used when omitted):
%   integrationWindow = 11
%   integrationCenter = 1498

    defaultFileStem = '';
    defaultIntegrationWindow = 11;
    defaultIntegrationCenter = 1498;

    fileStem = defaultFileStem;
    integrationWindow = defaultIntegrationWindow;
    integrationCenter = defaultIntegrationCenter;
    nvArgs = {};

    if nargin == 0
        % Use defaults.
    elseif nargin >= 1 && (ischar(varargin{1}) || isstring(varargin{1}))
        fileStem = varargin{1};
        if nargin >= 3 && isnumeric(varargin{2}) && isscalar(varargin{2}) ...
                && isnumeric(varargin{3}) && isscalar(varargin{3})
            integrationWindow = varargin{2};
            integrationCenter = varargin{3};
            nvArgs = varargin(4:end);
        else
            nvArgs = varargin(2:end);
        end
    else
        error(['Usage: run_rixs_batch(), run_rixs_batch(fileStem), ', ...
            'run_rixs_batch(fileStem, integrationWindow, integrationCenter, ...)']);
    end

    parser = inputParser;
    parser.FunctionName = mfilename;

    addParameter(parser, 'DataDir', '', @(x) ischar(x) || isstring(x));
    addParameter(parser, 'ScanNumbers', [], @(x) isnumeric(x) && isvector(x) && all(isfinite(x)));

    parse(parser, nvArgs{:});

    fileStem = strtrim(char(fileStem));
    dataDir = strtrim(char(parser.Results.DataDir));
    requestedScanNumbers = unique(double(parser.Results.ScanNumbers(:))', 'stable');

    if isempty(dataDir)
        dataDir = pwd;
    end

    if ~isfolder(dataDir)
        error('Directory does not exist: %s', dataDir);
    end

    sifFiles = dir(fullfile(dataDir, '*.sif'));
    if isempty(sifFiles)
        error('No .sif files found in %s', dataDir);
    end

    names = {sifFiles.name};
    isRixsName = ~cellfun('isempty', regexp(names, '_RIXS_', 'once'));
    if isempty(fileStem)
        isStemMatch = true(size(names));
    else
        isStemMatch = startsWith(lower(names), lower([fileStem, '_']));
    end
    isMatch = isRixsName & isStemMatch;
    matchedNames = sort(names(isMatch));

    if isempty(matchedNames)
        if isempty(fileStem)
            error('No files with ''_RIXS_'' in the name were found in %s', dataDir);
        else
            error('No files matching stem ''%s'' with ''_RIXS_'' were found in %s', fileStem, dataDir);
        end
    end

    inferredScanNumbers = nan(size(matchedNames));
    scanTokens = cell(size(matchedNames));
    for k = 1:numel(matchedNames)
        scanTokens{k} = extract_scan_token(matchedNames{k});
        inferredScanNumbers(k) = infer_scan_number(scanTokens{k});
    end

    if any(~isfinite(inferredScanNumbers))
        warning('run_rixs_batch:BadFileName', ...
            'Could not infer numeric scan numbers for %d file(s).', sum(~isfinite(inferredScanNumbers)));
    end

    if isempty(requestedScanNumbers)
        selectedIdx = isfinite(inferredScanNumbers);
        if ~any(selectedIdx)
            error('No files with inferable numeric scan numbers were found in %s', dataDir);
        end
        usedScanNumbers = inferredScanNumbers;
    else
        selectedIdx = false(size(matchedNames));
        for s = requestedScanNumbers
            hit = isfinite(inferredScanNumbers) & abs(inferredScanNumbers - s) < 1e-9;
            selectedIdx = selectedIdx | hit;
            if ~any(hit)
                if isempty(fileStem)
                    warning('run_rixs_batch:MissingScan', ...
                        'Requested scan %g is missing in %s', s, dataDir);
                else
                    warning('run_rixs_batch:MissingScan', ...
                        'Requested scan %g is missing for stem ''%s'' in %s', s, fileStem, dataDir);
                end
            end
        end

        if ~any(selectedIdx)
            if isempty(fileStem)
                error('None of the requested scans were found in %s', dataDir);
            else
                error('None of the requested scans were found for stem ''%s'' in %s', fileStem, dataDir);
            end
        end

        usedScanNumbers = inferredScanNumbers(selectedIdx);
    end

    runFileNames = matchedNames(selectedIdx);

    sortKey = inferredScanNumbers(selectedIdx);
    if all(isfinite(sortKey))
        [~, order] = sort(sortKey);
        runFileNames = runFileNames(order);
        usedScanNumbers = usedScanNumbers(order);
    end

    originalDir = pwd;
    cleaner = onCleanup(@() cd(originalDir)); %#ok<NASGU>
    cd(dataDir);

    runPatternsPerFile = cell(size(runFileNames));
    for k = 1:numel(runFileNames)
        runPatternsPerFile{k} = build_run_pattern(runFileNames{k});
    end

    [runPatterns, firstIdx] = unique(runPatternsPerFile, 'stable');
    runScanNumbers = usedScanNumbers(firstIdx);

    failedScanNumbers = [];
    failedFiles = {};

    for k = 1:numel(runPatterns)
        filePattern = runPatterns{k};
        scanNumber = runScanNumbers(k);
        try
            onepotRIXS(filePattern, integrationWindow, integrationCenter);
        catch ex
            failedScanNumbers(end + 1) = scanNumber; %#ok<AGROW>
            failedFiles{end + 1} = filePattern; %#ok<AGROW>
            warning('run_rixs_batch:ScanFailed', ...
                'Failed for file %s (scan %g): %s', filePattern, scanNumber, ex.message);
        end
    end

    result = struct();
    result.FileStem = fileStem;
    result.DataDir = dataDir;
    result.IntegrationWindow = integrationWindow;
    result.IntegrationCenter = integrationCenter;
    result.MatchedFiles = matchedNames;
    result.RunFiles = runFileNames;
    result.InferredScanNumbers = inferredScanNumbers;
    result.ScanTokens = scanTokens;
    result.RequestedScanNumbers = requestedScanNumbers;
    result.UsedScanNumbers = usedScanNumbers;
    result.RunPatterns = runPatterns;
    result.FailedScanNumbers = failedScanNumbers;
    result.FailedFiles = failedFiles;
end

function scanToken = extract_scan_token(fileName)
    token = regexp(fileName, '_RIXS_(.+)\.sif$', 'tokens', 'once');
    if isempty(token)
        scanToken = '';
    else
        scanToken = token{1};
    end
end

function scanNumber = infer_scan_number(scanToken)
    if isempty(scanToken)
        scanNumber = nan;
        return;
    end

    numericTokens = regexp(scanToken, '-?\d+(?:\.\d+)?', 'match');
    if isempty(numericTokens)
        scanNumber = nan;
    else
        scanNumber = str2double(numericTokens{1});
    end
end

function runPattern = build_run_pattern(fileName)
    prefixToken = regexp(fileName, '^(.*_RIXS_)', 'tokens', 'once');
    if isempty(prefixToken)
        runPattern = fileName;
        return;
    end

    suffixToken = regexp(fileName, '_RIXS_(.+)\.sif$', 'tokens', 'once');
    if isempty(suffixToken)
        runPattern = fileName;
        return;
    end

    scanToken = suffixToken{1};
    groupToken = regexp(scanToken, '-?\d+(?:\.\d+)?', 'match', 'once');
    if isempty(groupToken)
        runPattern = fileName;
        return;
    end

    runPattern = sprintf('%s%s*.sif', prefixToken{1}, groupToken);
end
