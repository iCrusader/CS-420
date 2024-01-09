#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Dynamically allocate memory for the integers
    int *numbers = malloc(argc * sizeof(int));

    // Check each element and print
    for (int arg = 1; arg < argc; arg++) {
        numbers[arg] = atoi(argv[arg]);
        if(numbers[arg] > 170)
            printf("255 ");
        else
            printf("0 ");
    }
    // Free dynamically allocated memory
    free(numbers);
    return 0;
}