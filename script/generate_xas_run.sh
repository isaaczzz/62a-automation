#!/usr/bin/env sh

# Generate a MATLAB run file for RIXS scans from explicit spot coordinates.
#
# Usage:
#   ./generate_xas_run.sh [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT [SPOTS_FILE] [START_RUN] [NUM_SPOTS]
#
# Example:
#   ./generate_xas_run.sh --overwrite reference-runfiles/generated_run.m 2SB2 S
#   ./generate_xas_run.sh --overwrite reference-runfiles/generated_run.m 2SB2 S spots.txt 1 9

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

if [ "$#" -lt 3 ] || [ "$#" -gt 6 ]; then
    echo "Usage: $0 [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT [SPOTS_FILE] [START_RUN] [NUM_SPOTS]" >&2
    exit 1
fi

out_file="$1"
prefix="$2"
element="$3"
spots_file="spots.txt"
start_run="1"
requested_spots=""

shift 3
if [ "$#" -gt 0 ]; then
    case "$1" in
        ''|*[!0-9]*)
            spots_file="$1"
            shift
            ;;
    esac
fi

if [ "$#" -gt 0 ]; then
    start_run="$1"
    shift
fi

if [ "$#" -gt 0 ]; then
    requested_spots="$1"
    shift
fi

if [ "$#" -gt 0 ]; then
    echo "Too many positional arguments." >&2
    echo "Usage: $0 [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT [SPOTS_FILE] [START_RUN] [NUM_SPOTS]" >&2
    exit 1
fi

output_name="${out_file##*/}"
output_stem="$output_name"
case "$output_stem" in
    *.*) output_stem="${output_stem%.*}" ;;
esac

case "$start_run" in
    ''|*[!0-9]*)
        echo "START_RUN must be a positive integer." >&2
        exit 1
        ;;
esac

if [ "$start_run" -le 0 ]; then
    echo "START_RUN must be >= 1." >&2
    exit 1
fi

if [ -n "$requested_spots" ]; then
    case "$requested_spots" in
        ''|*[!0-9]*)
            echo "NUM_SPOTS must be a positive integer." >&2
            exit 1
            ;;
    esac

    if [ "$requested_spots" -le 0 ]; then
        echo "NUM_SPOTS must be >= 1." >&2
        exit 1
    fi
fi

if [ ! -f "$spots_file" ]; then
    echo "Spots file not found: $spots_file" >&2
    exit 1
fi

if ! command -v awk >/dev/null 2>&1; then
    echo "awk is required but was not found in PATH." >&2
    exit 1
fi

spots_header=$(awk '/^#/ {print; exit}' "$spots_file")
scan_meta_vmin=''
scan_meta_vmax=''
scan_meta_smin=''
scan_meta_smax=''
scan_meta_vstep=''
scan_meta_sstep=''

if [ -n "$spots_header" ]; then
    parse_header_field() {
        awk -v key="$1" -v line="$spots_header" 'BEGIN{if (match(line, key"=([^ ]+)", m)) print m[1]}'
    }
    scan_meta_vmin=$(parse_header_field 'VMIN')
    scan_meta_vmax=$(parse_header_field 'VMAX')
    scan_meta_smin=$(parse_header_field 'SMIN')
    scan_meta_smax=$(parse_header_field 'SMAX')
    scan_meta_vstep=$(parse_header_field 'VSTEP')
    scan_meta_sstep=$(parse_header_field 'SSTEP')
fi

available_spots=$(awk '
BEGIN{count=0}
{
    line=$0
    sub(/^[[:space:]]+/, "", line)
    if (line == "" || substr(line,1,1) == "#") next
    if (NF < 2) next
    if ($1 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ && $2 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) count++
}
END{print count}
' "$spots_file")

if [ "$available_spots" -le 0 ]; then
    echo "No valid coordinate rows found in $spots_file" >&2
    exit 1
fi

if [ -n "$requested_spots" ]; then
    if [ "$requested_spots" -gt "$available_spots" ]; then
        echo "Requested NUM_SPOTS ($requested_spots) exceeds available spots ($available_spots)." >&2
        exit 1
    fi
    spots_to_use="$requested_spots"
else
    spots_to_use="$available_spots"
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

selected_spots_stream() {
    awk -v max="$spots_to_use" '
    BEGIN{count=0}
    {
        line=$0
        sub(/^[[:space:]]+/, "", line)
        if (line == "" || substr(line,1,1) == "#") next
        if (NF < 2) next
        if ($1 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ && $2 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) {
            print $1, $2
            count++
            if (count >= max) exit
        }
    }
    ' "$spots_file"
}

unused_spots_stream() {
    awk -v skip="$spots_to_use" '
    BEGIN{count=0}
    {
        line=$0
        sub(/^[[:space:]]+/, "", line)
        if (line == "" || substr(line,1,1) == "#") next
        if (NF < 2) next
        if ($1 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ && $2 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) {
            count++
            if (count > skip) printf "%.6f\t%.6f\n", $1, $2
        }
    }
    ' "$spots_file"
}

unused_spots_file() {
    base_name=$(basename -- "$spots_file")
    base_dir=$(dirname -- "$spots_file")
    case "$base_name" in
        *.*)
            stem=${base_name%.*}
            ext=.${base_name##*.}
            ;;
        *)
            stem=$base_name
            ext=''
            ;;
    esac
    printf '%s/%s_unused%s\n' "$base_dir" "$stem" "$ext"
}

