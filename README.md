# CESM/CIME Configuration Tools

CESM/CIME is used directly from its source code. Researches will clone a
release or development version of CESM, grab additional sources for CIME in
external repos and use that ensemble to create, build and run simulations
(*aka* cases). Therefore, providing static releases of this software in our HPC
clusters is of limited interest. This repo contains all files and tools
developed by [VUB-HPC](https://hpc.vub.be/) to make the source code of CESM
work in our clusters and ease the setup for our users.

The versions of CESM and CIME are not tied between them. On the side of CESM
the situation is clear as there are [release versions
available](https://github.com/ESCOMP/CESM/releases). Users will usually
download one of the stable release. However, on the side of CIME, it is more
complicated. The common procedure is to download CIME using the script
`checkout_externals` from CESM, which downloads the most recent version of CIME
compatible with the current version of CESM. In practice, this means that the
version of CIME depends on the date and time that it was downloaded and hence,
the user might not be aware of what version of CIME is actually using.

## User documentation

User documentation can be found in the [Specific Use Cases
Documentation](https://hpc.vub.be/docs/software/usecases/#cesm-cime) of
VUB-HPC.

## Machine files

Machine files are XML files configuring the system environment for CIME. All
files are located in `cime/config/cesm/machines/`.

* config_machines.xml
    * regex to identify the system machine
    * file structure: location of input data, case folders and case output
    * parallelization settings
    * configuration of the module system
    * list of modules to be loaded by CESM
* config_compiler.xml
    * compiler settings
    * build environment
    * filesystem settings
* config_batch.xml:
    * description of the queue
    * job request of resources
* config_pio.xml
    * fine grained settings to access the filesystem
* config_workflow.xml
    * defines steps in the default and custom workflows
    * job default settings of some steps

### Modifying machine files

We provide XML files with the configuration settings for Hydra (VSC Tier-2 HPC)
and Breniac (VSC Tier-1 HPC). These files are located in `machines/` and cover
*machines*, *compilers* and *batch* configurations. The settings for Hydra and
Breniac can be easily added to the default machine files in CIME with the tool
`update-cesm-machines`. For instance, the three aforementioned config files can
be updated with the additional settings from [cesm-config/machines](machines)
with the command

```
update-cesm-machines /path/to/cesm-x.y.z/cime/config/cesm/machines/ /path/to/cesm-config/machines/
```

All three machine files (*machines*, *compilers* and *batch*) have to be
updated to get a working installation of CESM/CIME in the VSC clusters.

### Hydra

* The only module needed is `CESM-deps`. It has to be loaded at all times, from
  cloning of the sources to case submission.

* Using `--machine hydra` is optional as long the user is in a compute node or
  a login node in Hydra. CESM uses `NODENAME_REGEX` in `config_machines.xml` to
  identify the host machine.

* Users have two options on creation of new cases for `--compiler`. One is
  `gnu`, based on the GNU Compiler Collection. The other is `intel`, based on
  Intel compilers. The versions of each compiler are described in the
  [easyconfigs](#easyconfigs) of each CESM-deps module.

* There is a single configuration for both compilers that is tailored to nodes
  with Skylake CPUs, including the login nodes.

* CESM is not capable of detecting and automatically adding the required
  libraries to its build process. The current specification of `SLIBS` contains
  just what we found to be required (so far).

* By design, CESM sets a specific queue with `-q queue_name`, otherwise it
  fails to even create the case. In Hydra we use the partition `skylake_mpi` as
  the default *queue*.

* Limit maximum number of nodes to 12 to ensure that the scale of CESM jobs
  stay within reasonable limits for Hydra.

### Breniac

* There are two clusters defined in Breniac, `breniac` and `breniac-skl`

    * `breniac` is the default one, uses AVX2 and the resulting binaries will
      works in all nodes in Breniac. It will be picked by default in the login
      nodes or if `--machine breniac` is specified

    * `breniac-skl` is optimized for the Skylake nodes in Breniac and uses
      AVX512. It will only be picked if the host system is a Skylake node or if
      `--machine breniac-skl` is specified

* The only module needed is `CESM-deps`. It has to be loaded at all times, from
  cloning of the sources to case submission.

* By design, CESM sets a specific queue with `-q queue_name`, otherwise it
  fails to even create the case. In Breniac we can use the queue `qdef` as it
  will derive the job to `q1h`, `q24h` or `q72h` depending on the walltime
  requested.

### Hortense

* The only module needed to create, setup and build cases is `CESM-deps`.
  It has to be loaded at all times, from cloning of the sources to case
  submission. CESM will also load vsc-mympirun at runtime to be able to
  use MPI.

* Using `--machine hortense` is optional as long the user is in a non-GPU
  compute node or a login node in Hortense. CESM uses `NODENAME_REGEX` in
  `config_machines.xml` to identify the host machine.

* Cases are submitted with Slurm's sbatch as CESM is not compatible with
  [jobcli](https://github.com/hpcugent/jobcli).

* By default all cases are run in the `cpu_rome` partition. Optionally, cases
  can also be submitted to `cpu_rome_512` with the high memory nodes.

* Downloading input data from the default FTP servers of UCAR is not possible.
  Input data has to be manually downloaded until an alternative method is set
  up for Hortense.

* The recommended workflow is to create the case as usual, setup and build the
  case in the compute nodes with the job script
  [case.setupbuild.slurm](scripts/case.setupbuild.slurm) and then submit the
  case as usual with `case.submit`.

## File structure

All paths defined in `config_machines.xml` are below `$VSC_SCRATCH`. These
folders contain everything including the executables, input data sets, user
cases and outputs. CESM can generate rather big cases reaching several hundreds
of GB. The structure is contained in the `cesm` folder

```
$VSC_SCRATCH
 └── cesm
      ├── cesm_baselines      (BASELINE_ROOT)
      ├── inputdata           (DIN_LOC_ROOT)
      │    └── atm/datm7      (DIN_LOC_ROOT_CLMFORC)
      ├── output              (CIME_OUTPUT_ROOT)
      │    └── archive/$CASE  (DOUT_S_ROOT)
      ├── tools/cprnc/cprnc   (CCSM_CPRNC)
      ├── cases               (optional folder with user cases)
      └── sources             (optional folder with sources of CESM)
```

## Input data

Input data in `cesm/inputdata` (DIN_LOC_ROOT) will be populated with existing
data sets from remote servers, such as historical weather records. This data is
actively accessed during the simulation in read operations, but not modified or
created by running cases. Input data files are automatically downloaded by CIME
into `DIN_LOC_ROOT` before the case is submitted to the queue. Only missing
files that are needed to run the current simulation will be downloaded.

Therefore, the contents of `DIN_LOC_ROOT` will grow over time, easily reaching
several TB of data distributed in several thousands files ranging from a few
hundred MB to several GB. Given the characteristics of the input data, it is
very compelling to have a centralized storage for CESM input data that can be
shared by multiple users.

### Data storage in Hydra

In Hydra, the collection of input data files is stored by default in the user's
scratch storage, `DIN_LOC_ROOT` is defined under `$VSC_SCRATCH`. Alternatively,
users in a Virtual Organization (VO) can link their `DIN_LOC_ROOT` to any folder
in their VO. The VO storage is as fast as `$VSC_SCRATCH` and can be used during
the execution of the case without hindering its performance.

### iRODS in Breniac

The source of CESM input data files are servers across the Internet and they
are defined in the configuration file `config_inputdata.xml`. In Breniac, we
can use the local iRODS server as a fast intermediate solution by setting it up
as a download server for CIME. The goal is to use the iRODS server as a kind of
fast cache to quickly populate `DIN_LOC_ROOT` in the local storage.

The patches in `irods/` enable the iRODS storage by

* adding iRODS as an additional download method and giving it precedence over
  `wget` or FTP

* allowing CIME to fallback to other methods if any input file is not in
  available in iRODS

* automatically synchronizing the contents of `DIN_LOC_ROOT` to the iRODS
  server at the end of the simulation

Instruction to use CESM/CIME with iRODS:

1. Download the source code of CESM/CIME as usual and determine the version of
   CIME in your tree

```
$ git clone -b release-cesm2.1.3 https://github.com/ESCOMP/cesm.git cesm-2.1.3
$ cd cesm-2.1.3/
$ ./manage_externals/checkout_externals
```

2. Patch your source code of CESM/CIME to enable support for iRODS. Determine
   the version of CIME in your tree and choose the closest version of the patch
   available in [cesm-config/irods](irods)

```
$ cd cesm-2.1.3/
$ git -C cime/ describe --tags
cime5.6.32
$ git apply /path/to/cesm-config/irods/cime-5.6.32/*.patch
```

3. Remember to authenticate to the irods servers in Leuven to setup, build and
   run your case

```
$ irods-setup | bash
```

4. (Only once) Create a collection for CESM input data in iRODS

```
$ imkdir -p cesm/inputdata
```

5. (Optional) Update the iRODS address in `config_inputdata.xml` if your
   collection of CESM data is located anywhere else than `cesm/inputdata`


## Job scripts

The common workflow with CESM consists in creating and building the case
interactively in the login node of the cluster. Then the case is submitted to
the queue and CESM will automatically set the resources, walltime and queue of
each job. This can cause problems in a heterogeneous environment as not all
nodes might provide the same hardware features as the login nodes.

The example job scripts in [cesm-config/scripts](scripts) solve this problem
by executing these steps in the compute nodes of the cluster. In this way, the
compilation can be optimized to the host machine, simplifying the configuration,
and the user does not have to worry about where the case is build and where it
is executed.

* [case.slurm](scripts/case.slurm): performs setup, build and execution of the
  case

* [case.setupbuild.slurm](scripts/case.setupbuild.slurm): performs setup and
  build of the case, then the user can use `case.submit` as usual

## Easyconfigs

### CESM-deps

Loads all dependencies to build and run CESM cases.

* [CESM-deps-2-intel-2019b.eb](easyconfigs/CESM-deps/CESM-deps-2-intel-2019b.eb):

    * only option in the two Breniac clusters

    * used in Hydra with `--compiler=intel`

* [CESM-deps-2-foss-2021b.eb](easyconfigs/CESM-deps/CESM-deps-2-foss-2021b.eb):

    * only option in Hortense

    * used in Hydra with `--compiler=gnu`

Our easyconfigs of CESM-deps are based on those available in
[EasyBuild](https://github.com/easybuilders/easybuild-easyconfigs/tree/master/easybuild/easyconfigs/c/CESM-deps).
However, the CESM-deps module in Hydra and Breniac also contains the
configuration files and scripts from this repository, which are located in the
installation directory (`$EBROOTCESMMINDEPS`). Hence, our users have direct
access to these files once `CESM-deps` is loaded. The usage instructions of our
CESM-deps modules also provide a minimum set of instructions to create cases
with this configuration files.

### CESM-tools

Loads software commonly used to analyse the results of the simulations.

* [CESM-tools-2-foss-2019a.eb](easyconfigs/CESM-tools/CESM-tools-2-foss-2019a.eb):

    * available in Hydra

## CPRNC

There is small tool called
[cprnc](https://github.com/ESMCI/cime/tree/master/tools/cprnc) that needs to be
compiled and placed in `CCSM_CPRNC`, a path defined in `config_machines.xml`.

These are the steps to compile this tool

1. Load the CESM-deps/2-intel-2019b module
2. Prepare the source code tree of CESM as usual (as explained in our documentation)
3. Change to source folder: `cd $VSC_SCRACTH/cime/cesm-x.y.z/cime/tools/cprnc/`
4. Configure: `CIMEROOT=../.. ../configure --macros-format=Makefile`
5. Build:

```
$ CIMEROOT=../.. source ./.env_mach_specific.sh &&
  make FFLAGS="$FFLAGS -I${EBROOTNETCDFMINFORTRAN}/include"
  LDFLAGS="$LDFLAGS -I${EBROOTNETCDFMINFORTRAN}/lib"
```

The binary installed in `CCSM_CPRNC` will be used in all nodes in the cluster.
Therefore it has to be build with the minimum CPU optimizations

* the binary for Hydra was built in an IvyBridge CPU (available upon request)

* the binary for Breniac was built in a Broadwell CPU (available upon request)

## mksurfdata_map

Compilation instructions for the CLM tool `mksurfdata_map`

1. Load the CESM-deps/2-intel-2019b module
2. Go to the mksurfdata_map source directory: `cd $VSC_SCRACTH/cime/cesm-x.y.z/components/clm/tools/mksurfdata_map/src`
3. Build `mksurfdata_map` with the following command

```
$ USER_FC=gfortran LIB_NETCDF="$EBROOTNETCDFMINFORTRAN/lib" INC_NETCDF="$EBROOTNETCDFMINFORTRAN/include" USER_FFLAGS="-fno-range-check" make
```

## Validation of the CESM installation

We have carried out a scientific validation of the CESM installation in Hydra
and Breniac to verify the reliability of the results obtained with it. The
procedure is described in http://www.cesm.ucar.edu/models/cesm2/python-tools/.

1. Create case with the `ensemble.py` tool provided in the CESM source code
2. Execute that case in the cluster (setup + build + submit)
3. Use the web tool to compare the resulting `.nc` files with the reference data

An installation of CESM v2.1.1 in Breniac passed all tests
* UF-CAM-ECT test: validated by Steven Johan De Hertog (VUB)
* POP-ECT: validated by Alex Domingo (VUB)

An installation of CESM v2.1.1 in Hydra passed all tests
* UF-CAM-ECT test: validated by Alex Domingo (VUB)
* POP-ECT: validated by Alex Domingo (VUB)

Results of the validations can be found in the `validation` folder.
