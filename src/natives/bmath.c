#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "bmath.h"

/**
 * Successful check returns true.
 */
static bool checkNumberArguments(char* name, Value* args, Value* result, int count) {
    for (int i = 0; i < count; i++) {
        if (!IS_NUMBER(args[i])) {
            char* errorMessage = malloc(sizeof(char) * (30 + strlen(name)));
            strcat(errorMessage, name);
            strcat(errorMessage, "() expects number parameters.");
            *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
            return false;
        }
    }

    return true;
}

static bool powerNative(int argCount, Value* args, Value* result) {
    if (argCount != 2) {
        *result = OBJ_VAL(copyString("power() expects two arguments.", 30));
        return false;
    }

    if (!checkNumberArguments("power", args, result, 2))
        return false;

    *result = NUMBER_VAL(pow(args[0].as.number, args[1].as.number));
    return true;
}

static bool sineNative(int argCount, Value* args, Value* result) {
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("sin() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("sin", args, result, 1))
        return false;

    *result = NUMBER_VAL(sin(args[0].as.number));
    return true;
}

static bool cosineNative(int argCount, Value* args, Value* result) {
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("cos() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("cos", args, result, 1))
        return false;

    *result = NUMBER_VAL(cos(args[0].as.number));
    return true;
}

ObjModule* buildMathModule() {
    ObjModule* module = newModule();

    tableSet(&module->table, copyString("pi", 2), NUMBER_VAL(3.14159265358979323846));
    tableSet(&module->table, copyString("e", 1), NUMBER_VAL(2.7182818284590452354));

    tableSet(&module->table, copyString("power", 5), OBJ_VAL(newNative(powerNative)));
    tableSet(&module->table, copyString("sin", 3), OBJ_VAL(newNative(sineNative)));
    tableSet(&module->table, copyString("cos", 3), OBJ_VAL(newNative(cosineNative)));

    return module;
}