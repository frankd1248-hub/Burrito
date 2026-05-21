#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "object.h"
#include "memory.h"
#include "value.h"
#include "vm.h"

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

typedef struct {
    char* data;
    int length;
    int capacity;
} StrBuf;

static void bufInit(StrBuf* buf) {
    buf->capacity = 64;
    buf->data = malloc(buf->capacity);
    buf->length = 0;
    buf->data[0] = '\0';
}

static void bufAppend(StrBuf* buf, const char* fmt, ...) {
    va_list args;
    while (true) {
        int remaining = buf->capacity - buf->length;
        va_start(args, fmt);
        int needed = vsnprintf(buf->data + buf->length, remaining, fmt, args);
        va_end(args);
        if (needed < remaining) {
            buf->length += needed;
            return;
        }
        // Not enough space — double until it fits.
        while (buf->capacity - buf->length <= needed)
            buf->capacity *= 2;
        buf->data = realloc(buf->data, buf->capacity);
    }
}

static void bufFree(StrBuf* buf) {
    free(buf->data);
}

Value toStringValue(Value arg) {
    if (IS_NULL(arg)) {
        return OBJ_VAL(copyString("null", 4));
    } else if (IS_BOOL(arg)) {
        return AS_BOOL(arg)
            ? OBJ_VAL(copyString("true", 4))
            : OBJ_VAL(copyString("false", 5));
    } else if (IS_NUMBER(arg)) {
        char str[256];
        int length = snprintf(str, sizeof(str), "%g", AS_NUMBER(arg));
        return OBJ_VAL(copyString(str, length));
    } else if (IS_OBJ(arg)) {
        switch (AS_OBJ(arg)->type) {
            case OBJ_ARRAY: {
                ObjArray* array = AS_ARRAY(arg);
                if (array->size == 0)
                    return OBJ_VAL(copyString("{ }", 3));

                push(arg);
                StrBuf buf;
                bufInit(&buf);
                bufAppend(&buf, "{ ");

                for (int i = 0; i < AS_ARRAY(peek(0))->size; i++) {
                    Value elem = toStringValue(AS_ARRAY(peek(0))->values[i]);
                    bufAppend(&buf, "%s", AS_CSTRING(elem));
                    if (i < AS_ARRAY(peek(0))->size - 1)
                        bufAppend(&buf, ", ");
                }

                bufAppend(&buf, " }");
                pop();

                Value res = OBJ_VAL(copyString(buf.data, buf.length));
                bufFree(&buf);
                return res;
            }
            case OBJ_CLASS: {
                ObjClass* class_ = AS_CLASS(arg);
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Class %s>",
                                   class_->name->chars);
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_CLOSURE: {
                ObjString* name = AS_CLOSURE(arg)->function->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Closure %s>",
                                   name ? name->chars : "?");
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_FUNCTION: {
                ObjString* name = AS_FUNCTION(arg)->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Function %s>",
                                   name ? name->chars : "?");
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_INSTANCE: {
                ObjString* name = AS_INSTANCE(arg)->class_->name;
                char buf[256];
                int len = snprintf(buf, sizeof(buf), "<Instance of %s>",
                                   name->chars);
                return OBJ_VAL(copyString(buf, len));
            }
            case OBJ_MAP: {
                ObjMap* map = AS_MAP(arg);
                if (map->table.count == 0)
                    return OBJ_VAL(copyString("{ }", 3));

                push(arg);
                StrBuf buf;
                bufInit(&buf);
                bufAppend(&buf, "{ ");

                bool first = true;
                int cap = AS_MAP(peek(0))->table.capacity;
                for (int i = 0; i < cap; i++) {
                    Entry* e = &AS_MAP(peek(0))->table.entries[i];
                    if (e->key == NULL) continue;
                    if (!first) bufAppend(&buf, ", ");
                    bufAppend(&buf, "\"%s\": ", e->key->chars);
                    Value v = toStringValue(e->value);
                    bufAppend(&buf, "%s", AS_CSTRING(v));
                    first = false;
                }

                bufAppend(&buf, " }");
                pop();

                Value res = OBJ_VAL(copyString(buf.data, buf.length));
                bufFree(&buf);
                return res;
            }
            case OBJ_MODULE: return OBJ_VAL(copyString("<Module>", 8));
            case OBJ_NATIVE: return OBJ_VAL(copyString("<Native>", 8));
            case OBJ_RESOURCE: return OBJ_VAL(copyString("<Resource>", 10));
            case OBJ_STRING: return arg;
            case OBJ_UPVALUE: return OBJ_VAL(copyString("<Upvalue>", 9));
        }
    }
    return OBJ_VAL(copyString("<unknown>", 9));
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