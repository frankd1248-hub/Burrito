#include "barray.h"

#include "../memory.h"
#include "../vm.h"

static bool pushNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("push() takes one array argument and another value.", 50));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);

    // Check if we need to grow the array
    if (array->size == array->capacity) {
        int oldCap = array->capacity;
        array->capacity = GROW_CAPACITY(array->capacity);
        array->values = GROW_ARRAY(Value, array->values, oldCap, array->capacity);
    }

    array->values[array->size++] = args[1];
    *result = BOOL_VAL(true);
    return true;
}

static bool popNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("pop() takes one array argument.", 31));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    if (array->size == 0) {
        *result = NULL_VAL;
        return true;
    }

    *result = array->values[--array->size];
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
}

ObjModule* buildArrayModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "push", 4, pushNative);
    addNative(module, "pop", 3, popNative);

    pop();
    return module;
}