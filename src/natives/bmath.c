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
            free(errorMessage);
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

    *result = NUMBER_VAL(pow(AS_NUMBER(args[0]), AS_NUMBER(args[1])));
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

    *result = NUMBER_VAL(sin(AS_NUMBER(args[0])));
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

    *result = NUMBER_VAL(cos(AS_NUMBER(args[0])));
    return true;
}

static bool tangentNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("tan() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("tan", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(tan(AS_NUMBER(args[0])));
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

    *result = NUMBER_VAL(asin(AS_NUMBER(args[0])));
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

    *result = NUMBER_VAL(acos(AS_NUMBER(args[0])));
    return true;
}

static bool arctangentNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("atan() expects one argument.", 27));
        return false;
    }

    if (!checkNumberArguments("atan", args, result, 1))
        return false;
#endif

    *result = NUMBER_VAL(atan(AS_NUMBER(args[0])));
    return true;
}

static bool atan2Native(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
        *result = OBJ_VAL(copyString("atan2() takes two number arguments.", 35));
        return false;
    }
#endif

    *result = NUMBER_VAL(atan2(AS_NUMBER(args[0]), AS_NUMBER(args[1])));
    return true;
}

static bool randNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("rand() does not expect arguments.", 33));
        return false;
    }
#endif

    *result = NUMBER_VAL(((double) rand()) / RAND_MAX);
    return true;
}

static bool randRangeNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
        *result = OBJ_VAL(copyString("randRange() expects two number arguments.", 41));
        return false;
    }
#endif

    double lo = AS_NUMBER(args[0]);
    double hi = AS_NUMBER(args[1]);
    double r = ((double) rand()) / RAND_MAX;

    *result = NUMBER_VAL(r * (hi - lo) + lo);
    return true;
}

static bool floorNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("floor() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(floor(AS_NUMBER(args[0])));
    return true;
}

static bool ceilNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("ceil() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(ceil(AS_NUMBER(args[0])));
    return true;
}

static bool roundNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("round() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(round(AS_NUMBER(args[0])));
    return true;
}

static bool sqrtNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("sqrt() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(sqrt(AS_NUMBER(args[0])));
    return true;
}

static bool cbrtNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("cbrt() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(cbrt(AS_NUMBER(args[0])));
    return true;
}

static bool logNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("log() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(log(AS_NUMBER(args[0])));
    return true;
}

static bool log2Native(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("log2() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(log2(AS_NUMBER(args[0])));
    return true;
}

static bool log10Native(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("log10() expects one number argument.", 36));
        return false;
    }
#endif

    *result = NUMBER_VAL(log10(AS_NUMBER(args[0])));
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
}

static void addConst(ObjModule* module, const char* name, int length, double value) {
    tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
}

ObjModule* buildMathModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addConst(module, "pi", 2, 3.14159265358979323846);
    addConst(module, "e", 1, 2.7182818284590452354);

    addNative(module, "power", 5, powerNative);
    addNative(module, "sqrt", 4, sqrtNative);
    addNative(module, "cbrt", 4, cbrtNative);

    addNative(module, "sin", 3, sineNative);
    addNative(module, "cos", 3, cosineNative);
    addNative(module, "tan", 3, tangentNative);

    addNative(module, "asin", 4, arcsineNative);
    addNative(module, "acos", 4, arccosineNative);
    addNative(module, "atan", 4, arctangentNative);
    addNative(module, "atan2", 5, atan2Native);

    addNative(module, "floor", 5, floorNative);
    addNative(module, "ceil", 4, ceilNative);
    addNative(module, "round", 5, roundNative);

    addNative(module, "rand", 4, randNative);
    addNative(module, "randRange", 9, randRangeNative);

    pop();
    return module;
}