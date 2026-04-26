#include <time.h>

#include "btime.h"

static bool clockNative(int argCount, Value* args, Value* result) {
    *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
    return true;
}

static bool sleepNative(int argCount, Value* args, Value* result) {
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("sleep() expects 1 number argument.", 34));
        return false;
    }

    double seconds = AS_NUMBER(args[0]);
    SLEEP(seconds * 1000000);
    return true;
}

ObjModule* buildTimeModule() {
    ObjModule* module = newModule();

    tableSet(
        &module->table, 
        copyString("clock", 5), 
        OBJ_VAL(newNative(clockNative))
    );

    tableSet(
        &module->table,
        copyString("sleep", 5),
        OBJ_VAL(newNative(sleepNative))
    );

    return module;
}