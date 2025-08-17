#!/bin/sh
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1G
#SBATCH --exclude bf[49-51]
#SBATCH --time=0
#SBATCH --output=slurm/ripp_folding_%A.out
#SBATCH --job-name="ripp_folding"

#Rosetta version
ROSETTA=/home/tydingcw/Rosetta/rosetta_blue_local/source/bin/rosetta_scripts.default.linuxgccrelease

OPTIONS=$1
BASE=$2

dir=`basename $OPTIONS .options`
mkdir -p $dir

$ROSETTA -in:file:l ${BASE} @${OPTIONS} -mute all

