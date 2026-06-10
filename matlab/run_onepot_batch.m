function result = run_onepot_batch(varargin)
%RUN_ONEPOT_BATCH Run onepot_iz over matching onepot .sif scans.
%
% Usage:
%   result = run_onepot_batch()
%   result = run_onepot_batch('P1SMe_AgL3val')
%   result = run_onepot_batch('P1SMe_AgL3val', 'Energies', [3359.30 3360.10])
%   result = run_onepot_batch('P1SMe_AgL3val', 'ScanNumbers', [1 2 7])
%   result = run_onepot_batch('P1SMe_AgL3val', 'DataDir', '/data/run42', ...
%                             'Energies', [3359.30], 'ScanNumbers', [2 3], ...
%                             'OnepotArgs', {'draw', 0})
%
% Positional Inputs:
%   fileStem     - Optional stem at start of filename (e.g., 'P1SMe_AgL3val')
%
% Name-Value Options:
%   DataDir      - Directory to run in. Defaults to current directory.
%   Energies     - Optional numeric list of energies (eV) to include.
%   ScanNumbers  - Optional numeric list of scan numbers to include.
%   OnepotArgs   - Optional cell array of extra args passed to onepot_iz.
%
% Expected filename format:
%   [stem]_[energy]eV_[scan].sif
% Example:
%   P1SMe_AgL3val_3359.30eV_02.sif
%
% For each selected file, calls:
%   onepot_iz(fileName, 'bcg', [fileWithoutExt '_dark.sif'], 'extract', true, OnepotArgs{:})

    defaultFileStem = '';
    fileStem = defaultFileStem;
    nvArgs = {};

    if nargin == 0
        % defaults
    elseif ischar(varargin{1}) || isstring(varargin{1})
        fileStem = varargin{1};
        nvArgs = varargin(2:end);
    else
        error('Usage: run_onepot_batch(), run_onepot_batch(fileStem, ...)');
    end

    p = inputParser;
    p.FunctionName = mfilename;
    addParameter(p, 'DataDir', '', @(x) ischar(x) || isstring(x));
    addParameter(p, 'Energies', [], @(x) isnumeric(x) && isvector(x) && all(isfinite(x)));
    addParameter(p, 'ScanNumbers', [], @(x) isnumeric(x) && isvector(x) && all(isfinite(x)));
    addParameter(p, 'OnepotArgs', {}, @(x) iscell(x));
    parse(p, nvArgs{:});

    fileStem = strtrim(char(fileStem));
    dataDir = strtrim(char(p.Results.DataDir));
    requestedEnergies = unique(double(p.Results.Energies(:))', 'stable');
    requestedScans = unique(double(p.Results.ScanNumbers(:))', 'stable');
    onepotArgs = p.Results.OnepotArgs;

    if isempty(dataDir), dataDir = pwd; end
    if ~isfolder(dataDir), error('Directory does not exist: %s', dataDir); end

    listing = dir(fullfile(dataDir, '*.sif'));
    if isempty(listing), error('No .sif files found in %s', dataDir); end

    names = {listing.name};
    parsed = cellfun(@parse_onepot_filename, names, 'UniformOutput', false);
    parsed = [parsed{:}];

    isValid = [parsed.isValid];
    isDark = [parsed.isDark];
    if isempty(fileStem)
        isStem = true(size(names));
    else
        isStem = strcmpi({parsed.stem}, fileStem);
    end

    candidateIdx = isValid & ~isDark & isStem;
    candidates = parsed(candidateIdx);

    if isempty(candidates)
        if isempty(fileStem)
            error('No valid non-dark files matching pattern [stem]_[energy]eV_[scan].sif in %s', dataDir);
        else
            error('No valid non-dark files found for stem ''%s'' in %s', fileStem, dataDir);
        end
    end

    energies = [candidates.energy];
    scans = [candidates.scan];

    select = true(size(candidates));

    if ~isempty(requestedEnergies)
        eSel = false(size(candidates));
        for e = requestedEnergies
            hit = abs(energies - e) < 1e-6;
            eSel = eSel | hit;
            if ~any(hit)
                warning('run_onepot_batch:MissingEnergy', ...
                    'Requested energy %.6f eV not found%s.', e, stem_suffix(fileStem));
            end
        end
        select = select & eSel;
    end

    if ~isempty(requestedScans)
        sSel = false(size(candidates));
        for s = requestedScans
            hit = abs(scans - s) < 1e-9;
            sSel = sSel | hit;
            if ~any(hit)
                warning('run_onepot_batch:MissingScan', ...
                    'Requested scan %g not found%s.', s, stem_suffix(fileStem));
            end
        end
        select = select & sSel;
    end

    runEntries = candidates(select);
    if isempty(runEntries)
        error('No files remain after applying requested Energies/ScanNumbers filters.');
    end

    sortMat = [[runEntries.energy]' [runEntries.scan]'];
    [~, ord] = sortrows(sortMat, [1 2]);
    runEntries = runEntries(ord);

    originalDir = pwd;
    c = onCleanup(@() cd(originalDir)); %#ok<NASGU>
    cd(dataDir);

    failedFiles = {};
    failedDarkFiles = {};
    failedMessages = {};

    for k = 1:numel(runEntries)
        f = runEntries(k).name;
        dark = [f(1:end-4) '_dark.sif'];

        fprintf('run_onepot_batch: %s (E=%.2f eV, scan=%02d), bcg=%s\n', ...
            f, runEntries(k).energy, runEntries(k).scan, dark);

        try
            onepot_iz(f, 'bcg', dark, onepotArgs{:});
        catch ex
            failedFiles{end+1} = f; %#ok<AGROW>
            failedDarkFiles{end+1} = dark; %#ok<AGROW>
            failedMessages{end+1} = ex.message; %#ok<AGROW>
            warning('run_onepot_batch:RunFailed', ...
                'Failed for file %s (bcg %s): %s', f, dark, ex.message);
        end
    end

    result = struct();
    result.FileStem = fileStem;
    result.DataDir = dataDir;
    result.RequestedEnergies = requestedEnergies;
    result.RequestedScanNumbers = requestedScans;
    result.OnepotArgs = onepotArgs;
    result.MatchedFiles = {candidates.name};
    result.MatchedEnergies = [candidates.energy];
    result.MatchedScanNumbers = [candidates.scan];
    result.RunFiles = {runEntries.name};
    result.RunEnergies = [runEntries.energy];
    result.RunScanNumbers = [runEntries.scan];
    result.BcgFiles = cellfun(@(s) [s(1:end-4) '_dark.sif'], result.RunFiles, 'UniformOutput', false);
    result.FailedFiles = failedFiles;
    result.FailedBcgFiles = failedDarkFiles;
    result.FailedMessages = failedMessages;
end

function out = parse_onepot_filename(fileName)
    out = struct('name', fileName, 'isValid', false, 'isDark', false, ...
                 'stem', '', 'energy', nan, 'scan', nan);

    tok = regexp(fileName, '^(.*)_(\d+\.\d{2})eV_(\d{2})(_dark)?\.sif$', 'tokens', 'once');
    if isempty(tok)
        return;
    end

    out.isValid = true;
    out.stem = tok{1};
    out.energy = str2double(tok{2});
    out.scan = str2double(tok{3});
    out.isDark = ~isempty(tok{4});
end

function s = stem_suffix(fileStem)
    if isempty(fileStem)
        s = '';
    else
        s = sprintf(' for stem ''%s''', fileStem);
    end
end