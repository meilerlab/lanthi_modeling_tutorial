
Note there seems to be a bug where I cannot exclude the first resi from rmsd calc for ring 4 (get out of range error)
#-cyclic_peptide:exclude_residues_from_rms 1 \

Only the mpi version calculates the rmsd values

bash SimpleCycPeptidePredict.local_mpi.sh
-in:file:native $NATIVE \ takes in the structure defined in the NATIVE structure as the comparison for rmsd calculations

bash SimpleCycPeptidePredict.local.sh
bash SimpleCycPeptidePredict.local_mpi.sh

#Plotting after SimpleCycPeptidePredict.local_mpi.sh
bash parse_scpp_output.sh 2KTO_ring4_mpi.log
bash plot_ring_funnel.sh 2KTO_ring4_mpi.dat

