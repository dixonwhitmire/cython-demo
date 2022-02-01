# cython

[cython](https://cython.readthedocs.io/en/latest/index.html) is an external module that builds a "foreign function interface" for C libraries. Cython provides an alternate syntax and type system for Python supported by an external build system.
Cython supports calling C from Python and calling Python from C.

## Directory Contents

- demo.pyx: The Cython demo implementation. The demo uses the "rand" function from C's stdlib, and implements a demo function using Cython types.
- main.py: Demo script for the compiled FFI.
- setup.py: Builds and distributes the extension module defined in demo.pyx
