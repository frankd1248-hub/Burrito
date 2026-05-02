#include <stdio.h>
#include <string.h>

#include "memory.h"
#include "object.h"
#include "table.h"
#include "value.h"
#include "vm.h"

#define ALLOCATE_OBJ(type, objectType) \
    (type*) allocateObject(sizeof(type), objectType)

static Obj* allocateObject(size_t size, ObjType type) {
    Obj* object = (Obj*) reallocate(NULL, 0, size);
    object->type = type;
    object->isMarked = false;
    object->next = vm.objects;
    vm.objects = object;

#ifdef DEBUG_LOG_GC
    printf("%p allocate %zu for %d\n", (void*) object, size, type);
#endif

    return object;
}

ObjArray* newArray(int size) {
    ObjArray* array = ALLOCATE_OBJ(ObjArray, OBJ_ARRAY);
    array->values = NULL;   // sentinel
    array->size = 0;
    array->values = ALLOCATE(Value, size);
    array->size = size;
    for (int i = 0; i < size; i++) {
        array->values[i] = NULL_VAL;
    }
    return array;
}

ObjBoundMethod* newBoundMethod(Value receiver, ObjClosure* method) {
    ObjBoundMethod* bound = ALLOCATE_OBJ(ObjBoundMethod, OBJ_BOUND_METHOD);
    bound->receiver = receiver;
    bound->method = method;
    return bound;
}

ObjClass* newClass(ObjString* name) {
    ObjClass* class_ = ALLOCATE_OBJ(ObjClass, OBJ_CLASS);
    class_->name = name;
    initTable(&class_->methods);
    return class_;
}

ObjClosure* newClosure(ObjFunction* function) {
    ObjClosure* closure = ALLOCATE_OBJ(ObjClosure, OBJ_CLOSURE);

    closure->function = function;
    closure->upvalueCount = function->upvalueCount;
    closure->upvalues = NULL;   // safe sentinel in case next alloc triggers GC

    ObjUpvalue** upvalues = ALLOCATE(ObjUpvalue*, function->upvalueCount);
    for (int i = 0; i < function->upvalueCount; i++) 
        upvalues[i] = NULL;
    closure->upvalues = upvalues;

    return closure;
}

ObjFunction* newFunction() {
    ObjFunction* function = ALLOCATE_OBJ(ObjFunction, OBJ_FUNCTION);
    function->arity = 0;
    function->upvalueCount = 0;
    function->name = NULL;
    initChunk(&function->chunk);
    return function;
}

ObjInstance* newInstance(ObjClass* class_) {
    ObjInstance* instance = ALLOCATE_OBJ(ObjInstance, OBJ_INSTANCE);
    instance->class_ = class_;
    initTable(&instance->fields);
    return instance;
}

ObjModule* newModule() {
    ObjModule* module = ALLOCATE_OBJ(ObjModule, OBJ_MODULE);
    initTable(&module->table);
    return module;
}

ObjNative* newNative(NativeFn function) {
    ObjNative* native = ALLOCATE_OBJ(ObjNative, OBJ_NATIVE);
    native->function = function;
    return native;
}

static ObjString* allocateString(char* chars, int length, uint32_t hash) {
    ObjString* string = ALLOCATE_OBJ(ObjString, OBJ_STRING);
    string->length = length;
    string->chars = chars;
    string->hash = hash;
    push(OBJ_VAL(string));
    tableSet(&vm.strings, string, NULL_VAL);
    pop();
    return string;
}

static uint32_t hashString(const char* key, int length) {
    uint32_t hash = 2166136261u;
    for (int i = 0; i < length; i++) {
        hash ^= (uint8_t) key[i];
        hash *= 16777619;
    }
    return hash;
}

ObjString* takeString(char* chars, int length) {
    uint32_t hash = hashString(chars, length);
    ObjString* interned = tableFindString(&vm.strings, chars, length, hash);

    if (interned != NULL) {
        FREE_ARRAY(char, chars, length + 1);
        return interned;
    }

    return allocateString(chars, length, hash);
}

ObjString* copyString(const char* chars, int length) {
    uint32_t hash = hashString(chars, length);
    ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
    if (interned != NULL) return interned;

    char* heapChars = ALLOCATE(char, length + 1);
    memcpy(heapChars, chars, length);
    heapChars[length] = '\0';
    return allocateString(heapChars, length, hash);
}

ObjUpvalue* newUpvalue(Value* slot) {
    ObjUpvalue* upvalue = ALLOCATE_OBJ(ObjUpvalue, OBJ_UPVALUE);
    upvalue->closed = NULL_VAL;
    upvalue->location = slot;
    upvalue->next = NULL;
    return upvalue;
}

static void printArray(ObjArray* array, FILE* f) {
    fprintf(f, "{ ");
    for (int i = 0; i < array->size - 1; i++) {
        printValue(array->values[i], f);
        fprintf(f, ", ");
    }
    printValue(array->values[array->size - 1], f);
    fprintf(f, " }");
}

static void printFunction(ObjFunction* function, FILE* f) {
    if (function->name == NULL) {
        if (f == NULL) printf("<script>");
        else fprintf(f, "<script>");
        return;
    }
    fprintf(f, "<fn %s>", function->name->chars);
}

static void printString(ObjString* string, FILE* f) {
    for (int i = 0; i < string->length; i++) {
        if (string->chars[i] == '\\') {
            if (i == string->length - 1) {
                fputc('\\', f);
                continue;
            }

            switch (string->chars[++i]) {
                case 'n':  fputc('\n', f); break;
                case 't':  fputc('\t', f); break;
                case '"':  fputc('"', f);  break;
                case '\\': fputc('\\', f); break;
            }
        } else {
            fputc(string->chars[i], f);
        }
    }
}

static char* ResourceTypeLookup[3];

void initLookup() {
    ResourceTypeLookup[0] = "Font";
    ResourceTypeLookup[1] = "Image";
    ResourceTypeLookup[2] = "Sound";
}

void printObject(Value value, FILE* f) {
    if (f == NULL) f = stdout;

    switch (OBJ_TYPE(value)) {
        case OBJ_ARRAY:
            printArray(AS_ARRAY(value), f);
            break;
        case OBJ_BOUND_METHOD:
            printFunction(AS_BOUND_METHOD(value)->method->function, f);
            break;
        case OBJ_CLASS:
            fprintf(f, "%s", AS_CLASS(value)->name->chars);
            break;
        case OBJ_CLOSURE:
            printFunction(AS_CLOSURE(value)->function, f);
            break;
        case OBJ_FUNCTION:
            printFunction(AS_FUNCTION(value), f);
            break;
        case OBJ_INSTANCE:
            fprintf(f, "%s instance", AS_INSTANCE(value)->class_->name->chars);
            break;
        case OBJ_MODULE:
            fprintf(f, "<native module>");
            break;
        case OBJ_NATIVE:
            fprintf(f, "<native fn>");
            break;
        case OBJ_RESOURCE:
            fprintf(f, "<resource %s>", ResourceTypeLookup[AS_RESOURCE(value)->type]);
            break;
        case OBJ_STRING:
            printString(AS_STRING(value), f);
            break;
        case OBJ_UPVALUE:
            fprintf(f, "upvalue");
            break;
    }
}