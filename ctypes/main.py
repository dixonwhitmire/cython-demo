from ctypes import CDLL, c_int
from os.path import abspath, dirname, join

LIBRARY_PATH = join(
    dirname(dirname(abspath(__file__))),
    "awesome-lib.so"
)


def execute_demo_function(number_iterations, library_path=LIBRARY_PATH):
    c_lib = CDLL(library_path)
    c_lib.demo.argtypes = [c_int]
    c_lib.demo.restype = c_int

    return c_lib.demo(number_iterations)


if __name__ == "__main__":
    result = execute_demo_function()