#!/bin/sh
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1G
#SBATCH --exclude bf[49-51]
#SBATCH --time=0
#SBATCH --output=slurm/%A_%a.out
#SBATCH --job-name="ripp_folding"

echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID

#Rosetta version
ROSETTA=source/bin/rosetta_scripts.default.linuxgccrelease

PRE=$1
SUFFIX=$2
INPUT=$3
OPTIONS=${PRE}${SLURM_ARRAY_TASK_ID}${SUFFIX}

${ROSETTA_LOC}/$ROSETTA @${OPTIONS} -s $INPUT

