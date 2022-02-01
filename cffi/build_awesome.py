from cffi import FFI
from os.path import join, dirname, abspath


LIBRARY_PATH = join(
    dirname(dirname(abspath(__file__))),
    "library-c"
)

ffibuilder = FFI()

ffibuilder.cdef("int demo(int numCalculations);")

ffibuilder.set_source("_awesome_demo",
                      "#include <awesome.h>",
                      include_dirs=[LIBRARY_PATH],
                      sources=[join(LIBRARY_PATH, "awesome.c")]
                      )
if __name__ == "__main__":
    print(f"library path is {LIBRARY_PATH}")
    ffibuilder.compile(verbose=True)
