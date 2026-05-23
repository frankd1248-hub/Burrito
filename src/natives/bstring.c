#include <stdlib.h>
#include <string.h>

#include "bstring.h"
#include "../memory.h"
#include "../vm.h"

static bool sStartsWithNative(int, Value*, Value*);
static bool sEndsWithNative(int, Value*, Value*);
static bool sContainsNative(int, Value*, Value*);
static bool sReplaceNative(int, Value*, Value*);
static bool sReplaceAllNative(int, Value*, Value*);
static bool sRepeatNative(int, Value*, Value*);

static bool sLengthNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("len() takes one string argument", 31));
        return false;
    }
#endif

    *result = NUMBER_VAL(AS_STRING(args[0])->length);
    return true;
}

static bool sSubstrNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
        *result = OBJ_VAL(copyString("substr() takes one string and two number arguments.", 51));
        return false;
    }
#endif

    int beginIndex = (int) AS_NUMBER(args[1]);
    int endIndex = (int) AS_NUMBER(args[2]);
    int length = endIndex - beginIndex;
    char* string = AS_CSTRING(args[0]);

    if (beginIndex < 0 || endIndex > AS_STRING(args[0])->length || beginIndex > endIndex) {
        *result = OBJ_VAL(copyString("Invalid string index(ces) in substr()", 37));
        return false;
    }

    char* res = malloc(sizeof(char) * (endIndex - beginIndex + 1));
    strncpy(res, string + beginIndex, length);
    res[length] = '\0';

    *result = OBJ_VAL(copyString(res, length));

    free(res);

    return true;
}

static bool sFindNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("find() expects two string arguments.", 36));
        return false;
    }
#endif

    char* haystack = AS_CSTRING(args[0]);
    char* needle = AS_CSTRING(args[1]);

    char* found = strstr(haystack, needle);

    if (found == NULL) {
        *result = NUMBER_VAL(-1);
        return true;
    }

    *result = NUMBER_VAL(found - haystack);
    return true;
}

static bool sSplitNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("split() expects two string arguments", 36));
        return false;
    }
#endif

    char* haystack = AS_CSTRING(args[0]);
    char* needle   = AS_CSTRING(args[1]);
    int   needleLen = strlen(needle);
    char* end      = haystack + strlen(haystack);

    if (needleLen == 0) {
        *result = OBJ_VAL(copyString("Cannot split by empty string in split().", 40));
        return false;
    }

    int capacity = 8;
    int count    = 0;
    char**  array   = ALLOCATE(char*, capacity);
    int*    lengths = ALLOCATE(int,   capacity);

    while (true) {
        char* found = strstr(haystack, needle);
        if (found == NULL) break;

        int idx = found - haystack;

        if (count + 1 >= capacity) {
            int newCapacity = GROW_CAPACITY(capacity);
            array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
            lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
            capacity = newCapacity;
        }

        char* sub = ALLOCATE(char, idx + 1);
        memcpy(sub, haystack, idx);
        sub[idx] = '\0';
        array[count]   = sub;
        lengths[count] = idx;
        count++;

        haystack = found + needleLen;
    }

    int remaining = end - haystack;
    if (count + 1 >= capacity) {
        int newCapacity = GROW_CAPACITY(capacity);
        array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
        lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
        capacity = newCapacity;
    }
    char* sub = ALLOCATE(char, remaining + 1);
    memcpy(sub, haystack, remaining);
    sub[remaining] = '\0';
    array[count]   = sub;
    lengths[count] = remaining;
    count++;

    ObjArray* arr = newArray(count);
    push(OBJ_VAL(arr));
    for (int i = 0; i < count; i++) {
        arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
        FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
    }
    arr->size = count;

    *result = peek(0);
    pop();

    FREE_ARRAY(char*,  array,   capacity);
    FREE_ARRAY(int,    lengths, capacity);

    return true;
}

static bool sJoinNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("join() expects an array and a string arguments.", 47));
        return false;
    }
#endif

    ObjArray* array = AS_ARRAY(args[0]);
    ObjString* delim = AS_STRING(args[1]);

    int length = delim->length * (array->size > 0 ? array->size - 1 : 0);
    for (int i = 0; i < array->size; i++)
        length += AS_STRING(array->values[i])->length;


    char* res = calloc(length + 1, sizeof(char));
    if (res == NULL) {
        *result = OBJ_VAL(copyString("join() ran out of memory.", 25));
        return false;
    }

    for (int i = 0; i < array->size; i++) {
        strcat(res, AS_CSTRING(array->values[i]));
        if (i < array->size - 1) strcat(res, delim->chars);
    }

    *result = OBJ_VAL(copyString(res, length));
    free(res);
    return true;
}

static bool sTrimNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("trim() expects one string argument.", 35));
        return false;
    }
#endif

    int length = AS_STRING(args[0])->length;
    char* string = AS_CSTRING(args[0]);

    int start = 0, end = length;

    bool foundStart = false;
    for (int i = 0; i < length; i++) {
        if (string[i] == ' ' || string[i] == '\n' ||
            string[i] == '\t' || string[i] == '\r') continue;
        start = i; foundStart = true; break;
    }
    if (!foundStart) { *result = OBJ_VAL(copyString("", 0)); return true; }

    for (int i = length - 1; i >= start; i--) {
        if (string[i] == ' ' || string[i] == '\n' ||
            string[i] == '\t' || string[i] == '\r') continue;
        end = i + 1; break;
    }

    int len = end - start;
    char* res = malloc(sizeof(char) * len);
    if (res == NULL) {
        *result = OBJ_VAL(copyString("trim() ran out of memory.", 25));
        return false;
    }

    strncpy(res, string + start, len);
    *result = OBJ_VAL(copyString(res, len));
    free(res);
    return true;
}

static bool sUpperNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("upper() takes one string argument.", 34));
        return false;
    }
#endif

    ObjString* string = AS_STRING(args[0]);
    char* res = malloc(sizeof(char) * (string->length + 1));

    for (int i = 0; i < string->length; i++) {
        char c = string->chars[i];
        if (c >= 'a' && c <= 'z') {
            res[i] = c - 32;
        } else res[i] = c;
    }
    res[string->length] = '\0';

    *result = OBJ_VAL(copyString(res, string->length));
    free(res);
    return true;
}

static bool sLowerNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("lower() takes one string argument.", 34));
        return false;
    }
#endif

    ObjString* string = AS_STRING(args[0]);
    char* res = malloc(sizeof(char) * (string->length + 1));

    for (int i = 0; i < string->length; i++) {
        char c = string->chars[i];
        if (c >= 'A' && c <= 'Z') {
            res[i] = c + 32;
        } else res[i] = c;
    }
    res[string->length] = '\0';

    *result = OBJ_VAL(copyString(res, string->length));
    free(res);
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

ObjModule* buildStringModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "len", 3, sLengthNative);
    addNative(module, "substr", 6, sSubstrNative);
    addNative(module, "find", 4, sFindNative);
    addNative(module, "split", 5, sSplitNative);
    addNative(module, "join", 4, sJoinNative);
    addNative(module, "trim", 4, sTrimNative);
    addNative(module, "upper", 5, sUpperNative);
    addNative(module, "lower", 5, sLowerNative);

    pop();
    return module;
}