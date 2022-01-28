# python-c-integration

Demo repository used to examine the various approaches to either integrate [C](https://en.cppreference.com/w/c) with [Python](https://www.python.org/)

## Requirements

- A working C compiler
- Python 3.9 or higher

## Use-Cases

python-c-integration provides several use-cases which are used to integrate a "demo" C function with Python. 
Use-cases are organized with top level directories.

- standalone-c: Executable demo function in C
- pure-python: Executable demo function in Python
- library-c: Demo function packaged as a shared C library
- ctypes: Integrates Python with C using ctypes as a foreign function interface

Use [build-apps.sh](./build-apps.sh) to generate the assets used for testing. 
Create test metrics with [run-tests.sh](./run-tests.sh). `run-tests.sh` creates a CSV file with processing results. 
Note: python-c-integration scripts use the OS X installations of clang and Python3.

## Run Tests

```shell
./build-apps.sh
./run-tests.sh
cat python-c-integrations.csv
```