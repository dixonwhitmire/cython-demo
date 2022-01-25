#include <stdio.h>

size_t multiplyAssign(size_t numIterations) {
    size_t result = 0;

    for (size_t i = 0; i < numIterations; i++) {
        result += i;
    }
    return result;
}