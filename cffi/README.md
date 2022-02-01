# cffi

[cffi](https://cffi.readthedocs.io/en/latest/overview.html) is an external module that builds a "foreign function interface" for C libraries, so that may be called from Python code.
The cffi library provides integrations for ABI (Application Binary Interface) and API (Application Programming Interface) interfaces. This
example targets the API use-case as it is "generally" more performant.

## Directory Contents

- build_awesome.py: Defines the C sources and settings required to build the FFI to support the [library-c](../library-c) library.
- setup.py: The "install" wrapper for build_awesome.py.
- main.py: Demo script for the generated FFI.
