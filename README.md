# Helpers for SSRL beamline 6-2a

Utilities for planning sample spots, modularly generating runfiles for XAS/XES acquisitions, and post-processing data in MATLAB.

Disclaimer: We have tried to vet the code in this repo for robustness and have tested the basic functionality during one live experimental run, but make no guarantees about reliability.

## Workflow Overview

0. Survey samples manually to find the maximum useable `vert` and `Sx` range for each.
1. Generate a list of absolute sample coordinates with [script/spot_calc.sh](script/spot_calc.sh).
2. For safety, manually check the top and bottom `vert` positions using `dscan` to ensure all `Sx` points are valid.
3. Build a runfile using [script/generate_xas_run.sh](script/generate_xas_run.sh) and/or [script/generate_xas_run.sh](script/generate_xes_run.sh).

## Generate Spots

Use [script/spot_calc.sh](script/spot_calc.sh) to create a coordinate list (default: spots.txt).

```bash
./script/spot_calc.sh VMIN VMAX SMIN SMAX VSTEP SSTEP [SPOTS_FILE]
```

Example:

```bash
./script/spot_calc.sh -2.5 2.5 -2.5 2.5 0.5 0.5 spots.txt
```

Output behavior:

- Writes a header with geometry metadata (VMIN/VMAX/SMIN/SMAX/VSTEP/SSTEP).
- Writes one `vert Sx` pair per valid spot.

The resultant SPOTS_FILE has one header row and two columns of data.

## Generate XAS Runfile

Use [script/generate_xas_run.sh](script/generate_xas_run.sh) to create a MATLAB RIXS/HERFD-XAS runfile.

```bash
./script/generate_xas_run.sh [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT [SPOTS_FILE] [START_RUN] [NUM_SPOTS]
```

Example:

```bash
./script/generate_xas_run.sh --overwrite reference-runfiles/generated_xas_run.m SHB2 S spots.txt 1 9
```

Notes:

- `ELEMENT` is `S` or `Ag`.
- `NUM_SPOTS` is optional; if omitted, all available spots are used.
- If not all spots are used, an unused-spots file is written next to `SPOTS_FILE` with suffix `_unused`.

## Generate XES Runfile

Use [script/generate_xes_run.sh](script/generate_xes_run.sh) to create a MATLAB XES runfile.

```bash
./script/generate_xes_run.sh [--append|--overwrite] [--start-repeat N] OUTPUT_FILE STEM ELEMENT ENERGIES [REPEATS] [SPOTS_FILE]
```

Examples:

```bash
./script/generate_xes_run.sh --overwrite reference-runfiles/generated_xes_run.m SHB2 S "2472.3 2473.5 2476.0" 4 spots.txt
./script/generate_xes_run.sh --append --start-repeat 5 reference-runfiles/generated_xes_run.m SHB2 Ag "3340 3352 3359" 3 spots.txt
```

Important behavior:

- `REPEATS` defaults to `4` when omitted.
- Spot usage is global and unique across all energies.
- Required unique spots = number of energies × repeats.
- The script exits with an error if `SPOTS_FILE` does not contain enough valid coordinates.
- If extra spots remain, an unused-spots file is written next to `SPOTS_FILE` with suffix `_unused`.

## Typical Tandem Usage

```bash
# 1) Build the spot list once
./script/spot_calc.sh -2.5 2.5 -2.5 2.5 0.5 0.5 spots.txt

# 2) Generate an XAS runfile from those spots
./script/generate_xas_run.sh --overwrite reference-runfiles/run_xas.m SHB2 S spots.txt 1 9

# 3) Generate an XES runfile from the same spot source
./script/generate_xes_run.sh --overwrite reference-runfiles/run_xes.m SHB2 S "2472.3 2473.5 2476.0" 3 spots.txt
```

## MATLAB Helpers

Core MATLAB helpers are in [matlab](matlab):

- [matlab/run_rixs_batch.m](matlab/run_rixs_batch.m): batch wrapper for `onepotRIXS_iz` over matching `*RIXS*.sif` files; supports no-argument current-directory mode and grouped wildcard execution.
- [matlab/onepotRIXS_iz.m](matlab/onepotRIXS_iz.m): HERFD extraction wrapper around `onepot_iz`; supports explicit output-file naming.
- [matlab/onepot_iz.m](matlab/onepot_iz.m): lower-level SIF analysis and correction routine.
- [matlab/interpolate_average_stem.m](matlab/interpolate_average_stem.m): interpolates/averages extracted spectra, writes `<stem>.txt`, and saves side-by-side TFY/HERFD plot `<stem>.png`.
- [matlab/plot_average_xas.m](matlab/plot_average_xas.m): plots TFY/HERFD average curves from one or more averaged text outputs.
- [matlab/addpaths.m](matlab/addpaths.m): helper for MATLAB path setup.
- [matlab/loop_onepot_rixs.m](matlab/loop_onepot_rixs.m): example script-style batch execution workflow.

Minimal MATLAB flow after data collection:

```matlab
addpaths;
run_rixs_batch;                      % process matching RIXS SIF files in current directory
r = interpolate_average_stem;        % average extract_* outputs in current directory
plot_average_xas(r.OutputDataFile);  % visualize the generated average file
```