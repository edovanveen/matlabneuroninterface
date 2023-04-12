#!/bin/bash

LD_LIBRARY_PATH='/home/kian.ohara/.conda/envs/neuron/lib/python3.11/site-packages/neuron/.data/lib/'
export LD_LIBRARY_PATH
echo $LD_LIBRARY_PATH

# matl22b
/nobackup/aljen.uitbeijerse/Matlab2022bInstall/bin/matlab -noopengl
#/nobackup/kian.ohara/MATLAB/R2022b/bin/matlab -softwareopengl
