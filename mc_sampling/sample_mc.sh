#!/bin/bash

#Rosetta version
ROSETTA=source/bin/rosetta_scripts.default.linuxgccrelease

OPTIONS=$1
BASE=$2

dir=`basename $OPTIONS .options`
mkdir -p $dir

${ROSETTA_LOC}/$ROSETTA -in:file:s ${BASE} @${OPTIONS}

