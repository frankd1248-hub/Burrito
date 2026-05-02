#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "bcast.h"
#include "../vm.h"

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
    
    int written;
    if (fabs(round(val) - val) < 0.00001) {
        written = snprintf(str, size + 1, "%ld", (long)round(val));
    } else {
        written = snprintf(str, size + 1, "%.4lf", val);
    }
    *result = OBJ_VAL(copyString(str, written));
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

static bool typeOfNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("typeOf() only takes one argument.", 33));
        return false;
    }
#endif

#ifdef NAN_BOXING
    if (IS_BOOL(args[0])) {
        *result = OBJ_VAL(copyString("bool", 4));
    } else if (IS_NULL(args[0])) {
        *result = OBJ_VAL(copyString("null", 4));
    } else if (IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("number", 6));
    } else if (IS_OBJ(args[0])) {
        switch (AS_OBJ(args[0])->type) {
            case OBJ_ARRAY:    *result = OBJ_VAL(copyString("Array", 5)); break;
            case OBJ_CLASS:    *result = OBJ_VAL(copyString("Class", 5)); break;
            case OBJ_CLOSURE:  *result = OBJ_VAL(copyString("Closure", 7)); break;
            case OBJ_FUNCTION: *result = OBJ_VAL(copyString("Function", 8)); break;
            case OBJ_INSTANCE: *result = OBJ_VAL(copyString("Instance", 8)); break;
            case OBJ_MODULE:   *result = OBJ_VAL(copyString("Module", 6)); break;
            case OBJ_NATIVE:   *result = OBJ_VAL(copyString("Native", 6)); break;
            case OBJ_STRING:   *result = OBJ_VAL(copyString("String", 6)); break;
            case OBJ_UPVALUE:  *result = OBJ_VAL(copyString("Upvalue", 7)); break;
        }
    }
#else
    switch (args[0].type) {
        case VAL_BOOL:   *result = OBJ_VAL(copyString("bool", 4)); break;
        case VAL_NULL:   *result = OBJ_VAL(copyString("null", 4)); break;
        case VAL_NUMBER: *result = OBJ_VAL(copyString("number", 6)); break;
        case VAL_OBJ: {
            switch (AS_OBJ(args[0])->type) {
                case OBJ_ARRAY:    *result = OBJ_VAL(copyString("Array", 5)); break;
                case OBJ_CLASS:    *result = OBJ_VAL(copyString("Class", 5)); break;
                case OBJ_CLOSURE:  *result = OBJ_VAL(copyString("Closure", 7)); break;
                case OBJ_FUNCTION: *result = OBJ_VAL(copyString("Function", 8)); break;
                case OBJ_INSTANCE: *result = OBJ_VAL(copyString("Instance", 8)); break;
                case OBJ_MODULE:   *result = OBJ_VAL(copyString("Module", 6)); break;
                case OBJ_NATIVE:   *result = OBJ_VAL(copyString("Native", 6)); break;
                case OBJ_STRING:   *result = OBJ_VAL(copyString("String", 6)); break;
                case OBJ_UPVALUE:  *result = OBJ_VAL(copyString("Upvalue", 7)); break;
            }
            break;
        }
    }
#endif

    return true;
}

ObjModule* buildCastModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
    tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
    tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));

    pop();
    return module;
}