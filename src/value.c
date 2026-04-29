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
    if (f == NULL) {
        if (fabs(val - round(val)) < 0.00001) {
            printf("%ld", (long) round(val));
        } else {
            printf("%lf", val);
        }
    } else {
        if (fabs(val - round(val)) < 0.00001) {
            fprintf(f, "%ld", (long) round(val));
        } else {
            fprintf(f, "%lf", val);
        }
    }

    return;
}

void printValue(Value value, FILE* f) {
    if (f == NULL) {
        switch(value.type) {
            case VAL_BOOL:   printf(AS_BOOL(value) ? "true" : "false"); break;
            case VAL_NULL:   printf("null"); break;
            case VAL_NUMBER: printNumber(value, f); break;
            case VAL_OBJ:    printObject(value, f); break;
            case VAL_EMPTY:  break;
        }
    } else {
        switch(value.type) {
            case VAL_BOOL:   fprintf(f, AS_BOOL(value) ? "true" : "false"); break;
            case VAL_NULL:   fprintf(f, "null"); break;
            case VAL_NUMBER: printNumber(value, f); break;
            case VAL_OBJ:    printObject(value, f); break;
            case VAL_EMPTY:  break;
        }
    }
}

bool valuesEqual(Value a, Value b) {
    if (a.type != b.type) return false;
    switch (a.type) {
        case VAL_BOOL:   return AS_BOOL(a) == AS_BOOL(b);
        case VAL_NULL:   return true;
        case VAL_NUMBER: return AS_NUMBER(a) == AS_NUMBER(b);
        case VAL_OBJ:    return AS_OBJ(a) == AS_OBJ(b);
        default:         return false;
    }
}