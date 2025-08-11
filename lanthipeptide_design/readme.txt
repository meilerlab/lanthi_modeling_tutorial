The CDRH3 loop in 4FP8 looks interesting as a starting point for lanthipeptide design

Relax into the rosetta energy function to prepare the structure
#Structure init relax cycle
Relax_app_cnst.sh
Relax_app_cnst_sampsc.sh

The protocol steps are:
Mutate to lanthipeptide
Crosslinker
relax
design
The design could expand to D amino acids as well

bash Design.sh C05_H7_WT_10mer_trunc_0015_0003.pdb

Or design with ProteinMPNN (mpnn.resfile is important to prevent design with CYS or THR or SER in this case):
bash Design_MPNN.sh C05_H7_WT_10mer_trunc_0015_0003.pdb

If you only have an anchor (not a full backbone to design), you would need to use the pep stub mover to make backbone residues
and GenKIC to close the backbone. You could then design the cyclized backbone after filtering out generated backbones
that are unlikly to be conformationally stable (not enough internal hydrogen bonds).  

