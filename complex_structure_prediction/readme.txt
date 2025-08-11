
The first step is create a starting structure from sequence. The Simple Cyclic Peptide Prediction application is a an easy way to do this. 
For this example, I use the sequence of PDB 6VHJ (Prochorosin 1.1) and tell the application to close the ring between residues 3 and 7. 
Note, the order of residue specification matters. The order should be non-thiol (DDBS) then thiol (CYS). 
DDBS means that there is a methyllanthionine (DBB) with S chirality at the methyllanthionine steriocenter and the extra D in front of DBS specifies this is a D amino acid. 

bash SimpleCycPeptidePredict.local.sh
for this case, we are outputting .pdb.gz files for input in the next step

#prep the structure prediction
python make_ripp_structpred_xml.py -r 6VHJ -s sequence.txt

#initial structure prediction
Prior to structure prediciton, check the path of the ncaa, as well as the rama path inside of the params files
ls options/6VHJ_*.options | xargs -I % -n1 -P 18 bash sample_instruct.sh % starting_struct/S_0002.pdb #don't use more cores than your machine has (-P 18)

Do not be alarmed if some or many jobs fail. This behavior is expected and is due to the inability of genkic to find solutions to the loop closure problem. 
Note that `-mute all` silences the output. This is good for cluster job submissions, but may make you feel like nothing is happening if run in an interactive terminal session. 

#set up for more predictions (aims for 200,000)
python fullrun_setup.py -i 6VHJ

#Launch jobs on a cluster for more extensive structure prediction
sbatch --array=1-`ls options_refined/6VHJ_* | wc -l` sample_instruct_cmdarray.slurm options_refined/6VHJ_ _rand_ind.options starting_struct/S_0002.pdb

