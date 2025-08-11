#!/bin/bash

#Rosetta version
#ROSETTA=/home/tydingcw/Rosetta/main/source/bin/rosetta_scripts.linuxgccrelease
ROSETTA=/home/tydingcw/Rosetta/rosetta/source/bin/rosetta_scripts.default.linuxgccrelease

BASE=$1
NATIVE=$2
SCORE=$3

$ROSETTA -in:file:l ${BASE} \
-in:file:native $NATIVE \
-nstruct 1 \
-parser:protocol rmsd_bb.xml \
-use_input_sc true \
-in:file:fullatom \
-ignore_zero_occupancy false \
-linmem_ig 10 \
-out:file:score_only $SCORE \
-in:detect_disulf false \
-in:file:extra_res_path ../ncaa_params/

#-mute all \

