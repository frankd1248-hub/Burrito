#include <stdlib.h>

#include "natives.h"
#include "../vm.h"

#include "barray.h"
#include "bcast.h"
#include "bgraphics.h"
#include "bio.h"
#include "bjson.h"
#include "bmath.h"
#include "bmap.h"
#include "bstring.h"
#include "bsys.h"
#include "btime.h"

static bool hasFieldNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("hasField() requires an instance and a string.", 45));
        return false;
    }
#endif

    ObjInstance* instance = AS_INSTANCE(args[0]);
    Value dummy;
    *result = BOOL_VAL(tableGet(&instance->fields, AS_STRING(args[1]), &dummy));
    return true;
}

static bool getFieldNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("getField() requires an instance and a string.", 45));
        return false;
    }
#endif

    ObjInstance* instance = AS_INSTANCE(args[0]);
    Value value;
    if (!tableGet(&instance->fields, AS_STRING(args[1]), &value)) {
        value = NULL_VAL;
    }
    
    *result = value;
    return true;
}

static bool setFieldNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("setField() requires an instance, a string, and a value.", 55));
        return false;
    }
#endif

    ObjInstance* instance = AS_INSTANCE(args[0]);
    tableSet(&instance->fields, AS_STRING(args[1]), args[2]);
    *result = args[2];
    return true;
}

static bool assertNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("assert() takes a bool and a string.", 35));
        return false;
    }
#endif
    if (!AS_BOOL(args[0])) {
        *result = args[1];
        return false;
    }
    *result = NULL_VAL;
    return true;
}

static bool mapConstructorNative(int argCount, Value* args, Value* result) {
    ObjMap* map = newMap();
    *result = OBJ_VAL(map);
    return true;
}

void defineAllNatives() {
    defineModule("cast", buildCastModule());
    defineModule("io", buildIOModule());
    defineModule("json", buildJSONModule());
    defineModule("math", buildMathModule());
    defineModule("sys", buildSysModule());
    defineModule("time", buildTimeModule());

    buildArrayMethods();
    buildMapMethods();
    buildStringMethods();

    ObjModule** gmodules = buildGraphicsModules();

    defineModule("game", gmodules[1]);
    defineModule("graphics", gmodules[0]);

    defineNative("hasField", newNative(hasFieldNative));
    defineNative("getField", newNative(getFieldNative));
    defineNative("setField", newNative(setFieldNative));
    defineNative("assert", newNative(assertNative));
    
    defineNative("map", newNative(mapConstructorNative));
}