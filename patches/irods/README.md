# Support for iRODS

*Note: only supports CESM2*

The clusters in VSC have fast access to the VSC iRODS storage managed by KU
Leuven. Since access to this iRODS server is 10x faster than the default
external servers with input data from [ucar.edu](https://www.ucar.edu/), the
goal is to use the iRODS server as a cache to quickly download any input data
files already available in it and only fallback to the default servers for the
first download of missing files.

Patches in [cesm-config/patches/irods](patches/irods) enable support for iRODS
in CESM/CIME:

* Patch 01: makes CESM always start from the top server in `config_inputdata.xml`
  to download each target input file, so each file can be downloaded from the
  fastest available option

* Patch 02: adds iRODS as an additional download method and gives it precedence
  over `wget` or FTP

* Patch 03: automatically synchronizes the contents of `DIN_LOC_ROOT` to the
  iRODS server at the end of the simulation

Instruction to use CESM/CIME with iRODS:

1. Download the source code of CESM/CIME as usual
    ```
    $ git clone -b release-cesm2.2.0 https://github.com/ESCOMP/cesm.git cesm-2.2.0
    $ cd cesm-2.2.0/
    $ ./manage_externals/checkout_externals
    ```

2. Patch your source code of CESM/CIME to enable support for iRODS. Determine
   the version of CIME in your tree and choose the closest version of the patch
   available in [cesm-config/patches/irods](patches/irods)
    ```
    $ cd cesm-2.2.0/
    $ git -C cime/ describe --tags
    cime5.8.32
    $ git apply /path/to/cesm-config/patches/irods/cime-5.8.32/{01,02,03}-*.patch
    ```

3. Remember to authenticate to the irods servers in Leuven to setup, build and
   run your case
    ```
    $ ssh login.hpc.kuleuven.be irods-setup | bash
    ```

4. (Only once) Create a collection for CESM input data in iRODS
    ```
    $ imkdir -p cesm/inputdata
    ```

5. (Optional) Update the iRODS address in `config_inputdata.xml` if your
   collection of CESM data is located anywhere else than `cesm/inputdata`

