#!/bin/bash

module purge
module load CESM-deps/2-foss-2019a

# Runtime settings
./xmlchange NTASKS=${SLURM_NTASKS}
./xmlchange DOUT_S=FALSE

# CESM case setup
echo
./preview_run
./case.setup --reset

# CESM case build
echo
./case.build

# CESM case immediate execution
# Use --no-batch to run the case in the current job
echo
./case.submit --no-batch
