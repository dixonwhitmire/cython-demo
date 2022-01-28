from ctypes import CDLL, c_int
from os.path import abspath, dirname, join
import argparse

DEFAULT_ITERATIONS = 1000

LIBRARY_PATH = join(
    dirname(dirname(abspath(__file__))),
    "library-c",
    "awesome-lib.so"
)


def parse_args():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("number_iterations",
                            type=int,
                            help="The number of iterations/calculations to perform",
                            default=DEFAULT_ITERATIONS)
    return arg_parser.parse_args()


def execute_demo_function(number_iterations, library_path=LIBRARY_PATH):
    c_lib = CDLL(library_path)
    c_lib.demo.argtypes = [c_int]
    c_lib.demo.restype = c_int
    return c_lib.demo(number_iterations)


if __name__ == "__main__":
    args = parse_args()
    execute_demo_function(args.number_iterations)
