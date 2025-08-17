#!/bin/bash

#Rosetta version
ROSETTA=source/bin/cst_info.linuxgccrelease

PDB=$1
FILE=$2

${ROSETTA_LOC}/$ROSETTA -in:file:extra_res_path ../ncaa_params/ -in:file:s $FILE -constraints:cst_fa_file ${PDB}_noe.cst -out:file:scorefile ${PDB}_cst.sc

