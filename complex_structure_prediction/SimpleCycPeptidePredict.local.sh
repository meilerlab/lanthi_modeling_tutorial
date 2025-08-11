#!/bin/bash
echo $HOST $HOSTNAME

#############################
#
# Wrapper script to run simple_cycpep_predict
#
#############################

# Global variables
ROSETTA=/home/tydingcw/Rosetta/rosetta/source/bin/simple_cycpep_predict.linuxgccrelease

# Input variables
SEQ=sequence.txt #`readlink -e $1`
LOG=2KTO_ring4.log #$4
NSTRUCT=100
#MPI=/dors/meilerlab/apps/Linux2/x86_64/mpich2/3.2.1/bin/mpirun

mkdir -p starting_struct/

$ROSETTA \
-nstruct $NSTRUCT \
-sequence_file $SEQ \
-out:pdb_gz \
-out:prefix starting_struct/ \
-genkic_closure_attempts 500 \
-genkic_min_solution_count 1 \
-min_genkic_hbonds 0 \
-min_final_hbonds 0 \
-fast_relax_rounds 3 \
-cyclic_peptide:require_disulfides false \
-cyclic_peptide:cyclization_type lanthipeptide \
-cyclic_peptide:lanthionine_positions 7 3 \
-cyclic_peptide:compute_rmsd_to_lowest true \
-cyclic_peptide:rama_cutoff 5.0 \
-cyclic_peptide:total_energy_cutoff 20.0 \
-symmetric_gly_tables true \
-cyclic_peptide:MPI_batchsize_by_level 10 \
-cyclic_peptide:MPI_auto_2level_distribution \
-mute all \
-in:file:extra_rot_lib_path /dors/meilerlab/apps/rosetta/ \
-in:file:extra_res_path ../ncaa_params/ \
> $LOG


