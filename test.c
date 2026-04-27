#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    char* str = "12345.1234\0";
    char* end;

    double value = strtod(str, &end);

    printf("Value: %lf, end: %s", value, end);

    for (;;) {
        if (*end == '\0') {
            printf("NULL ");
            break;
        } else {
            printf("%c", *end);
        }

        end++;
    }

    printf("\n");
    return 0;
}