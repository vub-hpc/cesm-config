#!/bin/bash
#SBATCH --job-name=CESM-case-setupbuild
#SBATCH --output="%x-%j.out"
#SBATCH --time=4:00:00
#SBATCH --nodes 1
#SBATCH --ntasks 16

module load CESM-deps/2-foss-2021b

# CESM case setup
echo
./case.setup --reset
./preview_run

# CESM case build
echo
./case.build
