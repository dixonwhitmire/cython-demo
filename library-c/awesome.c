#include <stdio.h>
#include <stdlib.h>

const int MAXIMUM_RANDOM_VALUE = 999999;

int generateRandomNumber() {
    return rand() % MAXIMUM_RANDOM_VALUE;
}

/**
 * @brief Demo function that performs arbitrary calculations
 *
 * @param numCalculations The number of iterations/calculations to execute
 * @return int a random integer
 */
int demo(int numCalculations) {
    int result = 0;

    for (int i = 0; i < numCalculations; i++) {
        int a = generateRandomNumber();
        int b = generateRandomNumber();
        result = a + b;
    }
    return generateRandomNumber();
}