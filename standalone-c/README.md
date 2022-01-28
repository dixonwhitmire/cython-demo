# standalone-c

The standalone C application executes the "demo" function which is used and implemented in the other python-c-integration use-cases. 

The application accepts a single argument, an integer, which sets the number of calculations performed.

## Build

To build the application use a command similar to the following:
```shell
clang -Wall -o app main.c awesome.c -I.
```
This command may vary based on your compiler and target platform.

## Usage
```shell
mbp standalone-c % time ./app 5000000
./app 5000000  0.06s user 0.00s system 29% cpu 0.226 total
```

## Directory Contents

- main.c: application entry-point
- awesome.h: header file for awesome.c
- awesome.c: contains the multiplyAssign implementation
