#!/usr/bin/env sh

# Generate a MATLAB run file for RIXS scans with serpentine Sx/Sy stepping.
#
# Usage:
#   ./generate-runfile.sh [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT START_RUN START_VERT START_SX DELTA_VERT DELTA_SX [N_ROWS] [N_COLS]
#
# Example:
#   ./generate-runfile.sh --overwrite reference-runfiles/generated_run.m 2SB2 S 1 67.6 -7.2 1.0 0.5 3 3

set -eu

append_mode=0
overwrite_mode=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        --append|-a)
            append_mode=1
            shift
            ;;
        --overwrite|-o)
            overwrite_mode=1
            shift
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Unknown flag: $1" >&2
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

if [ "$append_mode" -eq 1 ] && [ "$overwrite_mode" -eq 1 ]; then
    echo "Use only one of --append or --overwrite." >&2
    exit 1
fi

if [ "$#" -lt 8 ] || [ "$#" -gt 10 ]; then
    echo "Usage: $0 [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT START_RUN START_VERT START_SX DELTA_VERT DELTA_SX [N_ROWS] [N_COLS]" >&2
    exit 1
fi

out_file="$1"
prefix="$2"
element="$3"
start_run="$4"
start_vert="$5"
start_sx="$6"
delta_vert="$7"
delta_sx="$8"
n_rows="${9:-3}"
n_cols="${10:-3}"

output_name="${out_file##*/}"
output_stem="$output_name"
case "$output_stem" in
    *.*) output_stem="${output_stem%.*}" ;;
esac

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

case "$element" in
    S)
        go_cmd='go_S_Ka'
        rixs_tag='SKa'
        scan_tail='2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1'
        ;;
    Ag)
        go_cmd='go_Ag_La'
        rixs_tag='AgLa'
        scan_tail='3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7'
        ;;
    *)
        echo "ELEMENT must be either S or Ag." >&2
        exit 1
        ;;
esac

if [ -e "$out_file" ] && [ "$append_mode" -eq 0 ] && [ "$overwrite_mode" -eq 0 ]; then
    echo "Target file already exists: $out_file" >&2
    echo "Use --append to append or --overwrite to replace." >&2
    exit 1
fi

mul_float() {
    awk -v a="$1" -v b="$2" 'BEGIN{printf "%.12g", a*b}'
}

emit_content() {
    printf '%% ---------- herfd xas lol ----------\n'
    printf '%% %-14s %s\n' 'output_stem:' "$output_stem"
    printf '%% %-14s %s\n' 'prefix:' "$prefix"
    printf '%% %-14s %s\n' 'element:' "$element"
    printf '%% %-14s %s\n' 'start_run:' "$start_run"
    printf '%% %-14s %s\n' 'start_vert:' "$start_vert"
    printf '%% %-14s %s\n' 'start_sx:' "$start_sx"
    printf '%% %-14s %s\n' 'delta_vert:' "$delta_vert"
    printf '%% %-14s %s\n' 'delta_sx:' "$delta_sx"
    printf '%% %-14s %s\n' 'n_rows:' "$n_rows"
    printf '%% %-14s %s\n\n' 'n_cols:' "$n_cols"
    printf 'close all\n\n'
    printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n\n'
    printf 'mv vert %s\n' "$start_vert"
    printf 'mv Sx %s\n' "$start_sx"
    printf 'mv Sy %s\n\n' "$start_sx"
    printf '%s\n\n' "$go_cmd"

    run_num="$start_run"
    point_idx=1
    sx_dir=1

    while [ "$point_idx" -le "$total_points" ]; do
        run_suffix=$(printf '%02d' "$run_num")

        printf 'SPEC_connect();\n'
        printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
        printf 'rixs %s_%s_RIXS_%s %s\n\n' "$prefix" "$rixs_tag" "$run_suffix" "$scan_tail"

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
            printf 'close all\n\n'
        fi

        point_idx=$((point_idx + 1))
    done
}

if [ "$append_mode" -eq 1 ]; then
    emit_content >>"$out_file"
elif [ "$overwrite_mode" -eq 1 ]; then
    emit_content >"$out_file"
else
    emit_content >"$out_file"
fi

echo "Generated $out_file"
