#include <stdio.h>
#include <stdlib.h>
#include <awesome.h>

int main(int argc, char *argv[]) {

    if (argc < 2) {
        puts("Expecting one argument, number of iterations");
        return EXIT_FAILURE;
    }

    size_t numIterations = 0;

    if (sscanf(argv[1], "%zu", &numIterations) != 1) {
        fprintf(stderr, "error %s is not an integer value", argv[1]);
        return EXIT_FAILURE;
    }

    fprintf(stdout, "Running %zu iterations...\n", numIterations);

    size_t result = multiplyAssign(numIterations);
    fprintf(stdout, "Received result %zu", result);
    puts("");

    return EXIT_SUCCESS;
}
