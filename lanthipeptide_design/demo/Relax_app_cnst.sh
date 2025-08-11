#!/bin/bash

#/dors/meilerlab/apps/rosetta/rosetta-3.13/main/source/bin/relax.default.linuxgccrelease -in:file:s EGF_bound.pdb -nstruct 5 -in:file:fullatom -ignore_zero_occupancy false -linmem_ig 10 -in:detect_disulf -relax:constrain_relax_to_start_coords true -coord_constrain_sidechains false -ramp_constraints true -out:prefix EGF_bound_bb_ramp_constrained_relax -out:file:scorefile EGF_bound_bb_ramp_constrained_relax.sc > EGF_bound_bb_ramp_constrained_relax.log &

CSV=`readlink -e $1`

sed 1d $CSV | while IFS=, read -r pdb
do
    #echo $pdb
    prefix=`echo "$pdb" | cut -d'.' -f1`
    mkdir -p $prefix
    #echo ${prefix}.sc
    #prefix="${pdbgz}_0001.pdb.gz"
    /dors/meilerlab/apps/rosetta/rosetta-3.13/main/source/bin/relax.default.linuxgccrelease -in:file:s $pdb -nstruct 20 -in:file:fullatom -ignore_zero_occupancy false -linmem_ig 10 -in:detect_disulf -relax:constrain_relax_to_start_coords true -coord_constrain_sidechains true -ramp_constraints false -out:prefix ${prefix}/ -out:file:scorefile ${prefix}.sc &
done

