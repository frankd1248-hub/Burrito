#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "bcast.h"

static bool ntosNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("ntos() expects one number argument.", 35));
        return false;
    }
#endif

    double val = AS_NUMBER(args[0]);
    int size = snprintf(NULL, 0, "%.4lf", val);
    char* str = malloc(sizeof(char) * size + 1);

    if (str == NULL) {
        *result = OBJ_VAL(copyString("Internal failure", 16));
        return false;
    }
    
    if (fabs(round(val) - val) < 0.00001) {
        snprintf(str, size + 1, "%ld", (long) round(val));
    } else {
        snprintf(str, size + 1, "%.4lf", val);
    }
    *result = OBJ_VAL(copyString(str, size));
    free(str);
    return true;
}

static bool stonNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("ston() expects one string argument.", 35));
        return false;
    }
#endif

    char* end;
    double val = strtod(AS_CSTRING(args[0]), &end);
    if (*end != '\0') {
        *result = OBJ_VAL(copyString("Invalid string", 14));
        return false;
    }

    *result = NUMBER_VAL(val);
    return true;
}

ObjModule* buildCastModule() {
    ObjModule* module = newModule();

    tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
    tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));

    return module;
}