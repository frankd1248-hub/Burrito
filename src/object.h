#ifndef burrito_object_h
#define burrito_object_h

#include <stdio.h>

#include "common.h"
#include "chunk.h"
#include "table.h"
#include "value.h"

#define OBJ_TYPE(value)      (AS_OBJ(value)->type)

#define IS_ARRAY(value)      isObjType(value, OBJ_ARRAY)
#define IS_CLOSURE(value)    isObjType(value, OBJ_CLOSURE)
#define IS_FUNCTION(value)   isObjType(value, OBJ_FUNCTION)
#define IS_MODULE(value)     isObjType(value, OBJ_MODULE)
#define IS_NATIVE(value)     isObjType(value, OBJ_NATIVE)
#define IS_STRING(value)     isObjType(value, OBJ_STRING)

#define AS_ARRAY(value)      ((ObjArray*) AS_OBJ(value))
#define AS_CLOSURE(value)    ((ObjClosure*) AS_OBJ(value))
#define AS_FUNCTION(value)   ((ObjFunction*) AS_OBJ(value))
#define AS_MODULE(value)     ((ObjModule*) AS_OBJ(value))
#define AS_NATIVE(value)     (((ObjNative*) AS_OBJ(value))->function)
#define AS_STRING(value)     ((ObjString*) AS_OBJ(value))
#define AS_CSTRING(value)    (((ObjString*) AS_OBJ(value))->chars)

typedef enum { 
    OBJ_ARRAY,
    OBJ_CLOSURE,
    OBJ_FUNCTION,
    OBJ_MODULE,
    OBJ_NATIVE,
    OBJ_STRING,
    OBJ_UPVALUE
} ObjType;

struct Obj {
    ObjType type;
    bool isMarked;
    struct Obj* next;
};

typedef struct {
    Obj obj;
    int size;
    Value* values;
} ObjArray;

typedef struct {
    Obj obj;
    int arity;
    int upvalueCount;
    Chunk chunk;
    ObjString* name;
} ObjFunction;

typedef struct {
    Obj obj;
    Table table;
} ObjModule;

typedef bool (*NativeFn) (int argCount, Value* args, Value* result);

typedef struct {
    Obj obj;
    NativeFn function;
} ObjNative;

struct ObjString {
    Obj obj;
    int length;
    char* chars;
    uint32_t hash;
};

typedef struct ObjUpvalue {
    Obj obj;
    Value* location;
    Value closed;
    struct ObjUpvalue* next;
} ObjUpvalue;

typedef struct {
    Obj obj;
    ObjFunction* function;
    ObjUpvalue** upvalues;
    int upvalueCount;
} ObjClosure;

ObjArray* newArray(int size);
ObjClosure* newClosure(ObjFunction* function);
ObjFunction* newFunction();
ObjModule* newModule();
ObjNative* newNative(NativeFn function);
ObjString* takeString(char* chars, int length);
ObjString* copyString(const char* chars, int length);
ObjUpvalue* newUpvalue(Value* slot);
void printObject(Value value, FILE* f);

static inline bool isObjType(Value value, ObjType type) {
    return IS_OBJ(value) && AS_OBJ(value)->type == type;
}

#endif