#!/usr/bin/env sh

# Usage:
#   ./spot_calc.sh Vert_min Vert_max Sx_min Sx_max Vert_step Sx_step
#

## Context: currently, the way we go about identifying spots @ 6-2a is dscan vert and then dscan Sx in
## order to find the usable range. We then have to do a 'step' the width of the beam in order to prevent
## remeasuring an already-hit spot. @ 15-2, they use SPEC instead of MatLab and it, being non-abstracted,
## has greater functionality including being able to determine the usable spots within a defined space

## Note: go to upper and lower vert bounds and check the Sx range to ensure that this finds the right pts!

Vmin="$1"
Vmax="$2"
Smin="$3"
Smax="$4"
Vstep="$5"
Sstep="$6"

# Compute deltas
dV=$(awk -v a="$Vmin" -v b="$Vmax" 'BEGIN{print (a>b)?a-b:b-a}')
dS=$(awk -v a="$Smin" -v b="$Smax" 'BEGIN{print (a>b)?a-b:b-a}')

# Circle radius = half of smaller dimension
r=$(awk -v dv="$dV" -v ds="$dS" 'BEGIN{m=(dv<ds?dv:ds); print m/2}')

# Circle center
Vc=$(awk -v a="$Vmin" -v b="$Vmax" 'BEGIN{print (a+b)/2}')
Sc=$(awk -v a="$Smin" -v b="$Smax" 'BEGIN{print (a+b)/2}')

# Circle bounding box (top-left)
VTL=$(awk -v c="$Vc" -v r="$r" 'BEGIN{print c-r}')
STL=$(awk -v c="$Sc" -v r="$r" 'BEGIN{print c-r}')

# Bounding box bottom-right
VBR=$(awk -v c="$Vc" -v r="$r" 'BEGIN{print c+r}')
SBR=$(awk -v c="$Sc" -v r="$r" 'BEGIN{print c+r}')

# Number of rows and columns in bounding box
Nvert=$(awk -v lo="$VTL" -v hi="$VBR" -v st="$Vstep" \
    'BEGIN{printf "%d", int((hi-lo)/st)+1}')

Nsx=$(awk -v lo="$STL" -v hi="$SBR" -v st="$Sstep" \
    'BEGIN{printf "%d", int((hi-lo)/st)+1}')

# Count valid points inside circle
count=0
i=0
while [ "$i" -lt "$Nvert" ]; do
    V=$(awk -v lo="$VTL" -v st="$Vstep" -v i="$i" 'BEGIN{print lo + i*st}')
    j=0
    while [ "$j" -lt "$Nsx" ]; do
        S=$(awk -v lo="$STL" -v st="$Sstep" -v j="$j" 'BEGIN{print lo + j*st}')
        inside=$(awk -v V="$V" -v S="$S" -v Vc="$Vc" -v Sc="$Sc" -v r="$r" \
            'BEGIN{dx=V-Vc; dy=S-Sc; print (dx*dx+dy*dy <= r*r)}')
        if [ "$inside" -eq 1 ]; then
            count=$((count+1))
        fi
        j=$((j+1))
    done
    i=$((i+1))
done

# Relative moves
VertMoves=$((Nvert - 1))
SxMoves=$((Nsx - 1))

echo ""
echo "=== Circle-Inscribed XAS Grid Summary ==="
echo "Circle radius:        $r"
echo "Circle center:        Vert=$Vc  Sx=$Sc"
echo ""
echo "Top-left of circle:   Vert=$VTL  Sx=$STL"
echo "Rows (Vert):          $Nvert"
echo "Points per row (Sx):  $Nsx"
echo "Total valid points:   $count"
echo ""
echo "Relative Vert moves:  $VertMoves"
echo "Relative Sx moves:    $SxMoves"
echo ""
echo "To reach bottom-right of bounding box:"
echo "  Move Vert by: $(awk -v n="$VertMoves" -v st="$Vstep" 'BEGIN{print n*st}')"
echo "  Move Sx   by: $(awk -v n="$SxMoves" -v st="$Sstep" 'BEGIN{print n*st}')"
echo ""
