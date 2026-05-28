#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "chunk.h"
#include "debug.h"
#include "vm.h"

/**
 * A simple REPL.
 * Only allows a single line of input.
 */
static void repl() {
    if (disassembleFlag) {
        FILE* f = fopen("output.text", "w");
        fclose(f);
    }

    char line[1024];
    for (;;) {
        printf("> ");

        if (!fgets(line, sizeof(line), stdin)) {
            printf("\n");
            break;
        }

        interpret(line);
    }
}

/**
 * Runs source from a file.
 */
static void runFile(const char* path) {
    if (disassembleFlag) {
        FILE* f = fopen("output.text", "w");
        fclose(f);
    }

    char* source = readFile(path);
    InterpretResult result = interpret(source);
    free(source);

    if (result == INTERPRET_COMPILE_ERROR) exit(65);
    if (result == INTERPRET_RUNTIME_ERROR) exit(70);
}

int main(int argc, char** argv) {
    initVM();

    vm.argc = argc;
    vm.argv = argv;

    // I would write an actual terminal app but I am too lazy and there's only one flag.
    if (argc == 1) {
        repl();
    } else if (argc == 2) {
        if (argv[1][0] == '-') {
            if (strcmp(argv[1], "-disasm") == 0) {
                disassembleFlag = true;
                repl();
            } else {
                fprintf(stderr, "Unknown flag %s", argv[1]);
            }
        } else {
            runFile(argv[1]);
        }
    } else if (argc == 3) {
        if (argv[2][0] != '-') {
            fprintf(stderr, "Expected flag.\n");
            exit(64);
        }

        if (strcmp(argv[2], "-disasm") == 0) {
            disassembleFlag = true;
            runFile(argv[1]);
        } else {
            fprintf(stderr, "Unknown flag %s", argv[1]);
        }
    } else {
        fprintf(stderr, "Usage: burrito [path] [flags]...\n");
        exit(64);
    }

    freeVM();
    return 0;
}