emit_content() {
    printf '%% ---------- herfd xas lol ----------\n'
    printf '%% %-14s %s\n' 'output_stem:' "$output_stem"
    printf '%% %-14s %s\n' 'prefix:' "$prefix"
    printf '%% %-14s %s\n' 'element:' "$element"
    printf '%% %-14s %s\n' 'spots_file:' "$spots_file"
    printf '%% %-14s %s\n' 'start_run:' "$start_run"
    if [ -n "$scan_meta_vmin" ] || [ -n "$scan_meta_vmax" ] || [ -n "$scan_meta_smin" ] || [ -n "$scan_meta_smax" ] || [ -n "$scan_meta_vstep" ] || [ -n "$scan_meta_sstep" ]; then
        printf '%% %-14s %s\n' 'VMIN:' "$scan_meta_vmin"
        printf '%% %-14s %s\n' 'VMAX:' "$scan_meta_vmax"
        printf '%% %-14s %s\n' 'SMIN:' "$scan_meta_smin"
        printf '%% %-14s %s\n' 'SMAX:' "$scan_meta_smax"
        printf '%% %-14s %s\n' 'VSTEP:' "$scan_meta_vstep"
        printf '%% %-14s %s\n' 'SSTEP:' "$scan_meta_sstep"
    fi
    printf '%% %-14s %s\n\n' 'num_spots:' "$spots_to_use"
    printf 'close all\n\n'
    printf '%s\n\n' "$go_cmd"

    run_num="$start_run"
    point_idx=1

    selected_spots_stream | while IFS=' ' read -r vert sx; do
        run_suffix=$(printf '%02d' "$run_num")

        printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
        printf 'mv vert %s\n' "$vert"
        printf 'mv Sx %s\n' "$sx"
        printf 'mv Sy %s\n' "$sx"
        printf 'rixs %s_%s_RIXS_%s %s\n\n' "$prefix" "$rixs_tag" "$run_suffix" "$scan_tail"

        run_num=$((run_num + 1))

        if [ $((point_idx % 9)) -eq 0 ]; then
            printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
            printf 'close all\n\n'
        fi

        point_idx=$((point_idx + 1))
    done
}

print_spot_table() {
    printf '\n'
    printf 'SPOTS SOURCE: %s\n' "$spots_file"
    printf '%-6s %-6s %-12s %-12s\n' 'INDEX' 'RUN' 'VERT' 'SX'
    printf '%-6s %-6s %-12s %-12s\n' '-----' '---' '----' '--'

    awk -v max="$spots_to_use" -v run0="$start_run" '
    BEGIN{idx=0}
    {
        line=$0
        sub(/^[[:space:]]+/, "", line)
        if (line == "" || substr(line,1,1) == "#") next
        if (NF < 2) next
        if ($1 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ && $2 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) {
            idx++
            runIdx = run0 + idx - 1
            printf "%-6d %-6d %-12.6f %-12.6f\n", idx, runIdx, $1, $2
            if (idx >= max) exit
        }
    }
    ' "$spots_file"

    printf 'TOTAL SPOTS USED: %s\n' "$spots_to_use"
}

write_unused_spots_file() {
    if [ "$spots_to_use" -ge "$available_spots" ]; then
        return
    fi

    out_unused=$(unused_spots_file)
    {
        if [ -n "$spots_header" ]; then
            printf '%s\n' "$spots_header"
        else
            printf '# Generated from %s\n' "$spots_file"
        fi
        unused_spots_stream
    } >"$out_unused"

    echo "Wrote unused spots: $out_unused"
}

if [ "$append_mode" -eq 1 ]; then
    emit_content >>"$out_file"
elif [ "$overwrite_mode" -eq 1 ]; then
    emit_content >"$out_file"
else
    emit_content >"$out_file"
fi

echo "Generated $out_file"
print_spot_table
write_unused_spots_file
