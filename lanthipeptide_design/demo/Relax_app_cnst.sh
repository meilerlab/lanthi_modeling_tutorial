#!/bin/bash

CSV=`readlink -e $1`

sed 1d $CSV | while IFS=, read -r pdb
do
    prefix=`echo "$pdb" | cut -d'.' -f1`
    mkdir -p $prefix
    ${ROSETTA_LOC}/source/bin/relax.default.linuxgccrelease -in:file:s $pdb -nstruct 20 -in:file:fullatom -ignore_zero_occupancy false -linmem_ig 10 -in:detect_disulf -relax:constrain_relax_to_start_coords true -coord_constrain_sidechains true -ramp_constraints false -out:prefix ${prefix}/ -out:file:scorefile ${prefix}.sc
done

