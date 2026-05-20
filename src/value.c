#include <stdio.h>
#include <string.h>
#include <math.h>

#include "object.h"
#include "memory.h"
#include "value.h"

/**
 * Initializes a dynamic array.
 */
void initValueArray(ValueArray* array) {
    array->values = NULL;
    array->capacity = 0;
    array->count = 0;
}

/**
 * Appends one value to a dynamic array.
 */
void writeValueArray(ValueArray* array, Value value) {
    if (array->capacity < array->count + 1) {
        int oldCapacity = array->capacity;
        array->capacity = GROW_CAPACITY(oldCapacity);
        array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
    }

    array->values[array->count] = value;
    array->count++;
}

/**
 * Frees a dynamic array.
 */
void freeValueArray(ValueArray* array) {
    FREE_ARRAY(Value, array->values, array->capacity);
    initValueArray(array);
}

/**
 * Prints a number to the given file stream.
 */
static void printNumber(Value value, FILE* f) {
    double val = AS_NUMBER(value);
    if (f == NULL) f = stdout;

    // Round when value is very close to a whole number
    if (fabs(val - round(val)) < 0.0000001) {
        fprintf(f, "%ld", (long) round(val));
    } else {
        fprintf(f, "%lf", val);
    }
    return;
}

/**
 * One big if-else if block delegating to different functions
 * Prints one value to the given file stream.
 */
void printValue(Value value, FILE* f) {
    if (f == NULL) f = stdout;

    if (IS_BOOL(value)) {
        fprintf(f, AS_BOOL(value) ? "true" : "false");
    } else if (IS_EMPTY(value)) {
    } else if (IS_NULL(value)) {
        fprintf(f, "null");
    } else if (IS_NUMBER(value)) {
        printNumber(value, f);
    } else if (IS_OBJ(value)) {
        printObject(value, f);
    }
}

/**
 * Returns if the values are equal
 */
bool valuesEqual(Value a, Value b) {
#ifdef NAN_BOXING
    // NAN-boxed values can only be equal if every bit is equal.
    return a == b;
#else
    if (a.type != b.type) return false;
    switch (a.type) {
        case VAL_BOOL:   return AS_BOOL(a) == AS_BOOL(b);
        case VAL_NULL:   return true;
        case VAL_NUMBER: return AS_NUMBER(a) == AS_NUMBER(b);
        case VAL_OBJ:    return AS_OBJ(a) == AS_OBJ(b);
        default:         return false;
    }
#endif
}