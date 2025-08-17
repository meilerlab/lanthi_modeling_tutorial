#!/bin/bash

# Global variables
ROSETTA=source/bin/rosetta_scripts.default.linuxgccrelease

# Input variables
XML=Design.xml
PREFIX=outputs/
INPUT=C05_H7_WT_10mer_trunc_0015_0003.pdb

mkdir -p outputs/

# Run
${ROSETTA_LOC}/$ROSETTA \
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
-parser:script_vars cys_pos="277" dala_pos="268" cys_pos_min1="276" dala_pos_plus1="269" \
-parser:script_vars interface_shape_min="0.5" pep_hbond_min="3" pep_chain="2" \
-out:file:scorefile Designed_lanthi.sc \
-ignore_waters false

