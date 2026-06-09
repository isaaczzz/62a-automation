function result = interpolate_average_stem(fileStem, varargin)
%INTERPOLATE_AVERAGE_STEM Interpolate and average spectra matching a stem.
%
% Usage:
%   result = interpolate_average_stem()
%   result = interpolate_average_stem('SHB2_SKa')
%   result = interpolate_average_stem('SHB2_SKa', 'DataDir', 'example-data')
%   result = interpolate_average_stem('SHB2_SKa', 'ScanNumbers', [1 2 4 7])
%
% This function:
%   1) Finds all .txt files in DataDir whose names contain fileStem.
%      If fileStem is omitted or empty, matches extract_* files that contain
%      '_RIXS_' (run_rixs_batch outputs).
%   2) Interpolates each file onto a common overlapping E grid.
%   3) Averages all signal columns (non-E columns).
%   4) Writes average data to <fileStem>.txt.
%   5) Plots TFY and HERFD side-by-side and saves <fileStem>.png.

    if nargin < 1
        fileStem = '';
    end

    parser = inputParser;
    parser.FunctionName = mfilename;

    addRequired(parser, 'fileStem', @(x) ischar(x) || isstring(x));
    addParameter(parser, 'DataDir', '', @(x) ischar(x) || isstring(x));
    addParameter(parser, 'Signal', '', @(x) ischar(x) || isstring(x));
    addParameter(parser, 'ScanNumbers', [], @(x) isnumeric(x) && isvector(x) ...
        && all(isfinite(x)) && all(x >= 1) && all(mod(x, 1) == 0));

    parse(parser, fileStem, varargin{:});

    fileStem = char(parser.Results.fileStem);
    dataDir = char(parser.Results.DataDir);
    legacySignal = strtrim(char(parser.Results.Signal));
    requestedScans = unique(double(parser.Results.ScanNumbers(:))', 'stable');

    if ~isempty(legacySignal)
        warning('interpolate_average_stem:SignalIgnored', ...
            "Parameter 'Signal' is ignored; plotting both TFY and HERFD.");
    end

    fileStem = strtrim(fileStem);
    useDefaultExportStem = isempty(fileStem);
    if useDefaultExportStem
        stemLabel = 'extract_*';
        outputStemLabel = 'extract_';
    else
        stemLabel = fileStem;
        outputStemLabel = fileStem;
    end

    outDataName = [outputStemLabel, '.txt'];

    if isempty(strtrim(dataDir))
        dataDir = default_data_dir();
    end

    if ~isfolder(dataDir)
        error("Data directory does not exist: %s", dataDir);
    end

    txtFiles = dir(fullfile(dataDir, "*.txt"));
    if isempty(txtFiles)
        error("No .txt files found in %s", dataDir);
    end

    names = {txtFiles.name};
    if useDefaultExportStem
        isMatch = startsWith(names, 'extract_') & contains(names, '_RIXS_');
    else
        isMatch = contains(names, fileStem);
    end

    % Do not include the output file from previous runs.
    isMatch = isMatch & ~strcmp(names, outDataName);

    matchNames = names(isMatch);
    if isempty(matchNames)
        if useDefaultExportStem
            error("No extract_* files containing '_RIXS_' were found in %s", dataDir);
        else
            error("No files containing stem '%s' were found in %s", fileStem, dataDir);
        end
    end

    matchNames = sort(matchNames);
    matchScans = nan(size(matchNames));
    for k = 1:numel(matchNames)
        matchScans(k) = extract_scan_number(matchNames{k});
    end

    finiteIdx = isfinite(matchScans);
    if any(finiteIdx)
        finiteNames = matchNames(finiteIdx);
        finiteScans = matchScans(finiteIdx);
        [~, orderFinite] = sort(finiteScans);
        finiteNames = finiteNames(orderFinite);

        nonFiniteNames = sort(matchNames(~finiteIdx));
        matchNames = [finiteNames, nonFiniteNames];
    end

    if ~isempty(requestedScans)
        allScanNumbers = nan(size(matchNames));
        for k = 1:numel(matchNames)
            allScanNumbers(k) = extract_scan_number(matchNames{k});
        end

        selectedNames = {};
        selectedScans = [];
        for s = requestedScans
            idx = find(allScanNumbers == s);
            if isempty(idx)
                warning('interpolate_average_stem:MissingScan', ...
                    "Requested scan %d is missing for stem '%s' in %s", s, stemLabel, dataDir);
                continue;
            end

            if numel(idx) > 1
                warning('interpolate_average_stem:DuplicateScan', ...
                    "Multiple files found for scan %d; using %s", s, matchNames{idx(1)});
            end

            selectedNames{end + 1} = matchNames{idx(1)}; %#ok<AGROW>
            selectedScans(end + 1) = s; %#ok<AGROW>
        end

        if isempty(selectedNames)
            error("None of the requested scans were found for stem '%s' in %s", stemLabel, dataDir);
        end

        matchNames = selectedNames;
    else
        selectedScans = [];
    end

    nFiles = numel(matchNames);

    spectra = cell(nFiles, 1);
    eMin = zeros(nFiles, 1);
    eMax = zeros(nFiles, 1);
    eStep = zeros(nFiles, 1);

    for k = 1:nFiles
        filePath = fullfile(dataDir, matchNames{k});
        spectra{k} = read_spectrum(filePath);

        eMin(k) = min(spectra{k}.E);
        eMax(k) = max(spectra{k}.E);

        dE = diff(spectra{k}.E);
        dE = dE(dE > 0 & isfinite(dE));
        if isempty(dE)
            error("File has insufficient unique E points for interpolation: %s", filePath);
        end
        eStep(k) = median(dE);
    end

    signalNames = spectra{1}.SignalNames;
    for k = 2:nFiles
        if ~isequal(signalNames, spectra{k}.SignalNames)
            error("Signal columns are inconsistent across matching files.");
        end
    end

    if ~any(strcmpi(signalNames, 'HERFD')) || ~any(strcmpi(signalNames, 'TFY'))
        available = strjoin(signalNames, ', ');
        error("Matching files must include HERFD and TFY columns. Found: %s", available);
    end

    commonMin = max(eMin);
    commonMax = min(eMax);
    if commonMin >= commonMax
        error("Matching files do not have an overlapping E range.");
    end

    commonStep = min(eStep);
    nGrid = floor((commonMax - commonMin) / commonStep) + 1;
    commonE = commonMin + (0:nGrid-1)' * commonStep;

    nSignals = numel(signalNames);
    interpData = nan(numel(commonE), nSignals, nFiles);

    for k = 1:nFiles
        for j = 1:nSignals
            interpData(:, j, k) = interp1( ...
                spectra{k}.E, spectra{k}.Signals(:, j), commonE, 'linear', nan);
        end
    end

    avgTable = table(commonE);
    avgTable.Properties.VariableNames = {'E'};
    for j = 1:nSignals
        avgCol = mean(interpData(:, j, :), 3, 'omitnan');
        stdCol = std(interpData(:, j, :), 0, 3, 'omitnan');

        avgCol = avgCol(:);
        stdCol = stdCol(:);

        avgName = matlab.lang.makeValidName([signalNames{j}, '_mean']);
        stdName = matlab.lang.makeValidName([signalNames{j}, '_std']);

        avgTable.(avgName) = avgCol;
        avgTable.(stdName) = stdCol;
    end

    signalsToPlot = {'TFY', 'HERFD'};
    plotIdx = zeros(1, numel(signalsToPlot));
    for p = 1:numel(signalsToPlot)
        idx = find(strcmpi(signalNames, signalsToPlot{p}), 1);
        if isempty(idx)
            available = strjoin(signalNames, ', ');
            error("Required signal '%s' not found. Available: %s", signalsToPlot{p}, available);
        end
        plotIdx(p) = idx;
    end

    fig = figure('Color', 'w', 'Name', sprintf('Average: %s', stemLabel));
    t = tiledlayout(fig, 1, 2, 'TileSpacing', 'compact', 'Padding', 'compact');

    for p = 1:numel(plotIdx)
        nexttile(t, p);
        hold on;

        rawHandle = gobjects(0);
        for k = 1:nFiles
            h = plot(commonE, interpData(:, plotIdx(p), k), 'Color', [0.75 0.75 0.75], 'LineWidth', 0.8);
            if isempty(rawHandle)
                rawHandle = h;
            end
        end

        avgName = matlab.lang.makeValidName([signalNames{plotIdx(p)}, '_mean']);
        avgHandle = plot(commonE, avgTable.(avgName), 'k-', 'LineWidth', 2.0);

        grid on;
        xlabel('E');
        ylabel(signalNames{plotIdx(p)});
        title(signalNames{plotIdx(p)}, 'Interpreter', 'none');
        legend([rawHandle avgHandle], {'Interpolated scans', 'Average'}, 'Location', 'best');
    end

    title(t, sprintf('Interpolated Averages: %s (%d files)', stemLabel, nFiles), ...
        'Interpreter', 'none');

    outStem = outputStemLabel;
    outDataFile = fullfile(dataDir, [outStem, '.txt']);
    outPlotFile = fullfile(dataDir, [outStem, '.png']);

    write_average_table(avgTable, outDataFile);
    exportgraphics(fig, outPlotFile, 'Resolution', 150);

    fprintf("Matched files: %d\n", nFiles);
    fprintf("Average data: %s\n", outDataFile);
    fprintf("Plot image:    %s\n", outPlotFile);

    result = struct();
    result.FileStem = stemLabel;
    result.DataDir = dataDir;
    result.MatchedFiles = matchNames;
    result.RequestedScanNumbers = requestedScans;
    result.UsedScanNumbers = selectedScans;
    result.SignalNames = signalNames;
    result.PlotSignals = signalsToPlot;
    result.CommonE = commonE;
    result.AverageTable = avgTable;
    result.OutputDataFile = outDataFile;
    result.OutputPlotFile = outPlotFile;
end

function write_average_table(avgTable, outDataFile)
    try
        writetable(avgTable, outDataFile, 'FileType', 'text', 'Delimiter', char(9));
    catch writeErr
        warning('interpolate_average_stem:WriteTableFallback', ...
            "writetable failed (%s). Falling back to manual writer.", writeErr.message);

        fid = fopen(outDataFile, 'w');
        if fid < 0
            rethrow(writeErr);
        end

        cleaner = onCleanup(@() fclose(fid));

        varNames = avgTable.Properties.VariableNames;
        fprintf(fid, '%s', varNames{1});
        for c = 2:numel(varNames)
            fprintf(fid, '\t%s', varNames{c});
        end
        fprintf(fid, '\n');

        data = table2array(avgTable);
        for r = 1:size(data, 1)
            fprintf(fid, '%.15g', data(r, 1));
            for c = 2:size(data, 2)
                fprintf(fid, '\t%.15g', data(r, c));
            end
            fprintf(fid, '\n');
        end

        clear cleaner;
    end
end

function scanNum = extract_scan_number(fileName)
    token = regexp(fileName, '_RIXS_(\d+)', 'tokens', 'once');
    if isempty(token)
        scanNum = nan;
    else
        scanNum = str2double(token{1});
    end
end

function dataDir = default_data_dir()
    dataDir = pwd;

    if ~isfolder(dataDir)
        error("Current working directory does not exist: %s", dataDir);
    end
end

function spec = read_spectrum(filePath)
    opts = detectImportOptions(filePath, 'FileType', 'text');
    opts = setvartype(opts, 'double');
    t = readtable(filePath, opts);

    if isempty(t) || width(t) < 2
        error("Unexpected file format (need E + signal columns): %s", filePath);
    end

    varNames = t.Properties.VariableNames;
    eIdx = find(strcmpi(varNames, "E"), 1);
    if isempty(eIdx)
        eIdx = 1;
    end

    signalIdx = setdiff(1:width(t), eIdx, 'stable');
    signalNames = varNames(signalIdx);

    E = t{:, eIdx};
    Y = t{:, signalIdx};

    valid = isfinite(E) & all(isfinite(Y), 2);
    E = E(valid);
    Y = Y(valid, :);

    [E, order] = sort(E);
    Y = Y(order, :);

    [E, uniqueIdx] = unique(E, 'stable');
    Y = Y(uniqueIdx, :);

    if numel(E) < 2
        error("Not enough unique E points in file: %s", filePath);
    end

    spec = struct();
    spec.E = E;
    spec.Signals = Y;
    spec.SignalNames = signalNames;
end