#include "barray.h"

#include "../memory.h"
#include "../vm.h"

// Grow array's backing store by one GROW_CAPACITY step if it is full.
static void ensureCapacity(ObjArray* array) {
    if (array->size == array->capacity) {
        int oldCap = array->capacity;
        array->capacity = GROW_CAPACITY(array->capacity);
        array->values = GROW_ARRAY(Value, array->values, oldCap, array->capacity);
    }
}

static bool pushNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("push() takes one array argument and another value.", 50));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    ensureCapacity(array);
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
    if (array->size == 0) { *result = NULL_VAL; return true; }
    *result = array->values[--array->size];
    return true;
}

static bool insertNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1])) {
        *result = OBJ_VAL(copyString("insert() expects an array, a number index, and a value.", 55));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    int idx = (int) AS_NUMBER(args[1]);

    if (idx < 0 || idx > array->size) {
        *result = OBJ_VAL(copyString("insert() index out of bounds.", 29));
        return false;
    }

    ensureCapacity(array);
    for (int i = array->size; i > idx; i--)
        array->values[i] = array->values[i - 1];
    array->values[idx] = args[2];
    array->size++;
    *result = BOOL_VAL(true);
    return true;
}

static bool removeNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1])) {
        *result = OBJ_VAL(copyString("remove() expects an array and a number index.", 45));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    int idx = (int) AS_NUMBER(args[1]);

    if (idx < 0 || idx >= array->size) {
        *result = OBJ_VAL(copyString("remove() index out of bounds.", 29));
        return false;
    }

    *result = array->values[idx];
    for (int i = idx; i < array->size - 1; i++)
        array->values[i] = array->values[i + 1];
    array->size--;
    return true;
}

static bool sliceNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
        *result = OBJ_VAL(copyString("slice() expects an array and two number indices.", 48));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    int start = (int) AS_NUMBER(args[1]);
    int end   = (int) AS_NUMBER(args[2]);

    if (start < 0) start = 0;
    if (end > array->size) end = array->size;
    int len = end > start ? end - start : 0;

    // Root source array across the allocation of the new one.
    push(args[0]);
    ObjArray* slice = newArray(len);
    array = AS_ARRAY(args[0]);   // re-read after potential GC in newArray
    pop();

    for (int i = 0; i < len; i++)
        slice->values[i] = array->values[start + i];
    slice->size = len;

    *result = OBJ_VAL(slice);
    return true;
}

static bool concatNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_ARRAY(args[1])) {
        *result = OBJ_VAL(copyString("concat() expects two array arguments.", 37));
        return false;
    }
#endif

    // Root both arrays across any realloc that GROW_ARRAY may trigger.
    push(args[0]);
    push(args[1]);

    ObjArray* dst = AS_ARRAY(args[0]);
    ObjArray* src = AS_ARRAY(args[1]);
    int needed = dst->size + src->size;

    if (needed > dst->capacity) {
        int oldCap = dst->capacity;
        while (dst->capacity < needed) dst->capacity = GROW_CAPACITY(dst->capacity);
        dst->values = GROW_ARRAY(Value, dst->values, oldCap, dst->capacity);
    }

    src = AS_ARRAY(args[1]);   // re-read after potential realloc
    for (int i = 0; i < src->size; i++)
        dst->values[dst->size++] = src->values[i];

    pop(); pop();
    *result = BOOL_VAL(true);
    return true;
}

static bool reverseNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("reverse() expects one array argument.", 37));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    int lo = 0, hi = array->size - 1;
    while (lo < hi) {
        Value tmp = array->values[lo];
        array->values[lo++] = array->values[hi];
        array->values[hi--] = tmp;
    }
    *result = BOOL_VAL(true);
    return true;
}

static bool sortNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) ||
            !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("sort() expects an array and a comparator function.", 50));
        return false;
    }
#endif

