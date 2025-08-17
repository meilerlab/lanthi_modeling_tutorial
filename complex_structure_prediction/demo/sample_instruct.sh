#!/bin/bash

#Rosetta version
ROSETTA=source/bin/rosetta_scripts.default.linuxgccrelease

OPTIONS=$1
INPUT=$2

${ROSETTA_LOC}/$ROSETTA @${OPTIONS} -s $INPUT

