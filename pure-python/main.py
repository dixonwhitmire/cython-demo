import argparse
import random

MAXIMUM_RANDOM_VALUE = 999999
DEFAULT_ITERATIONS = 5000000


def parse_args():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("number_iterations",
                            type=int,
                            help="The number of iterations/calculations to perform",
                            default=DEFAULT_ITERATIONS)
    return arg_parser.parse_args()


def generate_random_number():
    return random.randint(0, MAXIMUM_RANDOM_VALUE)


def demo(number_calculations):
    """
    Demo function that performs arbitrary calculations

    :param number_calculations: The number of iterations/calculations to execute
    :return: random integer
    """
    for _ in range(number_calculations):
        a = generate_random_number()
        b = generate_random_number()
        c = a + b
    return generate_random_number()


if __name__ == "__main__":
    args = parse_args()
    demo(args.number_iterations)
