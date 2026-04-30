#include <stdio.h>
#include <string.h>
#include <math.h>

#include "object.h"
#include "memory.h"
#include "value.h"

void initValueArray(ValueArray* array) {
    array->values = NULL;
    array->capacity = 0;
    array->count = 0;
}

void writeValueArray(ValueArray* array, Value value) {
    if (array->capacity < array->count + 1) {
        int oldCapacity = array->capacity;
        array->capacity = GROW_CAPACITY(oldCapacity);
        array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
    }

    array->values[array->count] = value;
    array->count++;
}

void freeValueArray(ValueArray* array) {
    FREE_ARRAY(Value, array->values, array->capacity);
    initValueArray(array);
}

static void printNumber(Value value, FILE* f) {
    double val = AS_NUMBER(value);
    if (f == NULL) f = stdout;
    if (fabs(val - round(val)) < 0.00001) {
        fprintf(f, "%ld", (long) round(val));
    } else {
        fprintf(f, "%lf", val);
    }
    return;
}

void printValue(Value value, FILE* f) {
    if (f == NULL) f = stdout;
#ifdef NAN_BOXING
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
#else
    switch(value.type) {
        case VAL_BOOL:   fprintf(f, AS_BOOL(value) ? "true" : "false"); break;
        case VAL_EMPTY:  break;
        case VAL_NULL:   fprintf(f, "null"); break;
        case VAL_NUMBER: printNumber(value, f); break;
        case VAL_OBJ:    printObject(value, f); break;
    }
#endif
}

bool valuesEqual(Value a, Value b) {
#ifdef NAN_BOXING
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