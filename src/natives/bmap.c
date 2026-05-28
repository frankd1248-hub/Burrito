#include "bmap.h"

#include "../vm.h"
#include "../memory.h"

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
            if (keys->size == keys->capacity) {
                int oldCap = keys->capacity;
                keys->capacity = GROW_CAPACITY(keys->capacity);
                keys->values = GROW_ARRAY(Value, keys->values, oldCap, keys->capacity);
            }

            keys->values[keys->size++] = OBJ_VAL(t->entries[i].key);
        }
    }

    pop(); pop();
    *result = OBJ_VAL(keys);
    return true;
}

static bool mapValuesNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_MAP(args[0])) {
        *result = OBJ_VAL(copyString("values() expects a map.", 23));
        return false;
    }
#endif

    push(args[0]);              // root map across newArray allocation
    ObjArray* values = newArray(0);
    push(OBJ_VAL(values));

    Table* t = &AS_MAP(args[0])->table;  // re-read after GC
    for (int i = 0; i < t->capacity; i++) {
        Entry* entry = &t->entries[i];
        if (entry->key == NULL) continue;

        values = AS_ARRAY(peek(0));      // re-read: GROW_ARRAY may relocate
        if (values->size == values->capacity) {
            int oldCap = values->capacity;
            values->capacity = GROW_CAPACITY(values->capacity);
            values->values = GROW_ARRAY(Value, values->values, oldCap, values->capacity);
        }

        values->values[values->size++] = entry->value;
    }

    *result = peek(0);
    pop(); pop();
    return true;
}

static bool mapSizeNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_MAP(args[0])) {
        *result = OBJ_VAL(copyString("size() expects a map.", 21));
        return false;
    }
#endif

    Table* t = &AS_MAP(args[0])->table;
    int count = 0;
    for (int i = 0; i < t->capacity; i++) {
        if (t->entries[i].key != NULL) count++;
    }

    *result = NUMBER_VAL(count);
    return true;
}

static bool mapCopyNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_MAP(args[0])) {
        *result = OBJ_VAL(copyString("copy() expects a map.", 21));
        return false;
    }
#endif

    push(args[0]);              // root source across newMap allocation
    ObjMap* clone = newMap();
    push(OBJ_VAL(clone));

    tableAddAll(&AS_MAP(args[0])->table, &AS_MAP(peek(0))->table);

    *result = peek(0);
    pop(); pop();
    return true;
}

// other's values win on collision
static bool mapMergeNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_MAP(args[0]) || !IS_MAP(args[1])) {
        *result = OBJ_VAL(copyString("merge() expects two maps.", 25));
        return false;
    }
#endif

    push(args[0]);              // root both maps across newMap allocation
    push(args[1]);
    ObjMap* merged = newMap();
    push(OBJ_VAL(merged));

    tableAddAll(&AS_MAP(args[0])->table, &AS_MAP(peek(0))->table);  // base first
    tableAddAll(&AS_MAP(args[1])->table, &AS_MAP(peek(0))->table);  // other overwrites

    *result = peek(0);
    pop(); pop(); pop();
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
    addMethod("keys",   4, mapKeysNative);
    addMethod("values", 6, mapValuesNative);
    addMethod("size",   4, mapSizeNative);
    addMethod("copy",   4, mapCopyNative);
    addMethod("merge",  5, mapMergeNative);
}