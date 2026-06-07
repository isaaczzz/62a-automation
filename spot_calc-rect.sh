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

# Number of points
Nvert=$(awk -v d="$dV" -v st="$Vstep" 'BEGIN{printf "%d", int(d/st)+1}')
Nsx=$(awk -v d="$dS" -v st="$Sstep" 'BEGIN{printf "%d", int(d/st)+1}')

# Relative moves
VertMoves=$((Nvert - 1))
SxMoves=$((Nsx - 1))

Total=$((Nvert * Nsx))

echo ""
echo "=== XAS Grid Summary ==="
echo "Top-left absolute point:"
echo "  Vert = $Vmin"
echo "  Sx   = $Smin"
echo ""
echo "Rows (Vert):            $Nvert"
echo "Points per row (Sx):    $Nsx"
echo "Total points:           $Total"
echo ""
echo "Relative Vert moves:    $VertMoves"
echo "Relative Sx moves:      $SxMoves"
echo ""
echo "To reach bottom-right from top-left:"
echo "  Move Vert by: $(awk -v n="$VertMoves" -v st="$Vstep" 'BEGIN{print n*st}')"
echo "  Move Sx   by: $(awk -v n="$SxMoves" -v st="$Sstep" 'BEGIN{print n*st}')"
echo ""
