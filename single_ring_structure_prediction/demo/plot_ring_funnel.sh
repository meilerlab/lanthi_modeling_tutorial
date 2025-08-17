#!/bin/bash

INPUT=`readlink -e $1`
tag=`basename $INPUT .dat`

python plot_folding_funnel.py -input $INPUT -pnear -pnear_lambda 1.5 -pnear_kbt 0.62 -delimiter ' ' -z_str Energy -output ${tag}.rmsd-to-native.png -y_label "Energy (REU)" -x_label "RMSD ($\AA$)" -cmap terrain -x_str RMSD -y_str Energy -font_size 14 -y_max 20 -exclude_axis_limits -x_standard
python plot_folding_funnel.py -input $INPUT -pnear -pnear_lambda 1.5 -pnear_kbt 0.62 -delimiter ' ' -z_str Energy -output ${tag}.rmsd-to-best.png -y_label "Energy (REU)" -x_label "RMSD ($\AA$)" -cmap terrain -x_str RMSD_to_best -y_str Energy -font_size 14 -y_max 20 -exclude_axis_limits

