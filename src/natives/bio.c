#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bio.h"
#include "../vm.h"

static bool getNumberNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("getNumber() does not expect arguments.", 38));
        return false;
    }
#endif

    double d;
    if (scanf("%lf", &d) != 1) {
        *result = OBJ_VAL(copyString("Failed to read number.", 23));
        return false;
    }

    int c;
    while ((c = getchar()) != '\n' && c != EOF);

    *result = NUMBER_VAL(d);
    return true;
}

static bool getStringNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("getString() does not expect arguments.", 38));
        return false;
    }
#endif

    char* buf = malloc(sizeof(char) * 256);
    if (scanf("%s", buf) != 1) {
        *result = OBJ_VAL(copyString("Failed to read string.", 23));
        return false;
    }

    int c;
    while ((c = getchar()) != '\n' && c != EOF);

    *result = OBJ_VAL(copyString(buf, strlen(buf)));
    free(buf);
    return true;
}

static bool readLineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("readLine() does not expect arguments.", 37));
        return false;
    }
#endif

    char* buf = malloc(sizeof(char) * 512);
    int count = 0;
    int c;

    while ((c = getchar()) != '\n') {
        buf[count++] = c;
    }
    buf[count] = '\0';

    *result = OBJ_VAL(copyString(buf, count));
    free(buf);
    return true;
}

ObjModule* buildIOModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
    tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
    tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));

    pop();
    return module;
}