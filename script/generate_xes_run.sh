#!/usr/bin/env sh

# Generate a MATLAB run file for XES scans from explicit spot coordinates.
#
# Usage:
#   ./generate_xes_run.sh [--append|--overwrite] [--start-repeat N] OUTPUT_FILE STEM ELEMENT ENERGIES [REPEATS] [SPOTS_FILE]
#
# Examples:
#   ./generate_xes_run.sh --overwrite reference-runfiles/generated_xes_run.m SHB2 S 2472.3,2473.5,2476
#   ./generate_xes_run.sh --overwrite reference-runfiles/generated_xes_run.m SHB2 Ag "3340 3352 3359" 2 my_spots.txt

set -eu

append_mode=0
overwrite_mode=0
start_repeat_specified=0
start_repeat=''

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
        --start-repeat|-r)
            if [ "$#" -lt 2 ]; then
                echo "--start-repeat requires an integer argument." >&2
                exit 1
            fi
            start_repeat_specified=1
            start_repeat="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        -* )
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

if [ "$#" -lt 4 ] || [ "$#" -gt 6 ]; then
    echo "Usage: $0 [--append|--overwrite] [--start-repeat N] OUTPUT_FILE STEM ELEMENT ENERGIES [REPEATS] [SPOTS_FILE]" >&2
    exit 1
fi

out_file="$1"
stem="$2"
element="$3"
energies_arg="$4"
repeats="4"
spots_file="spots.txt"

if [ "$#" -eq 5 ]; then
    case "$5" in
        ''|*[!0-9]*)
            spots_file="$5"
            ;;
        *)
            repeats="$5"
            ;;
    esac
elif [ "$#" -eq 6 ]; then
    arg5="$5"
    arg6="$6"
    case "$arg5" in
        ''|*[!0-9]*)
            spots_file="$arg5"
            case "$arg6" in
                ''|*[!0-9]*)
                    echo "When 6 args are provided, one of [REPEATS] and [SPOTS_FILE] must be numeric (REPEATS)." >&2
                    exit 1
                    ;;
                *)
                    repeats="$arg6"
                    ;;
            esac
            ;;
        *)
            repeats="$arg5"
            spots_file="$arg6"
            ;;
    esac
fi

if [ -z "$stem" ]; then
    echo "STEM cannot be empty." >&2
    exit 1
fi

case "$repeats" in
    ''|*[!0-9]*)
        echo "REPEATS must be a positive integer." >&2
        exit 1
        ;;
esac

if [ "$repeats" -le 0 ]; then
    echo "REPEATS must be >= 1." >&2
    exit 1
fi

if [ "$start_repeat_specified" -eq 1 ]; then
    case "$start_repeat" in
        ''|*[!0-9]*)
            echo "START_REPEAT must be a positive integer." >&2
            exit 1
            ;;
    esac

    if [ "$start_repeat" -le 0 ]; then
        echo "START_REPEAT must be >= 1." >&2
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

case "$element" in
    S)
        go_cmd='go_S_Kb'
        xes_tag='SKb'
        ;;
    Ag)
        go_cmd='go_Ag_L3val'
        xes_tag='AgL3val'
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

tmp_energies="$(mktemp "${TMPDIR:-/tmp}/generate_xes_energies.XXXXXX")"
tmp_existing_repeats="$(mktemp "${TMPDIR:-/tmp}/generate_xes_existing.XXXXXX")"
tmp_selected_spots="$(mktemp "${TMPDIR:-/tmp}/generate_xes_selected.XXXXXX")"
cleanup_tmp() {
    rm -f "$tmp_energies" "$tmp_existing_repeats" "$tmp_selected_spots"
}
trap cleanup_tmp EXIT INT TERM

if [ "$append_mode" -eq 1 ] && [ -f "$out_file" ]; then
    awk -v stem="$stem" -v tag="$xes_tag" '
    BEGIN {
        prefix = stem "_" tag "_"
    }
    {
        for (i = 1; i <= NF; i++) {
            if ($i == "acq" && i < NF) {
                name = $(i + 1)
                if (index(name, prefix) == 1) {
                    if (match(name, /_([0-9]+\.[0-9][0-9])eV_([0-9]+)$/, m)) {
                        energy = m[1]
                        repeat_idx = m[2] + 0
                        printf "%s %d\n", energy, repeat_idx
                    }
                }
            }
        }
    }
    ' "$out_file" >"$tmp_existing_repeats"
