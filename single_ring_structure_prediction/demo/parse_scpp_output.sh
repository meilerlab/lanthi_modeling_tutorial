#!/bin/bash

INPUT=`readlink -e $1`
tag=`basename $INPUT .log`

grep -A1000000 "MPI_worker_node" $INPUT | grep -B1000000 "End summary for" | head -n-1 | column -t | awk '{print $3,$4,$5}' > ${tag}.dat
