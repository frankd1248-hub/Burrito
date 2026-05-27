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
    
    dst = AS_ARRAY(args[0]);
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
 
#define swap(a, b) \
    do { \
        Value tmp = array->values[(a)]; \
        array->values[(a)] = array->values[(b)]; \
        array->values[(b)] = tmp; \
    } while (false)
 
#define CMP(ai, bi, out) \
    do { \
        push(comp); \
        push(array->values[(ai)]); \
        push(array->values[(bi)]); \
        if (!callBurrito(comp, 2, (out))) { \
            *result = OBJ_VAL(copyString("sort() comparator raised an error.", 34)); \
            return false; \
        } \
        array = AS_ARRAY(args[0]); \
    } while (false)
 
    ObjArray* array = AS_ARRAY(args[0]);
    Value comp = args[1];
    int n = array->size;
 
    // Build max-heap: sift each element up to its correct position.
    for (int i = 1; i < n; i++) {
        int j = i;
        while (j > 0) {
            int parent = (j - 1) / 2;
            Value cmpResult;
            CMP(parent, j, &cmpResult);  // true = parent < j → j larger → swap up
            if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) {
                swap(j, parent);
                j = parent;
            } else break;
        }
    }
 
    // Extract max element one by one into the sorted suffix.
    for (int i = n - 1; i > 0; i--) {
        swap(0, i);
        int j = 0;
        while (true) {
            int left = 2 * j + 1;
            if (left >= i) break;
            int child = left;
            if (left + 1 < i) {
                Value cmpResult;
                CMP(left, left + 1, &cmpResult);  // true = left < right → pick right
                if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) child = left + 1;
            }
            Value cmpResult;
            CMP(child, j, &cmpResult);  // true = child < parent → heap ok, stop
            if (IS_BOOL(cmpResult) && AS_BOOL(cmpResult)) break;
            swap(j, child);
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

static bool mapNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("map() takes one array and one function argument.", 48));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    Value fun = args[1];
    int n = array->size;

    push(args[0]);
    ObjArray* mapped = newArray(n);
    array = AS_ARRAY(args[0]);
    pop();

    push(OBJ_VAL(mapped));
    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(array->values[i]);
        array = AS_ARRAY(args[0]);
        if (!callBurrito(fun, 1, &res)) {
            *result = OBJ_VAL(copyString("map() function raised an error.", 31));
            return false;
        }

        mapped->values[i] = res;
    }
    mapped->size = n;
    pop();

    *result = OBJ_VAL(mapped);
    return true;
}

static bool filterNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("filter() takes one array and one function argument.", 51));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    Value fun = args[1];
    int n = array->size;

    push(args[0]);
    ObjArray* filtered = newArray(n);  // worst case: all elements pass
    array = AS_ARRAY(args[0]);         // re-read after potential GC in newArray
    pop();

    push(OBJ_VAL(filtered));           // root filtered across callBurrito calls

    int count = 0;
    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(AS_ARRAY(args[0])->values[i]);
        if (!callBurrito(fun, 1, &res)) {
            *result = OBJ_VAL(copyString("filter() function raised an error.", 34));
            pop();  // filtered
            return false;
        }

        if (IS_BOOL(res) && AS_BOOL(res)) {
            AS_ARRAY(peek(0))->values[count++] = AS_ARRAY(args[0])->values[i];
        }
    }

    AS_ARRAY(peek(0))->size = count;
    *result = peek(0);
    pop();  // filtered
    return true;
}

static bool reduceNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("reduce() takes an array, a function, and an initial value.", 58));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    Value fun = args[1];
    int n = array->size;

    push(args[2]);  // root the accumulator on the stack

    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(peek(1));                          // accumulator
        push(AS_ARRAY(args[0])->values[i]);     // current element
        if (!callBurrito(fun, 2, &res)) {
            *result = OBJ_VAL(copyString("reduce() function raised an error.", 34));
            pop();  // accumulator
            return false;
        }

        pop();
        push(res);
    }

    *result = pop();  // return final accumulator
    return true;
}

static bool forEachNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("forEach() takes one array and one function argument.", 52));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    Value fun = args[1];
    int n = array->size;

    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(AS_ARRAY(args[0])->values[i]);
        if (!callBurrito(fun, 1, &res)) {
            *result = OBJ_VAL(copyString("forEach() function raised an error.", 35));
            return false;
        }
    }

    *result = NULL_VAL;
    return true;
}

/**
 * Returns if every element makes the given function return true
 */
static bool everyNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("every() takes one array and one function argument.", 50));
        return false;
    }
