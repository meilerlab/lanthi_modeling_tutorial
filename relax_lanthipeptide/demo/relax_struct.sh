#!/bin/bash

#Rosetta version
ROSETTA=source/bin/rosetta_scripts.default.linuxgccrelease

OPTIONS=$1
BASE=$2
OUT=$3
PRE=$4

mkdir -p $OUT

${ROSETTA_LOC}/$ROSETTA -in:file:s ${BASE} -out:prefix ${OUT}/${PRE} @${OPTIONS}

