#!/bin/bash
echo $HOST $HOSTNAME

#############################
#
# Wrapper script to run simple_cycpep_predict
#
#############################

# Global variables
ROSETTA=source/bin/simple_cycpep_predict.mpi.linuxgccrelease

# Input variables
SEQ=sequence.txt #`readlink -e $1`
OUTPUT=2KTO_ring4.o #$2
NATIVE=2KTO_1_rename_ring4.pdb #`readlink -e $3`
LOG=2KTO_ring4_mpi.log #$4
NP=16
NSTRUCT=10000
#Make sure mpirun is in your path or specify the path to it
MPI=mpirun

mkdir -p outputs/

$MPI -np $NP ${ROSETTA_LOC}/$ROSETTA \
-in:file:native $NATIVE \
-out:file:silent $OUTPUT \
-nstruct $NSTRUCT \
-sequence_file $SEQ \
-genkic_closure_attempts 500 \
-genkic_min_solution_count 1 \
-min_genkic_hbonds 0 \
-min_final_hbonds 0 \
-fast_relax_rounds 3 \
-cyclic_peptide:require_disulfides false \
-cyclic_peptide:cyclization_type lanthipeptide \
-cyclic_peptide:lanthionine_positions 1 4 \
-cyclic_peptide:compute_rmsd_to_lowest true \
-cyclic_peptide:rama_cutoff 5.0 \
-cyclic_peptide:total_energy_cutoff 20.0 \
-cyclic_peptide:MPI_pnear_kbt 0.62 \
-cyclic_peptide:MPI_pnear_lambda 1.5 \
-cyclic_peptide:MPI_output_fraction 0.05 \
-symmetric_gly_tables true \
-cyclic_peptide:MPI_batchsize_by_level 10 \
-cyclic_peptide:MPI_auto_2level_distribution \
-score:weights ref2015_cst \
-mute all \
-unmute protocols.cyclic_peptide_predict.SimpleCycpepPredictApplication_MPI protocols.cyclic_peptide_predict.SimpleCycpepPredictApplication_MPI_summary \
-in:file:extra_rot_lib_path /dors/meilerlab/apps/rosetta/ \
-in:file:extra_res_path ../../ncaa_params/ \
> $LOG

#-cyclic_peptide:exclude_residues_from_rms 1 \

