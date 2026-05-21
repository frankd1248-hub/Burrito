#include <math.h>
#include <time.h>

#include "btime.h"
#include "../vm.h"

static bool clockNative(int argCount, Value* args, Value* result) {
    *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
    return true;
}

static bool timeNative(int argCount, Value* args, Value* result) {
    *result = NUMBER_VAL((double) ((long) time(NULL)));
    return true;
}

static inline void _sleep(double milliseconds) {
    struct timespec req = {
        (time_t) (milliseconds / 1000), 
        (time_t) (fmod(milliseconds, 1000.0) * 1000000)
    };
    struct timespec rem;

    while (nanosleep(&req, &rem) == -1) {
        req = rem;
    }
}

static bool sleepNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("sleep() expects 1 number argument.", 34));
        return false;
    }
#endif

    double seconds = AS_NUMBER(args[0]);
    _sleep(seconds * 1000);
    return true;
}

ObjModule* buildTimeModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
    tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
    tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));

    pop();
    return module;
}