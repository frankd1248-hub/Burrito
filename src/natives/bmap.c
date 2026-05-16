#include "bmap.h"

#include "../vm.h"

// map.set(key, val) — key must be a string
static bool mapSetNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_MAP(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("set() expects a string key and a value.", 38));
        return false;
    }
#endif
    tableSet(&AS_MAP(args[0])->table, AS_STRING(args[1]), args[2]);
    *result = BOOL_VAL(true);
    return true;
}

// map.get(key) → value or null
static bool mapGetNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_MAP(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("get() expects a string key.", 27));
        return false;
    }
#endif
    if (!tableGet(&AS_MAP(args[0])->table, AS_STRING(args[1]), result)) {
        *result = NULL_VAL;
    }
    return true;
}

// map.has(key) → bool
static bool mapHasNative(int argCount, Value* args, Value* result) {
    Value dummy;
    *result = BOOL_VAL(tableGet(&AS_MAP(args[0])->table, AS_STRING(args[1]), &dummy));
    return true;
}

// map.delete(key) → bool (true if key existed)
static bool mapDeleteNative(int argCount, Value* args, Value* result) {
    *result = BOOL_VAL(tableDelete(&AS_MAP(args[0])->table, AS_STRING(args[1])));
    return true;
}

// map.keys() → array of string keys
static bool mapKeysNative(int argCount, Value* args, Value* result) {
    ObjMap* map = AS_MAP(args[0]);
    push(args[0]);   // root map across newArray allocation
    ObjArray* keys = newArray(0);
    push(OBJ_VAL(keys));

    Table* t = &AS_MAP(args[0])->table;  // re-read after GC
    for (int i = 0; i < t->capacity; i++) {
        if (t->entries[i].key != NULL) {
            ensureCapacity(keys);
            keys->values[keys->size++] = OBJ_VAL(t->entries[i].key);
        }
    }

    pop(); pop();
    *result = OBJ_VAL(keys);
    return true;
}

static void addMethod(const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&vm.mapMethods, copyString(name, length), peek(0));
    pop();
}

void buildMapMethods() {
    addMethod("set",    3, mapSetNative);
    addMethod("get",    3, mapGetNative);
    addMethod("has",    3, mapHasNative);
    addMethod("delete", 6, mapDeleteNative);
    addMathod("keys",   4, mapKeysNative);
}