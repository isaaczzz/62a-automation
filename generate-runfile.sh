#!/usr/bin/env sh

# Generate a MATLAB run file for RIXS scans with serpentine Sx/Sy stepping.
#
# Usage:
#   ./generate-runfile.sh OUTPUT_FILE PREFIX START_RUN START_VERT START_SX DELTA_VERT DELTA_SX [N_ROWS] [N_COLS]
#
# Example:
#   ./generate-runfile.sh reference-runfiles/generated_run.m 2SB2 1 67.6 -7.2 1.0 0.5 3 3

set -eu

if [ "$#" -lt 7 ] || [ "$#" -gt 9 ]; then
    echo "Usage: $0 OUTPUT_FILE PREFIX START_RUN START_VERT START_SX DELTA_VERT DELTA_SX [N_ROWS] [N_COLS]" >&2
    exit 1
fi

out_file="$1"
prefix="$2"
start_run="$3"
start_vert="$4"
start_sx="$5"
delta_vert="$6"
delta_sx="$7"
n_rows="${8:-3}"
n_cols="${9:-3}"

case "$start_run" in
    ''|*[!0-9]*)
        echo "START_RUN must be a non-negative integer." >&2
        exit 1
        ;;
esac

case "$n_rows" in
    ''|*[!0-9]*)
        echo "N_ROWS must be a positive integer." >&2
        exit 1
        ;;
esac

case "$n_cols" in
    ''|*[!0-9]*)
        echo "N_COLS must be a positive integer." >&2
        exit 1
        ;;
esac

if [ "$n_rows" -le 0 ] || [ "$n_cols" -le 0 ]; then
    echo "N_ROWS and N_COLS must be > 0." >&2
    exit 1
fi

total_points=$((n_rows * n_cols))

if ! command -v awk >/dev/null 2>&1; then
    echo "awk is required but was not found in PATH." >&2
    exit 1
fi

mul_float() {
    awk -v a="$1" -v b="$2" 'BEGIN{printf "%.12g", a*b}'
}

scan_tail='2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1'

{
    printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n\n'
    printf 'mv vert %s\n' "$start_vert"
    printf 'mv Sx %s\n' "$start_sx"
    printf 'mv Sy %s\n\n' "$start_sx"
    printf 'go_S_Ka\n\n'

    run_num="$start_run"
    point_idx=1
    sx_dir=1

    while [ "$point_idx" -le "$total_points" ]; do
        run_suffix=$(printf '%02d' "$run_num")

        printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
        printf 'rixs %s_SKa_RIXS_%s %s\n\n' "$prefix" "$run_suffix" "$scan_tail"

        run_num=$((run_num + 1))

        if [ "$point_idx" -lt "$total_points" ]; then
            if [ $((point_idx % n_cols)) -eq 0 ]; then
                printf 'mvr vert %s\n\n' "$delta_vert"
                sx_dir=$((sx_dir * -1))
            else
                signed_dx=$(mul_float "$delta_sx" "$sx_dir")
                printf 'mvr Sx %s\n' "$signed_dx"
                printf 'mvr Sy %s\n\n' "$signed_dx"
            fi
        fi

        if [ $((point_idx % 9)) -eq 0 ]; then
            printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
            printf 'close all %% need this otherwise process will freeze once n>19\n\n'
        fi

        point_idx=$((point_idx + 1))
    done
} >"$out_file"

echo "Generated $out_file"
