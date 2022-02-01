# python-c-integration

Demo repository used to examine the various approaches used to integrate [C](https://en.cppreference.com/w/c) with [Python](https://www.python.org/)

## Requirements

- A working C compiler
- Python 3.9 or higher

## Integration Examples

Each example is stored within a separate directory. Examples include:

- standalone-c: Standalone application written in C.
- library-c: C Library used for Python integrations.
- extension: C Python extension method.
- cffi: C Foreign Function Interface.
- ctypes: C Foreign Function Interface (Python Base Library)
- pure-python: Executable demo function in Python


Use [build-apps.sh](./build-apps.sh) to generate the assets used for testing. 
Create test metrics with [run-tests.sh](./run-tests.sh). `run-tests.sh` creates a CSV file with processing results. 
Note: python-c-integration scripts use the OS X versions/installations of clang and Python3.

## Run Tests

```shell
./build-apps.sh
./run-tests.sh
cat python-c-integrations.csv
```

## Comparisons

### ctypes
ctypes supports ABI based integrations using libraries loaded at runtime. ctypes requires the least effort to implement as it does not require a compilation or build step.
ctypes may be a good choice if there is a need to integrate with a small number of C functions or libraries when performance is not critical.

### cffi
cffi supports both ABI and API integrations. The latter requires a compilation and build step, which optimizes execution. There is also less cognitive
overhead as the integration is a build-time effort with cffi's custom builder. Once the extension module is built and installed, it is imported and used like "plain old python".
cffi is a good choice if you need to utilize existing C libraries within a Python application or service.

### cython
cython supports calling C from Python (including standard libraries) and calling Python from C. Developers create cython enabled modules within *.pyx
files (that's the convention but not required) using either Python 3 compliant decorators and type hints, or an alternate "cython" syntax. The cython module
is then built as a C extension module which can be called from Python.

cython comes in handy when you need to optimize performance critical paths and don't want to write straight C.

### testing observations
The output from a `run-tests.sh` job is below. The tests were run on a 2019 Macbook Pro (Big Sur) with a 2.3GHz 8-Core Intel i9 
processor and 16GB of RAM. Processing results will vary across runs, and of course the demo function is rather arbitrary code :) and
no single approach is optimized. So please take the results below with a grain of salt.

The two ends of the spectrum, from a performance standpoint are the `standalone-c` and `pure-python` applications. The integration example's execution
time varies by iteration.


|iterations|app_name     |elapsed_time|
|----------|-------------|------------|
|10        | standalone-c| 0.007      |
|10        | extension   | 0.078      |
|10        | cython      | 0.062      |
|10        | cffi        | 0.051      |
|10        | ctypes      | 0.047      |
|10        | pure-python | 0.047      |
|100       | standalone-c| 0.005      |
|100       | extension   | 0.047      |
|100       | cython      | 0.041      |
|100       | cffi        | 0.039      |
|100       | ctypes      | 0.044      |
|100       | pure-python | 0.046      |
|1000      | standalone-c| 0.005      |
|1000      | extension   | 0.038      |
|1000      | cython      | 0.038      |
|1000      | cffi        | 0.039      |
|1000      | ctypes      | 0.041      |
|1000      | pure-python | 0.042      |
|10000     | standalone-c| 0.005      |
|10000     | extension   | 0.039      |
|10000     | cython      | 0.039      |
|10000     | cffi        | 0.039      |
|10000     | ctypes      | 0.041      |
|10000     | pure-python | 0.059      |
|100000    | standalone-c| 0.006      |
|100000    | extension   | 0.040      |
|100000    | cython      | 0.051      |
|100000    | cffi        | 0.040      |
|100000    | ctypes      | 0.071      |
|100000    | pure-python | 0.237      |
|1000000   | standalone-c| 0.015      |
|1000000   | extension   | 0.051      |
|1000000   | cython      | 0.171      |
|1000000   | cffi        | 0.050      |
|1000000   | ctypes      | 0.051      |
|1000000   | pure-python | 1.863      |
