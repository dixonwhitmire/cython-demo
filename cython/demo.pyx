from libc.stdlib cimport rand
import cython

MAXIMUM_RANDOM_VALUE: cython.int = 999999

@cython.cfunc
def generate_random_number() -> cython.int:
    return rand() % MAXIMUM_RANDOM_VALUE;

def demo(number_calculations: cython.int):
    """
    Demo function that performs arbitrary calculations

    :param number_calculations: The number of iterations/calculations to execute
    :return: random integer
    """
    for _ in range(number_calculations):
        a: cython.int = generate_random_number()
        b: cython.int = generate_random_number()
        c: cython.int = a + b
    return generate_random_number()
