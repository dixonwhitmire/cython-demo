#!/bin/bash
# build-apps.sh
# Builds the various applications and libraries used for python-c-integration test executions.
# As this is a demo project, this script makes the assumption that `clang` and `python3` are the
# respective platform's C compiler and Python interpreter.

# build standalone c application
cd standalone-c
echo "building standalone-c ..."
rm -f app
clang -Wall -o app awesome.c main.c -I.
echo "build complete"

# build library-c
cd ../library-c
echo "building library-c aka awesome-lib.so ..."
rm -f awesome.o awesome-lib.so
clang -Wall -c -fPIC -o awesome.o awesome.c -I.
clang -shared -fPIC -Wl,-install_name,awesome-lib.so.1 -o awesome-lib.so awesome.o -lc
echo "build complete"

cd ../