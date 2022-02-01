import argparse
from _awesome_demo.lib import demo

DEFAULT_ITERATIONS = 1000


def parse_args():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("number_iterations",
                            type=int,
                            help="The number of iterations/calculations to perform",
                            default=DEFAULT_ITERATIONS)
    return arg_parser.parse_args()


def execute_demo_function(number_iterations):
    demo(number_iterations)


if __name__ == "__main__":
    args = parse_args()
    execute_demo_function(args.number_iterations)
