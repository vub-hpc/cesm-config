#!/bin/bash

module purge
module load CESM-deps/2-intel-2019b

# Runtime settings
./xmlchange NTASKS=${SLURM_NTASKS}
./xmlchange DOUT_S=FALSE

# CESM case setup
echo
./case.setup --reset
./preview_run

# CESM case build
echo
./case.build

# CESM case immediate execution
# Use --no-batch to run the case in the current job
echo
./case.submit --no-batch
