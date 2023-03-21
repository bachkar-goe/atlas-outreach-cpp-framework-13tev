#!/bin/bash

# Print the environment
echo $(hostname)
cat /proc/cpuinfo
echo "Job Start Time: $(date)"
## small script to run TTbarAnalysis
##OPTION
echo option 0 = run all data and MC one after another
option=0
echo parallel 0 = Parallel mode is disabled
parallel=0

## execute and run ROOT
echo "starting ROOT"
##
echo "Job Start Time: $(date)"
mkdir Output_TTbarAnalysis
mkdir Histograms

# Setup ROOT environment
source /cvmfs/sft.cern.ch/lcg/views/LCG_98/x86_64-centos7-gcc8-opt/setup.sh

# Run analysis (-q quit after execution, -b batch mode w/o graphics, -x quit in$
root -q -b -x main_TTbarAnalysis.C+
rm -rf *_ACLiC_*
rm -rf *.d
rm -rf *.pcm
rm -rf *.so

echo "end of ROOT execution"
echo "Job Finshed at $(date)"

