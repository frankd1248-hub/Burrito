#ifndef burrito_vm_h
#define burrito_vm_h

#include "object.h"
#include "table.h"
#include "value.h"

#define FRAMES_MAX 64

#define STACK_MAX (FRAMES_MAX * ARB_COUNT)

typedef struct {
    ObjClosure* closure;
    uint8_t* ip;
    Value* slots;
} CallFrame;

typedef struct {
    CallFrame frames[FRAMES_MAX];
    int frameCount;

    Value stack[STACK_MAX];
    Table globals;
    Table consts;
    Table strings;
    ObjUpvalue* openUpvalues;
    Value* stackTop;
    Obj* objects;
} VM;

typedef enum {
    INTERPRET_OK,
    INTERPRET_COMPILE_ERROR,
    INTERPRET_RUNTIME_ERROR,
} InterpretResult;

extern VM vm;

void defineNative(const char* name, ObjNative* native);
void defineModule(const char* name, ObjModule* module);

void initVM();
void freeVM();
InterpretResult interpret(const char* source);
void push(Value value);
Value pop();

#endif