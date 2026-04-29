#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "bmath.h"
#include "../vm.h"

/**
 * Successful check returns true.
 */
#ifdef STRICT_NATIVES
static bool checkNumberArguments(char* name, Value* args, Value* result, int count) {
    for (int i = 0; i < count; i++) {
        if (!IS_NUMBER(args[i])) {
            char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
            strcat(errorMessage, name);
            strcat(errorMessage, "() expects number parameters.");
            *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
            return false;
        }
    }

    return true;
}
#endif

static bool powerNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2) {
        *result = OBJ_VAL(copyString("power() expects two number arguments.", 30));
        return false;
    }

    if (!checkNumberArguments("power", args, result, 2))
        return false;
#endif

    *result = NUMBER_VAL(pow(args[0].as.number, args[1].as.number));
    return true;
}

static bool sineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("sin() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("sin", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(sin(args[0].as.number));
    return true;
}

static bool cosineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("cos() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("cos", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(cos(args[0].as.number));
    return true;
}

static bool arcsineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("asin() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("asin", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(asin(args[0].as.number));
    return true;
}

static bool arccosineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("acos() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("acos", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(acos(args[0].as.number));
    return true;
}

ObjModule* buildMathModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    tableSet(&module->table, copyString("pi", 2), NUMBER_VAL(3.14159265358979323846));
    tableSet(&module->table, copyString("e", 1), NUMBER_VAL(2.7182818284590452354));

    tableSet(&module->table, copyString("power", 5), OBJ_VAL(newNative(powerNative)));
    tableSet(&module->table, copyString("sin", 3), OBJ_VAL(newNative(sineNative)));
    tableSet(&module->table, copyString("cos", 3), OBJ_VAL(newNative(cosineNative)));
    tableSet(&module->table, copyString("asin", 3), OBJ_VAL(newNative(arcsineNative)));
    tableSet(&module->table, copyString("acos", 3), OBJ_VAL(newNative(arccosineNative)));

    pop();
    return module;
}