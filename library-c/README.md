# standalone-c

The library C module is the shared library used within the python-c-integration use-cases. 

## Directory Contents

- awesome.h: header file for awesome.c
- awesome.c: contains the multiplyAssign implementation

## Build

To build the library use the following commands:
```shell
clang -Wall -c -fPIC -o awesome.o awesome.c -I.
clang -shared -fPIC -Wl,-install_name,awesome-lib.so.1 -o awesome-lib.so awesome.o -lc
```
This command may vary based on your compiler and target platform.
