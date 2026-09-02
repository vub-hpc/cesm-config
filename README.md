# CESM Configuration Tools

CESM is used directly from its source code. Researches will clone a release or
development version of CESM, grab additional sources from other external
repositories (*e.g.* CIME, CLM) and use that ensemble to create, build and run
simulations (*aka* cases). Since cases are created from the source code of CESM,
there is little interest in distributing CESM for our users. This repo contains
all files and tools developed by [VUB-HPC](https://hpc.vub.be/) to make the
source code of CESM work in our clusters and ease the workflow of running case
for our users.

Researchers will usually download one of the
[stable releases of CESM](https://github.com/ESCOMP/CESM/releases)
and then download any external packages with the tool `git-fleximod`.
The resulting collection of packages is predictable with well-defined versions.

## User documentation

User documentation can be found in the
[Specific Use Cases Documentation](https://hpc.vub.be/docs/software/usecases/#cesm-cime)
of VUB-HPC.

## Machine files

Machine files are XML files configuring the system environment for CESM.

Configuration files are located in `ccs_config/machines/`:

* `config_machines.xml`
    * regex to identify the system machine
* `<hostname>/config_machines.xml`
    * file structure: location of input data, case folders and case output
    * parallelization settings
    * configuration of the module system
    * list of modules to be loaded by CESM
* `cmake_macros/<compiler>_<hostname>.cmake`
    * compiler settings
    * build environment
    * filesystem settings
* `config_batch.xml`
    * description of the queue
    * job request of resources

### Modifying machine files

We provide extra machine definitions for selected VSC clusters. Those
definitions are found in [cesm-config/machines/config.json](machines/config.json)
and have settings for *machines*, *compilers* and the *batch* system.
These settings can be easily added to the collection of machine files in CESM
with the tool `update-cesm-machines`:

```
update-cesm-machines /path/to/cesm-config/machines -s /path/to/cesm-x.y.z
```

### Hydra

* The only module needed is `CESM-deps`. It has to be loaded at all times, from
  cloning of the sources to case submission.

* Using `--machine hydra` is optional with CESM as long the user is in a
  compute node or a login node in Hydra. CESM uses `NODENAME_REGEX` in
  `config_machines.xml` to identify the host machine.

* The available option for `--compiler` is `gnu`, which is based on the GNU
  Compiler Collection. The versions of each `gnu` compiler are described in
  the corresponding [easyconfig](#easyconfigs) of the CESM-deps module.

* There is a single configuration that is tailored to nodes with Zen5 CPUs and
  fast InfiniBand interconnect.

* By design, CESM sets a specific queue with `-q queue_name`, otherwise it
  fails to even create the case. In Hydra we use the partition `zen5_mpi` as
  the default *queue*.

* Limit maximum number of nodes to 8 to ensure that the scale of CESM jobs
  stay within reasonable limits for Hydra.

### sofia

* The only module needed is `CESM-deps`. It has to be loaded at all times, from
  cloning of the sources to case submission.

* We provide two profiles for **sofia**:
  * *sofia* profile targets its `zen5-dense` partition. This is the default
    profile. Will be automatically selected on login nodes of sofia.
  * *sofia-himem* targets the `zen5-himem` partiition. This is an opt-in
    profile. Users need to manually select it with the option `--machine
    sofia-himem` on the login nodes of sofia.

* The available option for `--compiler` is `gnu`, which is based on the GNU
  Compiler Collection. The versions of each `gnu` compiler are described in
  the corresponding [easyconfig](#easyconfigs) of the CESM-deps module.

* There is no limit on the maximum number of nodes allowed.

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
      └── sources             (optional folder with sources of CESM or CTSM)
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
scratch storage, `DIN_LOC_ROOT` is defined `$VSC_SCRATCH/cesm`. Alternatively,
users in a Virtual Organization (VO) can link any folder in `DIN_LOC_ROOT` to
the data stored in their VO. `VSC_SCRATCH_VO` storage is as fast as
`VSC_SCRATCH` and can be used during the execution of the case without hindering
its performance.

Example to use input datasets from a shared folder in a VO:
```
$ ln -s $VSC_SCRATCH_VO/inputdata $VSC_SCRATCH/cesm/inputdata
```

### Restrictions on FTP servers

CESM will download missing input data from the external servers listed in
`config_inputdata.xml`. By default, the preferred options are FTP servers
provided by [ucar.edu](https://www.ucar.edu/). However, the FTP protocol is not
secure and hence, it might be blocked in your HPC cluster. Alternatively,
[ucar.edu](https://www.ucar.edu/) also provides a SVN repository with all input
data. CESM will automatically fallback to it if the connection to FTP servers
fail.

Versions of CESM 2.0.x and 2.1.x will try to validate the checksums from the SVN
repository externally, using the list of checksums in `inputdata_checksum.dat`.
This will fail as that list of checksums is only provided and needed for
downloads from the FTP servers. If you run into this issue, the patch
[01-CIME-fix-download-server-fallback](patches/irods/cime-5.6.32/01-CIME-fix-download-server-fallback.patch)
solves this bug.

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

* [CESM-deps-2-foss-2022a.eb](easyconfigs/CESM-deps/CESM-deps-2-foss-2022a.eb):
  available in Hortense, Hydra
* [CESM-deps-2-foss-2023a.eb](easyconfigs/CESM-deps/CESM-deps-2-foss-2023a.eb):
  available in Hortense, Hydra

Our easyconfigs of CESM-deps are based on those available in
[EasyBuild](https://github.com/easybuilders/easybuild-easyconfigs/tree/master/easybuild/easyconfigs/c/CESM-deps).
CESM-deps modules in the VSC clusters contain the configuration files and
scripts from this repository, which are located in the installation
directory (`$EBROOTCESMMINDEPS`). Hence, our users have direct access to these
files once `CESM-deps` is loaded. The usage instructions of our CESM-deps
modules also provide a minimum set of instructions to create cases with this
configuration files.

### CESM

Loads CESM-deps plus software commonly used to analyse the results of the
simulations.

* [CESM-2-foss-2022a.eb](easyconfigs/CESM/CESM-2-foss-2022a.eb): available in
  Hydra
* [CESM-2-foss-2023a.eb](easyconfigs/CESM/CESM-2-foss-2023a.eb): available in
  Hydra

## Extra tools

### CPRNC

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

### mksurfdata_map

Compilation instructions for the CLM tool `mksurfdata_map`

1. Load the CESM-deps/2-intel-2019b module
2. Go to the mksurfdata_map source directory: `cd $VSC_SCRACTH/cime/cesm-x.y.z/components/clm/tools/mksurfdata_map/src`
3. Build `mksurfdata_map` with the following command
    ```
    $ USER_FC=gfortran LIB_NETCDF="$EBROOTNETCDFMINFORTRAN/lib" INC_NETCDF="$EBROOTNETCDFMINFORTRAN/include" USER_FFLAGS="-fno-range-check" make
    ```
## Testing our CESM installations

The folder [cesm-config/tests](tests) contains instructions to carry out
different tests on a CESM installation, as well as results from multiple of our
tests in VSC clusters.

