#!/usr/bin/env bash

# This sets the number of nodes.
#SBATCH -N 1

# This sets the number of processors per node.
#SBATCH --ntasks-per-node=16

# This sets the total maximum runtime.
#SBATCH -t 0:59:00

# Sends an email when the process begins and when it ends.
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=ault@princeton.edu

set -e # Abort when anything returns a nonzero (error) status.

app=diffusiophoresisFoam
# app=sangwooSimpleFoam
# app=sangwooPrep

date=$(date +%Y_%m_%d_%H_%M_%S) # Current date/time.

logfile="${app}_${date}.log" # Name of log file.

# Case directory. In a real run, maker sure to run from /scratch/network/$USER

cd /scratch/network/ault/poreClogging

# Commands to be run from case directory.

date >> $logfile
srun $app -parallel >> $logfile 2>&1
# srun $app >> $logfile 2>&1