else
    : >"$tmp_existing_repeats"
fi

if ! printf '%s\n' "$energies_arg" | awk '
BEGIN{RS="[ ,\t\n]+"}
{
    if ($0 == "") next
    if ($0 !~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) {
        printf "Invalid energy value: %s\n", $0 > "/dev/stderr"
        exit 2
    }
    print $0
}
' >"$tmp_energies"; then
    echo "Failed to parse ENERGIES." >&2
    exit 1
fi

energy_count="$(awk 'END{print NR+0}' "$tmp_energies")"
if [ "$energy_count" -le 0 ]; then
    echo "No valid energies provided." >&2
    exit 1
fi

total_required_spots=$((energy_count * repeats))

available_spots="$(awk '
BEGIN{count=0}
{
    line=$0
    sub(/^[[:space:]]+/, "", line)
    if (line == "" || substr(line,1,1) == "#") next
    if (NF < 2) next
    if ($1 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/ && $2 ~ /^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/) count++
}
END{print count}
' "$spots_file")"

if [ "$available_spots" -le 0 ]; then
    echo "No valid coordinate rows found in $spots_file" >&2
    exit 1
fi

if [ "$available_spots" -lt "$total_required_spots" ]; then
    echo "Not enough unique spots in $spots_file: require $total_required_spots for $energy_count energies x $repeats repeats, found $available_spots." >&2
    exit 1
fi

awk -v max="$total_required_spots" '
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
' "$spots_file" >"$tmp_selected_spots"

selected_spot_count="$(awk 'END{print NR+0}' "$tmp_selected_spots")"
if [ "$selected_spot_count" -lt "$total_required_spots" ]; then
    echo "Failed to select enough unique spots from $spots_file (selected $selected_spot_count, required $total_required_spots)." >&2
    exit 1
fi

spots_header="$(awk '/^#/ {print; exit}' "$spots_file")"
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
    scan_meta_vmin="$(parse_header_field 'VMIN')"
    scan_meta_vmax="$(parse_header_field 'VMAX')"
    scan_meta_smin="$(parse_header_field 'SMIN')"
    scan_meta_smax="$(parse_header_field 'SMAX')"
    scan_meta_vstep="$(parse_header_field 'VSTEP')"
    scan_meta_sstep="$(parse_header_field 'SSTEP')"
fi

output_name="${out_file##*/}"
output_stem="$output_name"
case "$output_stem" in
    *.*) output_stem="${output_stem%.*}" ;;
esac

selected_spots_stream() {
    cat "$tmp_selected_spots"
}

unused_spots_stream() {
    awk -v skip="$total_required_spots" '
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
            stem_name=${base_name%.*}
            ext=.${base_name##*.}
            ;;
        *)
            stem_name=$base_name
            ext=''
            ;;
    esac
    printf '%s/%s_unused%s\n' "$base_dir" "$stem_name" "$ext"
}

existing_repeat_offset_for_energy() {
    awk -v e="$1" '
    $1 == e {
        if ($2 > max_repeat) max_repeat = $2
    }
    END {
        print max_repeat + 0
    }
    ' "$tmp_existing_repeats"
}

existing_repeat_exists() {
    awk -v e="$1" -v r="$2" '
    $1 == e && $2 == r {
        found = 1
        exit
    }
    END {
        if (found) {
            exit 0
        }
        exit 1
    }
    ' "$tmp_existing_repeats"
}

