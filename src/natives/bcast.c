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

    return true;
}

static Value toString(Value arg) {
    if (IS_NULL(arg)) {
        return OBJ_VAL(copyString("null", 4));
    } else if (IS_BOOL(arg)) {
        return AS_BOOL(arg)
            ? OBJ_VAL(copyString("true", 4))
            : OBJ_VAL(copyString("false", 5));
    } else if (IS_NUMBER(arg)) {
        char str[256];
        int length = snprintf(str, sizeof(str), "%g", AS_NUMBER(arg));
        return OBJ_VAL(copyString(str, length));
    } else if (IS_OBJ(arg)) {
        switch (AS_OBJ(arg)->type) {
            case OBJ_ARRAY: {
                ObjArray* array = AS_ARRAY(arg);
                if (array->size == 0)
                    return OBJ_VAL(copyString("{ }", 3));

                // Push array on stack to keep it rooted during allocations.
                push(arg);

                char* result = malloc(32768);
                int length = 0;
                length += snprintf(result + length, 32768 - length, "{ ");

                for (int i = 0; i < array->size; i++) {
                    // Re-read array from stack in case GC moved things.
                    ObjArray* arr = AS_ARRAY(peek(0));
                    Value elem = toString(arr->values[i]);
                    ObjString* s = AS_STRING(elem);
                    length += snprintf(result + length, 32768 - length,
                                       "%s", s->chars);
                    if (i < array->size - 1)
                        length += snprintf(result + length, 32768 - length, ", ");
                    if (length >= 32767) break;
                }

                length += snprintf(result + length, 32768 - length, " }");
                pop(); // unroot array

                Value res = OBJ_VAL(copyString(result, length));
                free(result);
                return res;
            }
            case OBJ_CLASS: {
                ObjClass* class_ = AS_CLASS(arg);
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Class %s>",
                                   class_->name->chars);
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_CLOSURE: {
                ObjString* name = AS_CLOSURE(arg)->function->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Closure %s>",
                                   name ? name->chars : "?");
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_FUNCTION: {
                ObjString* name = AS_FUNCTION(arg)->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Function %s>",
                                   name ? name->chars : "?");
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_INSTANCE: {
                ObjString* name = AS_INSTANCE(arg)->class_->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Instance of %s>",
                                   name->chars);
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_MODULE: return OBJ_VAL(copyString("<Module>", 8));
            case OBJ_NATIVE: return OBJ_VAL(copyString("<Native>", 8));
            case OBJ_STRING: return arg;
            case OBJ_UPVALUE: return OBJ_VAL(copyString("<Upvalue>", 9));
            case OBJ_RESOURCE: return OBJ_VAL(copyString("<Resource>", 10));
        }
    }
    return OBJ_VAL(copyString("<unknown>", 9));
}

static bool toStringNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("toString() expects one argument.", 32));
        return false;
    }
#endif

    *result = toString(args[0]);
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