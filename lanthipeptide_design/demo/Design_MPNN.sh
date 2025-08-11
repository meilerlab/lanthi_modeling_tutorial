#!/bin/bash

# Global variables
ROSETTA=/home/tydingcw/Rosetta/rosetta/source/bin/rosetta_scripts.torch.linuxgccrelease

# Input variables
XML=Design_MPNN.xml
PREFIX=outputs/mpnn_
INPUT=C05_H7_WT_10mer_trunc_0015_0003.pdb

mkdir -p outputs/

# Run
$ROSETTA \
-parser:protocol $XML \
-in:file:s $INPUT \
-use_input_sc true \
-out:pdb_gz true \
-nstruct 20 \
-in:file:fullatom \
-ignore_zero_occupancy false \
-linmem_ig 10 \
-in:detect_disulf \
-out:prefix $PREFIX \
-out:file:scorefile Designed_mpnn_lanthi.sc \
-ignore_waters false