#endif

    Value fun = args[1];
    int n = AS_ARRAY(args[0])->size;

    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(AS_ARRAY(args[0])->values[i]);
        if (!callBurrito(fun, 1, &res)) {
            *result = OBJ_VAL(copyString("every() function raised an error.", 33));
            return false;
        }

        if (!IS_BOOL(res) || !AS_BOOL(res)) {
            *result = BOOL_VAL(false);
            return true;
        }
    }

    *result = BOOL_VAL(true);
    return true;
}

/**
 * Returns if one or more element makes the given function return true
 */
static bool someNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("some() takes one array and one function argument.", 49));
        return false;
    }
#endif

    Value fun = args[1];
    int n = AS_ARRAY(args[0])->size;

    for (int i = 0; i < n; i++) {
        Value res;
        push(fun);
        push(AS_ARRAY(args[0])->values[i]);
        if (!callBurrito(fun, 1, &res)) {
            *result = OBJ_VAL(copyString("some() function raised an error.", 32));
            return false;
        }

        if (IS_BOOL(res) && AS_BOOL(res)) {
            *result = BOOL_VAL(true);
            return true;
        }
    }

    *result = BOOL_VAL(false);
    return true;
}

// Recursive helper for flattenNative. Walks `src` and appends all non-array
// values into `dst`, descending into nested arrays along the way.
// Both `src` and `dst` must already be rooted on the GC stack by the caller.
static void flattenInto(ObjArray* src) {
    for (int i = 0; i < src->size; i++) {
        Value v = src->values[i];
        if (IS_ARRAY(v)) {
            push(v);  // root the nested array while we recurse
            flattenInto(AS_ARRAY(v));
            pop();
        } else {
            ObjArray* dst = AS_ARRAY(peek(0));  // re-read: prior calls may have triggered GROW_ARRAY
            ensureCapacity(dst);
            dst = AS_ARRAY(peek(0));            // re-read after potential realloc in ensureCapacity
            dst->values[dst->size++] = v;
        }
    }
}

/**
 * Recursively flatten nested arrays
 */
static bool flattenNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_ARRAY(args[0])) {
        *result = OBJ_VAL(copyString("flatten() expects one array argument.", 37));
        return false;
    }
#endif

    push(args[0]);           // root source
    ObjArray* dst = newArray(0);
    push(OBJ_VAL(dst));      // root destination (peek(0) from here on)

    flattenInto(AS_ARRAY(args[0]));

    *result = peek(0);
    pop(); pop();
    return true;
}

/**
 * Returns sorted copy
 */
static bool sortedNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) ||
            !(IS_CLOSURE(args[1]) || IS_NATIVE(args[1]))) {
        *result = OBJ_VAL(copyString("sorted() expects an array and a comparator function.", 52));
        return false;
    }
#endif

    // Make a shallow copy, then delegate to the existing in-place sort.
    push(args[0]);
    ObjArray* src   = AS_ARRAY(args[0]);
    ObjArray* clone = newArray(src->size);
    src = AS_ARRAY(args[0]);   // re-read after potential GC in newArray
    pop();

    for (int i = 0; i < src->size; i++)
        clone->values[i] = src->values[i];
    clone->size = src->size;

    // Build a two-element args array that sortNative expects: [array, comparator].
    Value sortArgs[2] = { OBJ_VAL(clone), args[1] };
    Value sortResult;

    push(OBJ_VAL(clone));   // root clone across sortNative's callBurrito calls
    bool ok = sortNative(2, sortArgs, &sortResult);
    pop();

    if (!ok) {
        *result = sortResult;
        return false;
    }

    *result = OBJ_VAL(clone);
    return true;
}

static void addMethod(const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&vm.arrayMethods, copyString(name, length), peek(0));
    pop();
}

void buildArrayMethods() {
    addMethod("push",     4,  pushNative);
    addMethod("pop",      3,  popNative);
    addMethod("insert",   6,  insertNative);
    addMethod("remove",   6,  removeNative);
    addMethod("slice",    5,  sliceNative);
    addMethod("concat",   6,  concatNative);
    addMethod("reverse",  7,  reverseNative);
    addMethod("sort",     4,  sortNative);
    addMethod("contains", 8,  containsNative);
    addMethod("indexOf",  7,  indexOfNative);
    addMethod("fill",     4,  fillNative);
    addMethod("copy",     4,  copyNative);
    addMethod("map",      3,  mapNative);
    addMethod("filter",   6,  filterNative);
    addMethod("reduce",   6,  reduceNative);
    addMethod("forEach",  7,  forEachNative);
    addMethod("every",    5,  everyNative);
    addMethod("some",     4,  someNative);
    addMethod("flatten",  7,  flattenNative);
    addMethod("sorted",   6,  sortedNative);
}