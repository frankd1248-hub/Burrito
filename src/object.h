#ifndef burrito_object_h
#define burrito_object_h

#include <stdio.h>

#include "common.h"
#include "chunk.h"
#include "table.h"
#include "value.h"

#define OBJ_TYPE(value)      (AS_OBJ(value)->type)

#define IS_ARRAY(value)        isObjType(value, OBJ_ARRAY)
#define IS_BOUND_METHOD(value) isObjType(value, OBJ_BOUND_METHOD)
#define IS_BOUND_NATIVE(value) isObjType(value, OBJ_BOUND_NATIVE)
#define IS_CLASS(value)        isObjType(value, OBJ_CLASS)
#define IS_CLOSURE(value)      isObjType(value, OBJ_CLOSURE)
#define IS_FUNCTION(value)     isObjType(value, OBJ_FUNCTION)
#define IS_INSTANCE(value)     isObjType(value, OBJ_INSTANCE)
#define IS_MAP(value)          isObjType(value, OBJ_MAP)
#define IS_MODULE(value)       isObjType(value, OBJ_MODULE)
#define IS_NATIVE(value)       isObjType(value, OBJ_NATIVE)
#define IS_RESOURCE(value)     isObjType(value, OBJ_RESOURCE)
#define IS_STRING(value)       isObjType(value, OBJ_STRING)

#define AS_ARRAY(value)        ((ObjArray*) AS_OBJ(value))
#define AS_BOUND_METHOD(value) ((ObjBoundMethod*) AS_OBJ(value))
#define AS_BOUND_NATIVE(value) ((ObjBoundNative*) AS_OBJ(value))
#define AS_CLASS(value)        ((ObjClass*) AS_OBJ(value))
#define AS_CLOSURE(value)      ((ObjClosure*) AS_OBJ(value))
#define AS_FUNCTION(value)     ((ObjFunction*) AS_OBJ(value))
#define AS_INSTANCE(value)     ((ObjInstance*) AS_OBJ(value))
#define AS_MAP(value)          ((ObjMap*) AS_OBJ(value))
#define AS_MODULE(value)       ((ObjModule*) AS_OBJ(value))
#define AS_NATIVE(value)       (((ObjNative*) AS_OBJ(value))->function)
#define AS_NATIVE_OBJ(value)   ((ObjNative*) AS_OBJ(value))
#define AS_STRING(value)       ((ObjString*) AS_OBJ(value))
#define AS_RESOURCE(value)     ((ObjResource*) AS_OBJ(value))
#define AS_CSTRING(value)      (((ObjString*) AS_OBJ(value))->chars)

#define IS_FONT(value)       isResType(value, RESOURCE_FONT)
#define IS_IMAGE(value)      isResType(value, RESOURCE_IMAGE)
#define IS_SOUND(value)      isResType(value, RESOURCE_SOUND)

typedef enum { 
    OBJ_ARRAY,
    OBJ_BOUND_METHOD,
    OBJ_BOUND_NATIVE,
    OBJ_CLASS,
    OBJ_CLOSURE,
    OBJ_FUNCTION,
    OBJ_INSTANCE,
    OBJ_MAP,
    OBJ_MODULE,
    OBJ_NATIVE,
    OBJ_RESOURCE,
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
    int capacity;
    Value* values;
} ObjArray;

typedef struct {
    Obj obj;
    ObjString* name;
    Table methods;
} ObjClass;

typedef struct {
    Obj obj;
    ObjClass* class_;
    Table fields;
} ObjInstance;

typedef struct {
    Obj obj;
    int arity;
    int upvalueCount;
    Chunk chunk;
    ObjString* name;
} ObjFunction;

typedef struct {
    Obj obj;
    Table table;    // string keys → any Value
} ObjMap;

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

typedef struct {
    Obj obj;
    Value receiver;
    ObjClosure* method;
} ObjBoundMethod;

typedef struct {
    Obj obj;
    Table table;
} ObjModule;

typedef bool (*NativeFn) (int argCount, Value* args, Value* result);

typedef struct {
    Obj obj;
    NativeFn function;
} ObjNative;

typedef struct {
    Obj obj;
    Value receiver;
    ObjNative* method;
} ObjBoundNative;

typedef enum {
    RESOURCE_FONT,
    RESOURCE_IMAGE,
    RESOURCE_SOUND,
} ResourceType;

typedef void (DestroyFn) (void*);

typedef struct {
    Obj obj;
    ResourceType type;
    void* handle;
    DestroyFn* destroy;
} ObjResource;

struct ObjString {
    Obj obj;
    int length;
    char* chars;
    uint32_t hash;
};

ObjArray* newArray(int size);
ObjBoundMethod* newBoundMethod(Value receiver, ObjClosure* method);
ObjBoundNative* newBoundNative(Value receiver, ObjNative* method);
ObjClass* newClass(ObjString* name);
ObjClosure* newClosure(ObjFunction* function);
ObjFunction* newFunction();
ObjInstance* newInstance(ObjClass* class_);
ObjMap* newMap();
ObjModule* newModule();
ObjNative* newNative(NativeFn function);
ObjResource* newResource(ResourceType type, void* resource, DestroyFn destroy);
ObjString* takeString(char* chars, int length);
ObjString* copyString(const char* chars, int length);
ObjUpvalue* newUpvalue(Value* slot);
void printObject(Value value, FILE* f);
void initLookup();

static inline bool isObjType(Value value, ObjType type) {
    return IS_OBJ(value) && AS_OBJ(value)->type == type;
}

static inline bool isResType(Value value, ResourceType type) {
    return IS_OBJ(value) && IS_RESOURCE(value) && AS_RESOURCE(value)->type == type;
}

#endif