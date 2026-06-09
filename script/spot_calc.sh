#!/usr/bin/env bash

# Usage:
#   ./spot_calc.sh Vert_min Vert_max Sx_min Sx_max Vert_step Sx_step [SPOTS_FILE]
#

## Context: currently, the way we go about identifying spots @ 6-2a is dscan vert, find center, dscan Sx, find center
## then we go through each vert (per defined step) and scan Sx to find usable range. We then have to do a 'step' the
## width of the beam in order to prevent remeasuring an already-hit spot. @ 15-2, they use SPEC instead of MatLab and,
## being non-abstracted, it has greater functionality, including determining the usable spots within a defined space
## (sample holder is also rectangular versus the circular wells here)

## Script logic:
##  Test 4 grid alignments (grid shifts -- try to maximize point density within arbitrary ellipse in norm'd space)
##  For each alignment:
##      walk verts
##      within each vert, walk Sx
##      test if each point lies inside ellipse
##      count valid points
##      keep grid shift with greatest num of pts

## Note: WANT TO CHECK THE POLAR ENDS OF VERT TO ENSURE POINTS ARE VALID FOR ACTUAL APERTURE

if [[ $# -lt 6 || $# -gt 7 ]]; then
    echo "Usage: $0 VMIN VMAX SMIN SMAX VSTEP SSTEP [SPOTS_FILE]"
    exit 1
fi

spots_file="${7:-spots.txt}"

VMIN=$1
VMAX=$2
SMIN=$3
SMAX=$4
VSTEP=$5
SSTEP=$6

# ---------------- GEOMETRY MODEL ----------------
# Convert rectangular scan bounds into center point & half-widths (treated as ellipse radii)
VC=$(awk -v a="$VMIN" -v b="$VMAX" 'BEGIN{print (a+b)/2}')   # vertical center
SC=$(awk -v a="$SMIN" -v b="$SMAX" 'BEGIN{print (a+b)/2}')   # side center

VR=$(awk -v a="$VMIN" -v b="$VMAX" 'BEGIN{print (b-a)/2}')   # vertical radius
SR=$(awk -v a="$SMIN" -v b="$SMAX" 'BEGIN{print (b-a)/2}')   # side radius

# sanity check: must form a valid region
if awk -v vr="$VR" -v sr="$SR" 'BEGIN{exit !(vr<=0 || sr<=0)}'; then
    echo "ERROR: invalid geometry"
    exit 1
fi

# ---------------- OPTIMIZATION OVER GRID PHASES ----------------
# Try 4 possible grid offsets [(0,0), (0,½), (½,0), (½,½)] to maximize num of usable pts inside ellipse
best=0
best_points=""

i=0 # shift vert
while [[ $i -le 1 ]]; do
    j=0 # shift Sx
    while [[ $j -le 1 ]]; do

        # shift grid slightly in attempt to improve packing
        voff=$(awk -v s="$VSTEP" -v i="$i" 'BEGIN{print i*s/2}')
        soff=$(awk -v s="$SSTEP" -v j="$j" 'BEGIN{print j*s/2}')

        tmp_points=""  # stores points for this grid configuration
        count=0        # number of valid points

        # start at lower ellipse boundary (shifted by offset)
        v=$(awk -v vc="$VC" -v vr="$VR" -v vo="$voff" 'BEGIN{print vc-vr+vo}')

        while awk -v v="$v" -v vc="$VC" -v vr="$VR" 'BEGIN{exit !(v <= vc+vr+1e-9)}'; do

            # start at left ellipse boundary (shifted by offset)
            s=$(awk -v sc="$SC" -v sr="$SR" -v so="$soff" 'BEGIN{print sc-sr+so}')

            while awk -v s="$s" -v sc="$SC" -v sr="$SR" 'BEGIN{exit !(s <= sc+sr+1e-9)}'; do

                # normalize coordinates relative to ellipse center/radii
                #(V axis)
                #↑
                #|   o  o  o  o
                #|   o  o  o  o
                #|   o  o  o  o
                #|
                #+----------------→ (S axis)
                # point is valid if inside ellipse within normalized space
                inside=$(awk -v s="$s" -v v="$v" -v sc="$SC" -v vc="$VC" -v sr="$SR" -v vr="$VR" '
                BEGIN{
                    dx=(s-sc)/sr;
                    dy=(v-vc)/vr;

                    # ellipse condition: x^2 + y^2 <= 1
                    if (dx*dx + dy*dy <= 1.0)
                        print 1;
                    else
                        print 0;
                }')
                if [[ "$inside" = "1" ]]; then
                    tmp_points+="$v $s\n"
                    count=$((count+1))
                fi

                # step sideways
                s=$(awk -v s="$s" -v step="$SSTEP" 'BEGIN{print s+step}')
            done

            # step vertically
            v=$(awk -v v="$v" -v step="$VSTEP" 'BEGIN{print v+step}')
        done

        # keep configuration that yields greatest num of usable points
        if [[ "$count" -gt "$best" ]]; then
            best=$count
            best_points="$tmp_points"
        fi

        j=$((j+1))
    done

    i=$((i+1))
done

{
    printf "# VMIN=%s VMAX=%s SMIN=%s SMAX=%s VSTEP=%s SSTEP=%s\n" \
        "$VMIN" "$VMAX" "$SMIN" "$SMAX" "$VSTEP" "$SSTEP"
    printf "%b" "$best_points" | awk 'NF>=2 {printf "%.6f\t%.6f\n", $1, $2}'
} >"$spots_file"

echo "VERT       SX"
echo "--------------"
awk '($1 !~ /^#/ && NF>=2){printf "%6.3f  %6.3f\n",$1,$2}' "$spots_file"
echo "TOTAL POINTS: $best"
echo "WROTE: $spots_file"
if [[ "$best" -ge 9 ]]; then
    echo "STATUS: OK"
else
    echo "STATUS: WARNING (<9 points)"
fi