#define swap(array, a, b) \
    do { \
        Value tmp = array->values[(a)]; \
        array->values[(a)] = array->values[(b)]; \
        array->values[(b)] = tmp; \
    } while (false)

    ObjArray* array = AS_ARRAY(args[0]);
    Value comp = args[1];
    int n = array->size;

#define CMP(ai, bi, out) \
    do { \
        push(comp); push(array->values[(ai)]); push(array->values[(bi)]); \
        if (!callBurrito(comp, 2, (out))) { \
            *result = OBJ_VAL(copyString("sort() comparator raised an error.", 34)); \
            return false; \
        } \
    } while (false)

    for (int i = 1; i < n; i++) {
        int j = i;
        while (j > 0) {
            int parent = (j - 1) / 2;
            Value cmpResult;
            CMP(parent, j, &cmpResult);  // comp(parent, j): true = parent < j
            if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) {
                swap(array, j, parent);
                j = parent;
            } else break;
        }
    }

    for (int i = n - 1; i > 0; i--) {
        swap(array, 0, i);   // move current max to sorted suffix
        int j = 0;
        while (true) {
            int left = 2 * j + 1;
            if (left >= i) break;   // no children in heap region
            int child = left;
            if (left + 1 < i) {    // pick the larger child
                Value cmpResult;
                CMP(left, left + 1, &cmpResult);
                if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) child = left + 1;
            }
            Value cmpResult;
            CMP(child, j, &cmpResult);  // comp(child, j): true = child < j (heap ok)
            if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) break;
            swap(array, j, child);
            j = child;
        }
    }

#undef CMP
#undef swap

    *result = BOOL_VAL(true);
    return true;
}

static bool containsNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("contains() expects an array and a value.", 40));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    for (int i = 0; i < array->size; i++) {
        if (valuesEqual(array->values[i], args[1])) {
            *result = BOOL_VAL(true);
            return true;
        }
    }
    *result = BOOL_VAL(false);
    return true;
}

static bool indexOfNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("indexOf() expects an array and a value.", 39));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    for (int i = 0; i < array->size; i++) {
        if (valuesEqual(array->values[i], args[1])) {
            *result = NUMBER_VAL((double) i);
            return true;
        }
    }
    *result = NUMBER_VAL(-1);
    return true;
}

static bool fillNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 4 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
        *result = OBJ_VAL(copyString("fill() expects an array, a start index, a length, and a value.", 62));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    int start  = (int) AS_NUMBER(args[1]);
    int length = (int) AS_NUMBER(args[2]);

    if (start < 0 || length < 0 || start + length > array->size) {
        *result = OBJ_VAL(copyString("fill() range out of bounds.", 27));
        return false;
    }

    for (int i = start; i < start + length; i++)
        array->values[i] = args[3];

    *result = BOOL_VAL(true);
    return true;
}

static bool copyNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("copy() expects one array argument.", 34));
        return false;
    }
#endif

    push(args[0]);
    ObjArray* src   = AS_ARRAY(args[0]);
    ObjArray* clone = newArray(src->size);
    src = AS_ARRAY(args[0]);   // re-read after potential GC in newArray
    pop();

    for (int i = 0; i < src->size; i++)
        clone->values[i] = src->values[i];
    clone->size = src->size;

    *result = OBJ_VAL(clone);
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

ObjModule* buildArrayModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "push",     4,  pushNative);
    addNative(module, "pop",      3,  popNative);
    addNative(module, "insert",   6,  insertNative);
    addNative(module, "remove",   6,  removeNative);
    addNative(module, "slice",    5,  sliceNative);
    addNative(module, "concat",   6,  concatNative);
    addNative(module, "reverse",  7,  reverseNative);
    addNative(module, "sort",     4,  sortNative);
    addNative(module, "contains", 8,  containsNative);
    addNative(module, "indexOf",  7,  indexOfNative);
    addNative(module, "fill",     4,  fillNative);
    addNative(module, "copy",     4,  copyNative);

    pop();
    return module;
}