emit_content() {
    printf '%% ---------- xes run generated ----------\n'
    printf '%% %-14s %s\n' 'output_stem:' "$output_stem"
    printf '%% %-14s %s\n' 'stem:' "$stem"
    printf '%% %-14s %s\n' 'element:' "$element"
    printf '%% %-14s %s\n' 'spots_file:' "$spots_file"
    printf '%% %-14s %s\n' 'energies:' "$energies_arg"
    printf '%% %-14s %s\n' 'repeats:' "$repeats"
    if [ -n "$scan_meta_vmin" ] || [ -n "$scan_meta_vmax" ] || [ -n "$scan_meta_smin" ] || [ -n "$scan_meta_smax" ] || [ -n "$scan_meta_vstep" ] || [ -n "$scan_meta_sstep" ]; then
        printf '%% %-14s %s\n' 'VMIN:' "$scan_meta_vmin"
        printf '%% %-14s %s\n' 'VMAX:' "$scan_meta_vmax"
        printf '%% %-14s %s\n' 'SMIN:' "$scan_meta_smin"
        printf '%% %-14s %s\n' 'SMAX:' "$scan_meta_smax"
        printf '%% %-14s %s\n' 'VSTEP:' "$scan_meta_vstep"
        printf '%% %-14s %s\n' 'SSTEP:' "$scan_meta_sstep"
    fi
    printf '\n'
    printf 'close all\n\n'

    spot_cursor=1

    while IFS= read -r energy; do
        [ -z "$energy" ] && continue
        energy_fmt="$(awk -v e="$energy" 'BEGIN{printf "%.2f", e+0}')"

        printf '%% energy %seV\n' "$energy_fmt"
        printf '%s\n' "$go_cmd"
        printf 'mv mono %s\n\n' "$energy"

        if [ "$start_repeat_specified" -eq 1 ]; then
            repeat_idx="$start_repeat"
        else
            repeat_offset="$(existing_repeat_offset_for_energy "$energy_fmt")"
            repeat_idx=$((repeat_offset + 1))
        fi

        repeat_counter=1
        while [ "$repeat_counter" -le "$repeats" ]; do
            spot_line="$(sed -n "${spot_cursor}p" "$tmp_selected_spots")"
            if [ -z "$spot_line" ]; then
                echo "Ran out of unique spots while generating commands: used $((spot_cursor - 1)), required $total_required_spots." >&2
                exit 1
            fi
            set -- $spot_line
            vert="$1"
            sx="$2"

            repeat_suffix="$(printf '%02d' "$repeat_idx")"
            acq_name="${stem}_${xes_tag}_${energy_fmt}eV_${repeat_suffix}"

            if [ "$start_repeat_specified" -eq 1 ] && existing_repeat_exists "$energy_fmt" "$repeat_idx"; then
                echo "WARNING: Repeat ${repeat_suffix} for ${energy_fmt}eV already exists in $out_file; new entry will overwrite existing entry." >&2
            fi

            printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
            printf 'mv vert %s\n' "$vert"
            printf 'mv Sx %s\n' "$sx"
            printf 'mv Sy %s\n' "$sx"
            printf 'acq %s expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);\n\n' "$acq_name"

            repeat_idx=$((repeat_idx + 1))
            repeat_counter=$((repeat_counter + 1))
            spot_cursor=$((spot_cursor + 1))
        done

        printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n\n'
    done <"$tmp_energies"
}

print_spot_table() {
    printf '\n'
    printf 'SPOTS SOURCE: %s\n' "$spots_file"
    printf 'ENERGIES: %s\n' "$energies_arg"
    printf 'REPEATS PER ENERGY: %s\n' "$repeats"
    printf 'REQUIRED UNIQUE SPOTS: %s\n' "$total_required_spots"
    printf 'AVAILABLE SPOTS: %s\n' "$available_spots"
    if [ "$start_repeat_specified" -eq 1 ]; then
        printf 'STATUS: repeat index mode = explicit start at %s\n' "$start_repeat"
    elif [ "$append_mode" -eq 1 ] && [ -s "$tmp_existing_repeats" ]; then
        printf 'STATUS: repeat index mode = auto-continue from existing runfile\n'
    elif [ "$append_mode" -eq 1 ]; then
        printf 'STATUS: repeat index mode = append with no existing entries (start at 1)\n'
    else
        printf 'STATUS: repeat index mode = default start at 1\n'
    fi
    printf '%-8s %-12s %-12s\n' 'INDEX' 'VERT' 'SX'
    printf '%-8s %-12s %-12s\n' '-----' '----' '--'

    awk '
    BEGIN{idx=0}
    {
        idx++
        printf "%-8d %-12.6f %-12.6f\n", idx, $1, $2
    }
    ' "$tmp_selected_spots"

    total_acq="$total_required_spots"
    printf 'TOTAL UNIQUE SPOTS USED: %s\n' "$total_required_spots"
    printf 'TOTAL ENERGIES: %s\n' "$energy_count"
    printf 'TOTAL ACQ COMMANDS: %s\n' "$total_acq"
}

write_unused_spots_file() {
    if [ "$available_spots" -le "$total_required_spots" ]; then
        return
    fi

    out_unused="$(unused_spots_file)"
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
