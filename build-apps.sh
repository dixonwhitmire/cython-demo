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
cd ../

# build library-c
cd library-c
echo "building library-c aka awesome-lib.so ..."
rm -f awesome.o awesome-lib.so
clang -Wall -c -fPIC -o awesome.o awesome.c -I.
clang -shared -fPIC -Wl,-install_name,awesome-lib.so.1 -o awesome-lib.so awesome.o -lc
echo "build complete"
cd ../

# build extension module
cd extension
rm -rf venv && python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip setuptools
echo "building extension module"
echo "build complete"
source venv/bin/activate && python3 setup.py build_ext --inplace
cd ../

# build cffi module
cd cffi
echo "building cffi module"
rm -rf venv && python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip setuptools cffi
echo "build complete"
cd ../