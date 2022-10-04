# Tests of our CESM installations

We test multiple aspects of each new installation of CESM:
* [Basic functionality](#functionality-tests)
* [Scientific correctness](#scientific-validation-tests)
* [Performance and scaling](#performance-and-scaling-tests)

## Functionality Tests

Basic functionality of the installation can be checked with the
[*pre-alpha* tests of Cheyenne](https://esmci.github.io/cime/versions/master/html/users_guide/porting-cime.html#validating-a-cesm-port-with-prognostic-components).
This collection of tests can be created and executed with the script
``$CIMEROOT/cime/scripts/create_test``

```
$ ./create_test --xml-category prealpha --xml-machine cheyenne --xml-compiler intel --machine hydra --compiler gnu --parallel-jobs 1 --proc-pool 4 --output-root $VSC_SCRATCH/cesm/output/tests
```

⚠️ Warning: these tests are taxing in computational resources. The script
`create_test` will not only create the tests, but also submit them to the job
scheduler. Executing all tests needs a lot of storage (+1 TB) and some of the
tests require multiple full nodes (+8) to run.

## Scientific Validation Tests

UCAR provides a toolset to carry out a scientific validation of the CESM
installation and verify the reliability of its results. The procedure is
described in http://www.cesm.ucar.edu/models/cesm2/python-tools/.

1. Create ensemble test case with the script
   ``$CIMEROOT/tools/statistical_ensemble_test/ensemble.py`` in the CESM source
   code

2. ``ensemble.py`` will create, build and submit the validation tests in the
   cluster
    ```
    $ python ensemble.py --case $VSC_SCRATCH/cesm/cases/UF-CAM-ECT.cesm_2.1.3_2021b.000 --ect cam --uf --mach hydra --compiler gnu --compset F2000climo --res f19_f19_mg17
    $ python ensemble.py --case $VSC_SCRATCH/cesm/cases/POP-ECT.cesm_2.1.3_2021b.000 --ect pop --mach hydra --compiler gnu --compset G --res T62_g17
    ```

3. Use the [web tool from UCAR](https://www.cesm.ucar.edu/models/cesm2/verification/)
   to compare the resulting `.nc` files with the reference data

Results of the validations carried out in the VSC clusters can be found in
[cesm-config/tests/validation](validation):

* CESM v2.1.1 passed all tests in the following clusters:
    * Breniac with intel/2018a
        * UF-CAM-ECT test: validated by Steven Johan De Hertog (VUB)
        * POP-ECT: validated by Alex Domingo (VUB)
    * Hydra with foss/2019a
        * UF-CAM-ECT test: validated by Alex Domingo (VUB)
        * POP-ECT: validated by Alex Domingo (VUB)

* CESM v2.2.0 passed all tests in the following clusters:
    * Hydra with foss/2021b
        * UF-CAM-ECT test: validated by Alex Domingo (VUB)
        * POP-ECT: validated by Alex Domingo (VUB)
    * Hortense with foss/2021b
        * UF-CAM-ECT test: validated by Alex Domingo (VUB)
        * POP-ECT: validated by Alex Domingo (VUB)

## Performance and Scaling Tests

CIME provides a load balancing tool to measure the performance of different PE layouts. This allows to tune the parallelization of the simulation at a higher level and, depending on the computational resources, it can help to minimize downtimes and improve performance. More info about PE layouts in the [CESM User's Guide](http://www.cesm.ucar.edu/models/cesm1.2/cesm/doc/usersguide/x1927.html).

The [CIME Load Balancing Tool](https://esmci.github.io/cime/versions/cesm2.2/html/misc_tools/load-balancing-tool.html) is located in the source code of CIME at `cime/tools/load_balancing_tool/`. It provides 2 scripts:

* `load_balancing_submit.py`: parses the PE layout description (XML), creates corresponding cases for a given compset and resolution and submits the cases
    ```
    $ module load CESM-deps
    $ export PYTHONPATH="$(realpath ../../scripts/):$(realpath .):$PYTHONPATH"
    $ python load_balancing_submit.py --res f09_g17 --compset B1850 --pesfile PES-f09_g17-B1850.xml --project badmin
    ```

* `load_balancing_solve.py`: optimises the layout based on some model (*e.g.* IceLndWavAtmOcn)
    ```
    $ module load CESM-deps PuLP
    $ export PYTHONPATH="$(realpath ../../scripts/):$(realpath .):$PYTHONPATH"
    $ python load_balancing_solve.py --total-tasks 512 --blocksize 8
    ```
    note: adjust *total tasks* and *blocksize* according to your PE layout

We provide two patches in [cesm-config/tests/load_balancing/patches](load_balancing/patches) to update the load balancing tool in CESM v2.2.0 to make it compatible with Python 3 and PuLP v2.5.1.

