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