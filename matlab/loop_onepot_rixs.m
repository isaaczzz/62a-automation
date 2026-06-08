clear; clc; close all
%parpool(6);

addpath /sdf/group/ssrl/dsokaras/bl6-2a/tender_data/Analysis/MATLAB/;
addpath /sdf/group/ssrl/dsokaras/bl6-2a/tender_data/Analysis/MATLAB/sifFiles;

% 2025-11 values
% Ag La
% integration_window = 13;
% integration_center = 1275;
% S K
% integration_window = 5;
% integration_center = 1132;
% Sc K
% integration_window = 11;prefix = sample + suffix;
% integration_center = 1393;

% 2026-6 values
% Sc K
integration_window = 11;
integration_center = 1498;

scans = 1:15;

data_dir_2025 = "2025-11_Tender/2025-11_Tender/";
data_dir_2026 = "2026-03_Tender/";
data_dir_2026_6 = "2026-06_Tender/";

% data_dir = fullfile(data_dir_2026, sample_dir);

% sample_dirs = ["P1PA_1pc_BN", "Sc2O3_1pc_BN"];
sample_dirs = ["P2PA_BN"];
suffix = "_ScKa_RIXS_";

data_dir = data_dir_2026_6;
for sample = sample_dirs
    prefix = "P2PA_1pc_BN" + suffix;
% 	prefix = sample + suffix;
    data_dir = fullfile(data_dir, sample);
    run_rixs_batch(data_dir, prefix,integration_window, integration_center, scans);
end

function run_rixs_batch(data_dir, prefix, integration_window, integration_center, scans)
%RUN_RIXS_BATCH  Run onepotRIXS over a batch of scans in a given directory.
%
%   run_rixs_batch(data_dir, prefix, integration_window, integration_center, scans)
%
%   Inputs:
%       data_dir            - subdirectory under:
%                             '/sdf/group/ssrl/dsokaras/bl6-2a/tender_data'
%       prefix              - filename prefix before scan number
%       integration_window  - integration window (numeric)
%       integration_center  - integration center (numeric)
%       scans               - array of scan numbers (e.g., 1:5)
%
%   Example:
%       run_rixs_batch("2025-11_Tender/2025-11_Tender/P1APA_1pc_BN/", ...
%                      "P1APA_1pc_BN_ScKa_RIXS_", 9, 1393, 1:5);
    base_dir = "/sdf/group/ssrl/dsokaras/bl6-2a/tender_data/";
    full_path = fullfile(base_dir, data_dir);

    if ~isfolder(full_path)
        error("Directory does not exist: %s", full_path);
    end

    % Move into the data directory
    original_dir = pwd;
    cd(full_path);

    % Loop through scans
    for k = scans
        try
            pattern = sprintf('%s%02d*', prefix, k);
            onepotRIXS(pattern, integration_window, integration_center);
        catch ME
            warning("Scan %d failed: %s", k, ME.message);
        end
    end

    % Return to original directory
    cd(original_dir);
end
