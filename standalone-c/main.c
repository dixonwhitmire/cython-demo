#include <stdio.h>
#include <stdlib.h>
#include <awesome.h>

int main(int argc, char *argv[]) {

    if (argc < 2) {
        puts("Expecting one argument, number of iterations");
        return EXIT_FAILURE;
    }

    int numCalculations = 0;

    if (sscanf(argv[1], "%d", &numCalculations) != 1) {
        fprintf(stderr, "error %s is not an integer value", argv[1]);
        return EXIT_FAILURE;
    }

    demo(numCalculations);

    return EXIT_SUCCESS;
}
