#ifndef burrito_vm_h
#define burrito_vm_h

#include "object.h"
#include "table.h"
#include "value.h"

#define FRAMES_MAX 64

#define STACK_MAX (FRAMES_MAX * ARB_COUNT)

#define EVENT_QUEUE_MAX 128

typedef enum {
    EVENT_MOUSE_DOWN,
    EVENT_MOUSE_UP,
} EventType;

typedef struct {
    EventType type;
    int button;   // 0 = left, 1 = right, 2 = middle
    double x;
    double y;
} InputEvent;

typedef struct {
    InputEvent events[EVENT_QUEUE_MAX];
    int count;
} EventQueue;

extern EventQueue eventQueue;

typedef struct {
    ObjClosure* closure;
    uint8_t* ip;
    Value* slots;
} CallFrame;

typedef struct {
    int       frameCount;      // vm.frameCount at the OP_TRY point
    Value*    stackTop;        // vm.stackTop at the OP_TRY point
    uint8_t*  handlerIp;       // IP of the catch block
    CallFrame* frame;          // the frame that owns this try block
} ErrorHandler;

#define HANDLER_MAX 64

typedef struct {
    CallFrame frames[FRAMES_MAX];
    int frameCount;

    Value stack[STACK_MAX];
    Table globals;
    Table consts;
    Table strings;
    ObjString* initString;
    ObjUpvalue* openUpvalues;

    ErrorHandler handlerStack[HANDLER_MAX];
    int handlerCount;

    Table arrayMethods;
    Table mapMethods;

    Table importedFiles;

    size_t bytesAllocated;
    size_t nextGC;
    Value* stackTop;
    Obj* objects;
    int grayCount;
    int grayCapacity;
    Obj** grayStack;
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
void freeResources();
InterpretResult interpret(const char* source);

void push(Value value);
Value peek(int distance);
Value pop();

bool callBurrito(Value callee, int argCount, Value* result);

#endif