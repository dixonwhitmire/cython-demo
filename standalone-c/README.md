# standalone-c

The standalone C application serves as the target library for the Python extension module use-case. 

The application accepts a single argument, an integer, which defines the number of iterations used for multiplication assignment.

## Usage
```shell
mbp standalone-c % ./external-lib 1000
Running 1000 iterations...
Received result 499500
```

## Directory Contents

- main.c: application entry-point
- awesome.h: header file for awesome.c
- awesome.c: contains the multiplyAssign implementation
- external-lib: application binary, aka "the built" application

## Build

To rebuild the application use a command similar to the following:
```shell
clang -Wall -Wformat -o external-lib main.c awesome.c -I.
```
This command may vary based on your target platform.
