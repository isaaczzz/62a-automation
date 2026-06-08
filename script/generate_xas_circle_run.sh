#!/usr/bin/env sh

# Generate a MATLAB run file for circle-inscribed absolute spot scans.
#
# Usage:
#   ./generate_xas_circle_run.sh [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT START_RUN VERT_MIN VERT_MAX SX_MIN SX_MAX VERT_STEP SX_STEP
#
# Example:
#   ./generate_xas_circle_run.sh --overwrite test-runfile.m SHAg S 1 67.6 70.6 -7.2 -5.2 1.0 0.5

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

if [ "$#" -ne 10 ]; then
    echo "Usage: $0 [--append|--overwrite] OUTPUT_FILE PREFIX ELEMENT START_RUN VERT_MIN VERT_MAX SX_MIN SX_MAX VERT_STEP SX_STEP" >&2
    exit 1
fi

out_file="$1"
prefix="$2"
element="$3"
start_run="$4"
vmin="$5"
vmax="$6"
smin="$7"
smax="$8"
vstep="$9"
sstep="${10}"

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

# Circle geometry machinery adapted from spot_calc-circle.sh
dV=$(awk -v a="$vmin" -v b="$vmax" 'BEGIN{print (a>b)?a-b:b-a}')
dS=$(awk -v a="$smin" -v b="$smax" 'BEGIN{print (a>b)?a-b:b-a}')
r=$(awk -v dv="$dV" -v ds="$dS" 'BEGIN{m=(dv<ds?dv:ds); print m/2}')
Vc=$(awk -v a="$vmin" -v b="$vmax" 'BEGIN{print (a+b)/2}')
Sc=$(awk -v a="$smin" -v b="$smax" 'BEGIN{print (a+b)/2}')
VTL=$(awk -v c="$Vc" -v rr="$r" 'BEGIN{print c-rr}')
STL=$(awk -v c="$Sc" -v rr="$r" 'BEGIN{print c-rr}')
VBR=$(awk -v c="$Vc" -v rr="$r" 'BEGIN{print c+rr}')
SBR=$(awk -v c="$Sc" -v rr="$r" 'BEGIN{print c+rr}')

Nvert=$(awk -v lo="$VTL" -v hi="$VBR" -v st="$vstep" 'BEGIN{printf "%d", int((hi-lo)/st)+1}')
Nsx=$(awk -v lo="$STL" -v hi="$SBR" -v st="$sstep" 'BEGIN{printf "%d", int((hi-lo)/st)+1}')

points_file=$(mktemp)
trap 'rm -f "$points_file"' EXIT INT TERM

collect_points() {
    valid_idx=0

    i=0
    while [ "$i" -lt "$Nvert" ]; do
        v_abs=$(awk -v lo="$VTL" -v st="$vstep" -v ii="$i" 'BEGIN{printf "%.12g", lo + ii*st}')

        j=0
        while [ "$j" -lt "$Nsx" ]; do
            s_abs=$(awk -v lo="$STL" -v st="$sstep" -v jj="$j" 'BEGIN{printf "%.12g", lo + jj*st}')
            inside=$(awk -v vv="$v_abs" -v ss="$s_abs" -v vc="$Vc" -v sc="$Sc" -v rr="$r" \
                'BEGIN{dx=vv-vc; dy=ss-sc; print (dx*dx + dy*dy <= rr*rr)}')

            if [ "$inside" -eq 1 ]; then
                valid_idx=$((valid_idx + 1))
                printf '%s %s %s\n' "$valid_idx" "$v_abs" "$s_abs" >>"$points_file"
            fi

            j=$((j + 1))
        done

        i=$((i + 1))
    done
}

print_point_summary() {
    point_count=$(wc -l <"$points_file" | tr -d ' ')

    echo ""
    echo "=== Circle Valid Spots ==="
    echo "Total points: $point_count"

    if [ "$point_count" -eq 0 ]; then
        echo "No valid circle-inscribed spots for the provided bounds/steps."
        echo ""
        return
    fi

    printf '%-6s %-14s %-14s\n' 'Idx' 'Vert' 'Sx'
    printf '%-6s %-14s %-14s\n' '----' '--------------' '--------------'
    while read -r idx vert sx; do
        printf '%-6s %-14s %-14s\n' "$idx" "$vert" "$sx"
    done <"$points_file"
    echo ""
}

emit_content() {
    printf '%% ---------- herfd xas circle ----------\n'
    printf '%% %-14s %s\n' 'output_stem:' "$output_stem"
    printf '%% %-14s %s\n' 'prefix:' "$prefix"
    printf '%% %-14s %s\n' 'element:' "$element"
    printf '%% %-14s %s\n' 'start_run:' "$start_run"
    printf '%% %-14s %s\n' 'vert_min:' "$vmin"
    printf '%% %-14s %s\n' 'vert_max:' "$vmax"
    printf '%% %-14s %s\n' 'sx_min:' "$smin"
    printf '%% %-14s %s\n' 'sx_max:' "$smax"
    printf '%% %-14s %s\n' 'vert_step:' "$vstep"
    printf '%% %-14s %s\n' 'sx_step:' "$sstep"
    printf '%% %-14s %s\n' 'circle_r:' "$r"
    printf '%% %-14s %s\n' 'circle_vc:' "$Vc"
    printf '%% %-14s %s\n' 'circle_sc:' "$Sc"
    printf '%% %-14s %s\n\n' 'point_count:' "$point_count"

    printf 'close all\n\n'
    printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n\n'
    printf '%s\n\n' "$go_cmd"

    run_num="$start_run"
    while read -r idx v_abs s_abs; do
        run_suffix=$(printf '%02d' "$run_num")

        printf 'mv vert %s\n' "$v_abs"
        printf 'mv Sx %s\n' "$s_abs"
        printf 'mv Sy %s\n\n' "$s_abs"

        # Equivalent to test-runfile.m lines 23-25 at each valid spot.
        printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
        printf 'rixs %s_%s_RIXS_%s %s\n\n' "$prefix" "$rixs_tag" "$run_suffix" "$scan_tail"

        run_num=$((run_num + 1))

        if [ $((idx % 9)) -eq 0 ]; then
            printf 'andorSet numKins 1; andorSet setshutter 0; pause(2);\n'
            printf 'close all\n\n'
        fi
    done <"$points_file"

    if [ "$point_count" -eq 0 ]; then
        printf '%% WARNING: No valid circle-inscribed spots found for the provided bounds/steps.\n\n'
    fi
}

collect_points
point_count=$(wc -l <"$points_file" | tr -d ' ')

if [ "$append_mode" -eq 1 ]; then
    emit_content >>"$out_file"
elif [ "$overwrite_mode" -eq 1 ]; then
    emit_content >"$out_file"
else
    emit_content >"$out_file"
fi

print_point_summary

echo "Generated $out_file"
