#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "common.h"
#include "compiler.h"
#include "debug.h"
#include "object.h"
#include "memory.h"
#include "vm.h"

#include "./natives/natives.h"

VM vm;

EventQueue eventQueue = {0};

static void resetStack() {
    vm.stackTop = vm.stack;
    vm.frameCount = 0;
    vm.openUpvalues = NULL;
    vm.handlerCount = 0;
}

static bool errorWasHandled = false;

static void closeUpvalues(Value*);

static void runtimeError(const char* format, ...) {
    errorWasHandled = false;
    char* errorString = malloc(sizeof(char) * 4096);
    int length = 0;

    va_list args;
    va_start(args, format);
    length += vsnprintf(errorString, 4095, format, args);
    va_end(args);
    if (length >= 4095) length = 4094;
    errorString[length++] = '\n';
    errorString[length]   = '\0';

    if (vm.handlerCount > 0) {
        ErrorHandler* handler = &vm.handlerStack[--vm.handlerCount];

        // Unwind: restore frame count, stack, and IP
        vm.frameCount = handler->frameCount;
        vm.stackTop   = handler->stackTop;

        // Close any open upvalues that are being unwound
        closeUpvalues(vm.stackTop);

        // Push the error string so the catch block can use it
        push(OBJ_VAL(copyString(errorString, length)));

        // Jump into the catch block
        handler->frame->ip = handler->handlerIp;
        free(errorString);
        errorWasHandled = true;
        return;
    }

    fprintf(stderr, "%s\n", errorString);
    for (int i = vm.frameCount - 1; i >= 0; i--) {
        CallFrame* frame = &vm.frames[i];
        ObjFunction* function = frame->closure->function;
        size_t instruction = frame->ip - function->chunk.code - 1;
        fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
        if (function->name == NULL) {
            fprintf(stderr, "script\n");
        } else {
            fprintf(stderr, "%s()\n", function->name->chars);
        }
    }

    free(errorString);
    resetStack();
    return;
}

void defineNative(const char* name, ObjNative* native) {
    push(OBJ_VAL(copyString(name, strlen(name))));
    push(OBJ_VAL(native));
    tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
    tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
    pop();
    pop();
}

void defineModule(const char* name, ObjModule* module) {
    push(OBJ_VAL(copyString(name, strlen(name))));
    push(OBJ_VAL(module));
    tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
    tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
    pop();
    pop();
}

void initVM() {
    resetStack();
    vm.objects = NULL;
    vm.bytesAllocated = 0;
    vm.nextGC = 1024 * 1024 * 4; // 4 MiB

    vm.handlerCount = 0;

    vm.grayCount = 0;
    vm.grayCapacity = 0;
    vm.grayStack = NULL;

    initTable(&vm.globals);
    initTable(&vm.consts);
    initTable(&vm.strings);

    vm.initString = NULL;
    vm.initString = copyString("init", 4);

    defineAllNatives();
}

void freeVM() {
    freeTable(&vm.globals);
    freeTable(&vm.consts);
    freeTable(&vm.strings);
    vm.initString = NULL;
    freeObjects();
}

void freeResources() {
    Obj* iter = vm.objects;
    Obj* previous = NULL;
    while (iter != NULL) {
        Obj* next = iter->next;  // save before any potential free
        if (IS_RESOURCE(OBJ_VAL(iter)) && AS_RESOURCE(OBJ_VAL(iter))->destroy) {
            AS_RESOURCE(OBJ_VAL(iter))->destroy(AS_RESOURCE(OBJ_VAL(iter))->handle);
            if (previous == NULL)
                vm.objects = next;
            else
                previous->next = next;
            free(iter);
        } else {
            previous = iter;
        }
        iter = next;
    }
}

void push(Value value) {
    if (vm.stackTop == vm.stack + STACK_MAX) {
        runtimeError("Stack overflow!");
        exit(1);
    }

    *vm.stackTop = value;
    vm.stackTop++;
}

Value pop() {
    vm.stackTop--;
    return *vm.stackTop;
}

Value peek(int distance) {
    return vm.stackTop[-1 - distance];
}

static bool call(ObjClosure* closure, int argCount) {
    if (argCount != closure->function->arity) {
        runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
        if (errorWasHandled) return true;
        return false;
    }

    if (vm.frameCount == FRAMES_MAX) {
        runtimeError("Call stack overflow.");
        return false;
    }

    CallFrame* frame = &vm.frames[vm.frameCount++];
    frame->closure = closure;
    frame->ip = closure->function->chunk.code;
    frame->slots = vm.stackTop - argCount - 1;
    return true;
}

static bool callValue(Value callee, int argCount) {
    if (IS_OBJ(callee)) {
        switch (OBJ_TYPE(callee)) {
            case OBJ_BOUND_METHOD: {
                ObjBoundMethod* bound = AS_BOUND_METHOD(callee);
                vm.stackTop[-argCount-1] = bound->receiver;
                return call(bound->method, argCount);
            }
            case OBJ_CLASS: {
                ObjClass* class_ = AS_CLASS(callee);
                vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
                Value initializer;
                if (tableGet(&class_->methods, vm.initString, &initializer)) {
                    return call(AS_CLOSURE(initializer), argCount);
                } else if (argCount != 0) {
                    runtimeError("Expected 0 arguments but got %d", argCount);
                    if (errorWasHandled) return true;
                    return false;
                }
                return true;
            }
            case OBJ_CLOSURE:
                return call(AS_CLOSURE(callee), argCount);
            case OBJ_NATIVE: {
                Value result;
                NativeFn native = AS_NATIVE(callee);
                if (native(argCount, vm.stackTop - argCount, &result)) {
                    vm.stackTop -= argCount + 1;
                    push(result);
                    return true;
                } else {
                    runtimeError(AS_STRING(result)->chars);
                    if (errorWasHandled) return true;
                    return false;
                }
            }
            default:
                break;
        }
    }
    runtimeError("Can only call functions and classes.");
    if (errorWasHandled) return true;
    return false;
}

static bool invokeFromClass(ObjClass* class_, ObjString* name, int argCount) {
    Value method;
    if (!tableGet(&class_->methods, name, &method)) {
        runtimeError("Undefined property '%s'.", name->chars);
        if (errorWasHandled) return true;
        return false;
    }

    return call(AS_CLOSURE(method), argCount);
}

static bool invoke(ObjString* name, int argCount) {
    Value receiver = peek(argCount);

    if (!IS_INSTANCE(receiver)) {
        if (IS_MODULE(receiver)) {
            ObjModule* module = AS_MODULE(receiver);
            Value value;
            if (!tableGet(&module->table, name, &value)) {
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) return true;
                return false;
            }
            vm.stackTop[-argCount - 1] = value;
            return callValue(value, argCount);
        }

        runtimeError("Only instances have methods.");
        if (errorWasHandled) return true;
        return false;
    }

    ObjInstance* instance = AS_INSTANCE(receiver);
    Value value;
    if (tableGet(&instance->fields, name, &value)) {
        vm.stackTop[-argCount - 1] = value;
        return callValue(value, argCount);
    }

    return invokeFromClass(instance->class_, name, argCount);
}

static bool bindMethod(ObjClass* class_, ObjString* name) {
    Value method;
    if (!tableGet(&class_->methods, name, &method)) {
        runtimeError("Undefined property '%s'.", name->chars);
        if (errorWasHandled) return true;
        return false;
    }

    ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));

    pop();
    push(OBJ_VAL(bound));
    return true;
}

static ObjUpvalue* captureUpvalue(Value* local) {
    ObjUpvalue* prevUpvalue = NULL;
    ObjUpvalue* upvalue = vm.openUpvalues;
    while (upvalue != NULL && upvalue->location > local) {
        prevUpvalue = upvalue;
        upvalue = upvalue->next;
    }

    if (upvalue != NULL && upvalue->location == local) {
        return upvalue;
    }

    ObjUpvalue* createdUpvalue = newUpvalue(local);
    createdUpvalue->next = upvalue;

    if (prevUpvalue == NULL) {
        vm.openUpvalues = createdUpvalue;
    } else {
        prevUpvalue->next = createdUpvalue;
    }

    return createdUpvalue;
}

static void closeUpvalues(Value* last) {
    while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
        ObjUpvalue* upvalue = vm.openUpvalues;
        upvalue->closed = *upvalue->location;
        upvalue->location = &upvalue->closed;
        vm.openUpvalues = upvalue->next;
    }
}

static void defineMethod(ObjString* name) {
    Value method = peek(0);
    ObjClass* class_ = AS_CLASS(peek(1));
    tableSet(&class_->methods, name, method);
    pop();
}

static bool isFalsey(Value value) {
    return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
}

static void concatenate() {
    ObjString* b = AS_STRING(peek(0));
    ObjString* a = AS_STRING(peek(1));

    int length = a->length + b->length;
    char* chars = ALLOCATE(char, length + 1);
    memcpy(chars, a->chars, a->length);
    memcpy(chars + a->length, b->chars, b->length);
    chars[length] = '\0';

    ObjString* result = takeString(chars, length);
    pop();
    pop();
    push(OBJ_VAL(result));
}

static InterpretResult run() {
    CallFrame* frame = &vm.frames[vm.frameCount - 1];

#define READ_BYTE() (*frame->ip++)
#define READ_SHORT() (frame->ip += 2, (uint16_t)((frame->ip[-2] << 8) | frame->ip[-1]))
#define READ_LONG() (frame->ip += 3, (uint32_t)(frame->ip[-3] | (frame->ip[-2] << 8) | (frame->ip[-1] << 16)))
#define READ_CONSTANT() (frame->closure->function->chunk.constants.values[READ_BYTE()])
#define READ_CONSTANT_LONG() (frame->ip += 3, frame->closure->function->chunk.constants.values[frame->ip[-3] | (frame->ip[-2] << 8) | (frame->ip[-1] << 16)])
#define READ_STRING() AS_STRING(READ_CONSTANT())
#define READ_STRING_LONG() AS_STRING(READ_CONSTANT_LONG())
#define BINARY_OP(valueType, op) \
    do { \
        if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) { \
            runtimeError("Operands must be numbers."); \
            if (errorWasHandled) DISPATCH(); \
            return INTERPRET_RUNTIME_ERROR; \
        } \
        double b = AS_NUMBER(pop()); \
        double a = AS_NUMBER(pop()); \
        push(valueType(a op b)); \
    } while (false)
#define BIT_OP(valueType, op) \
    do { \
        if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) { \
            runtimeError("Operands must be numbers."); \
            if (errorWasHandled) DISPATCH(); \
            return INTERPRET_RUNTIME_ERROR; \
        } \
        int32_t b = (int32_t) AS_NUMBER(pop()); \
        int32_t a = (int32_t) AS_NUMBER(pop()); \
        push(valueType(a op b)); \
    } while (false)
#define BIT_SHIFT_OP(op) \
    do { \
        if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) { \
            runtimeError("Operands must be numbers."); \
            if (errorWasHandled) DISPATCH(); \
            return INTERPRET_RUNTIME_ERROR; \
        } \
        uint32_t b = (uint32_t) AS_NUMBER(pop()) & 31; \
        uint32_t a = (uint32_t) AS_NUMBER(pop()); \
        push(NUMBER_VAL((double)(int32_t)(a op b))); \
    } while (false)

// Computed gotos
// Sorry, Dijkstra
#ifdef __GNUC__
#define COMPUTED_GOTOS
#endif

#ifdef COMPUTED_GOTOS
    static void* dispatchTable[] = {
        [OP_CONSTANT]          = &&op_OP_CONSTANT,
        [OP_CONSTANT_LONG]     = &&op_OP_CONSTANT_LONG,
        [OP_ZERO]              = &&op_OP_ZERO,
        [OP_ONE]               = &&op_OP_ONE,
        [OP_NULL]              = &&op_OP_NULL,
        [OP_TRUE]              = &&op_OP_TRUE,
        [OP_FALSE]             = &&op_OP_FALSE,
        [OP_POP]               = &&op_OP_POP,
        [OP_GET_LOCAL]         = &&op_OP_GET_LOCAL,
        [OP_GET_LOCAL_LONG]    = &&op_OP_GET_LOCAL_LONG,
        [OP_SET_LOCAL]         = &&op_OP_SET_LOCAL,
        [OP_SET_LOCAL_LONG]    = &&op_OP_SET_LOCAL_LONG,
        [OP_GET_GLOBAL]        = &&op_OP_GET_GLOBAL,
        [OP_GET_GLOBAL_LONG]   = &&op_OP_GET_GLOBAL_LONG,
        [OP_DEFINE_GLOBAL]     = &&op_OP_DEFINE_GLOBAL,
        [OP_DEFINE_GLOBAL_LONG]= &&op_OP_DEFINE_GLOBAL_LONG,
        [OP_SET_GLOBAL]        = &&op_OP_SET_GLOBAL,
        [OP_SET_GLOBAL_LONG]   = &&op_OP_SET_GLOBAL_LONG,
        [OP_DEFINE_CONST]      = &&op_OP_DEFINE_CONST,
        [OP_DEFINE_CONST_LONG] = &&op_OP_DEFINE_CONST_LONG,
        [OP_GET_PROPERTY]      = &&op_OP_GET_PROPERTY,
        [OP_GET_PROPERTY_LONG] = &&op_OP_GET_PROPERTY_LONG,
        [OP_SET_PROPERTY]      = &&op_OP_SET_PROPERTY,
        [OP_SET_PROPERTY_LONG] = &&op_OP_SET_PROPERTY_LONG,
        [OP_GET_SUPER]         = &&op_OP_GET_SUPER,
        [OP_GET_SUPER_LONG]    = &&op_OP_GET_SUPER_LONG,
        [OP_GET_INDEX]         = &&op_OP_GET_INDEX,
        [OP_SET_INDEX]         = &&op_OP_SET_INDEX,
        [OP_GET_UPVALUE]       = &&op_OP_GET_UPVALUE,
        [OP_SET_UPVALUE]       = &&op_OP_SET_UPVALUE,
        [OP_ARRAY_INIT]        = &&op_OP_ARRAY_INIT,
        [OP_ARRAY_INIT_LONG]   = &&op_OP_ARRAY_INIT_LONG,
        [OP_EQUAL]             = &&op_OP_EQUAL,
        [OP_GREATER]           = &&op_OP_GREATER,
        [OP_LESS]              = &&op_OP_LESS,
        [OP_ADD]               = &&op_OP_ADD,
        [OP_SUBTRACT]          = &&op_OP_SUBTRACT,
        [OP_MULTIPLY]          = &&op_OP_MULTIPLY,
        [OP_DIVIDE]            = &&op_OP_DIVIDE,
        [OP_MODULUS]           = &&op_OP_MODULUS,
        [OP_NOT]               = &&op_OP_NOT,
        [OP_NEGATE]            = &&op_OP_NEGATE,
        [OP_BITAND]            = &&op_OP_BITAND,
        [OP_BITOR]             = &&op_OP_BITOR,
        [OP_BITXOR]            = &&op_OP_BITXOR,
        [OP_BITNOT]            = &&op_OP_BITNOT,
        [OP_BITRIGHT]          = &&op_OP_BITRIGHT,
        [OP_BITLEFT]           = &&op_OP_BITLEFT,
        [OP_PRINT]             = &&op_OP_PRINT,
        [OP_DUP]               = &&op_OP_DUP,
        [OP_JUMP]              = &&op_OP_JUMP,
        [OP_JUMP_IF_FALSE]     = &&op_OP_JUMP_IF_FALSE,
        [OP_LOOP]              = &&op_OP_LOOP,
        [OP_CALL]              = &&op_OP_CALL,
        [OP_INVOKE]            = &&op_OP_INVOKE,
        [OP_INVOKE_LONG]       = &&op_OP_INVOKE_LONG,
        [OP_SUPER_INVOKE]      = &&op_OP_SUPER_INVOKE,
        [OP_SUPER_INVOKE_LONG] = &&op_OP_SUPER_INVOKE_LONG,
        [OP_CLOSURE]           = &&op_OP_CLOSURE,
        [OP_CLOSURE_LONG]      = &&op_OP_CLOSURE_LONG,
        [OP_CLOSE_UPVALUE]     = &&op_OP_CLOSE_UPVALUE,
        [OP_TRY]               = &&op_OP_TRY,
        [OP_END_TRY]           = &&op_OP_END_TRY,
        [OP_RETURN]            = &&op_OP_RETURN,
        [OP_CLASS]             = &&op_OP_CLASS,
        [OP_CLASS_LONG]        = &&op_OP_CLASS_LONG,
        [OP_INHERIT]           = &&op_OP_INHERIT,
        [OP_METHOD]            = &&op_OP_METHOD,
        [OP_METHOD_LONG]       = &&op_OP_METHOD_LONG,
    };

    #define DISPATCH() goto *dispatchTable[READ_BYTE()];
    #define CASE(op)   op_ ## op
#else
    #define DISPATCH() continue
    #define CASE(op)   case op
#endif // __GNUC__

// ── Debug tracing ─────────────────────────────────────────────────────────────
#if defined(DEBUG_TRACE_EXECUTION) || defined(DEBUG_TRACE_STACK)
    FILE* file = fopen("trace.text", "a");
#endif

#ifdef COMPUTED_GOTOS
    DISPATCH(); // begin execution — jump to first opcode's handler
#else
    for (;;) {
#endif

#ifndef COMPUTED_GOTOS
#ifdef DEBUG_TRACE_STACK
        fprintf(file, "          ");
        for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
            fprintf(file, "[ ");
            printValue(*slot, file);
            fprintf(file, " ]");
        }
        fprintf(file, "\n");
#endif
#ifdef DEBUG_TRACE_EXECUTION
        dissassembleInstruction(&frame->closure->function->chunk,
            (int)(frame->ip - frame->closure->function->chunk.code), file);
#endif
        switch (READ_BYTE()) {
#endif // !COMPUTED_GOTOS


    CASE(OP_CONSTANT): {
        Value constant = READ_CONSTANT();
        push(constant);
        DISPATCH();
    } CASE(OP_CONSTANT_LONG): {
        Value constant = READ_CONSTANT_LONG();
        push(constant);
        DISPATCH();
    } CASE(OP_ZERO): {
        push(NUMBER_VAL(0.0));
        DISPATCH();
    } CASE(OP_ONE): {
        push(NUMBER_VAL(1.0));
        DISPATCH();
    }
    CASE(OP_NULL):  push(NULL_VAL);        DISPATCH();
    CASE(OP_TRUE):  push(BOOL_VAL(true));  DISPATCH();
    CASE(OP_FALSE): push(BOOL_VAL(false)); DISPATCH();
    CASE(OP_POP):   pop();                 DISPATCH();

    CASE(OP_GET_LOCAL): {
        uint8_t slot = READ_BYTE();
        push(frame->slots[slot]);
        DISPATCH();
    } CASE(OP_GET_LOCAL_LONG): {
        int slot = READ_LONG();
        push(frame->slots[slot]);
        DISPATCH();
    } CASE(OP_SET_LOCAL): {
        uint8_t slot = READ_BYTE();
        frame->slots[slot] = peek(0);
        DISPATCH();
    } CASE(OP_SET_LOCAL_LONG): {
        int slot = READ_LONG();
        frame->slots[slot] = peek(0);
        DISPATCH();
    } CASE(OP_GET_GLOBAL): {
        ObjString* name = READ_STRING();
        Value value;
        if (!tableGet(&vm.globals, name, &value)) {
            runtimeError("Undefined variable '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        push(value);
        DISPATCH();
    } CASE(OP_GET_GLOBAL_LONG): {
        ObjString* name = READ_STRING_LONG();
        Value value;
        if (!tableGet(&vm.globals, name, &value)) {
            
            runtimeError("Undefined variable '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        push(value);
        DISPATCH();
    } CASE(OP_DEFINE_GLOBAL): {
        ObjString* name = READ_STRING();
        tableSet(&vm.globals, name, peek(0));
        pop();
        DISPATCH();
    } CASE(OP_DEFINE_GLOBAL_LONG): {
        ObjString* name = READ_STRING_LONG();
        tableSet(&vm.globals, name, peek(0));
        pop();
        DISPATCH();
    } CASE(OP_SET_GLOBAL): {
        ObjString* name = READ_STRING();
        Value isConst;
        if (tableGet(&vm.consts, name, &isConst)) {
            runtimeError("Attempting to assign to constant '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        Value dummy;
        if (!tableGet(&vm.globals, name, &dummy)) {
            runtimeError("Undefined variable '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        tableSet(&vm.globals, name, peek(0));
        DISPATCH();
    } CASE(OP_SET_GLOBAL_LONG): {
        ObjString* name = READ_STRING_LONG();
        Value isConst;
        if (tableGet(&vm.consts, name, &isConst)) {
            
            runtimeError("Attempting to assign to constant '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        Value dummy;
        if (!tableGet(&vm.globals, name, &dummy)) {
            
            runtimeError("Undefined variable '%s'.", name->chars);
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        tableSet(&vm.globals, name, peek(0));
        DISPATCH();
    } CASE(OP_DEFINE_CONST): {
        ObjString* name = READ_STRING();
        tableSet(&vm.globals, name, peek(0));
        tableSet(&vm.consts, name, BOOL_VAL(true));
        pop();
        DISPATCH();
    } CASE(OP_DEFINE_CONST_LONG): {
        ObjString* name = READ_STRING_LONG();
        tableSet(&vm.globals, name, peek(0));
        tableSet(&vm.consts, name, BOOL_VAL(true));
        pop();
        DISPATCH();
    } CASE(OP_GET_PROPERTY): {
        if (IS_MODULE(peek(0))) {
            ObjModule* module = AS_MODULE(peek(0));
            ObjString* name = READ_STRING();
            Value value;
            if (!tableGet(&module->table, name, &value)) {
                
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
            pop();
            push(value);
        } else if (IS_INSTANCE(peek(0))) {
            ObjInstance* instance = AS_INSTANCE(peek(0));
            ObjString* name = READ_STRING();
            Value value;
            if (tableGet(&instance->fields, name, &value)) {
                pop();
                push(value);
            } else if (!bindMethod(instance->class_, name)) {
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
        } else if (IS_ARRAY(peek(0))) {
            ObjArray* array = AS_ARRAY(peek(0));
            ObjString* name = READ_STRING();
            if (strcmp(name->chars, "length") == 0) {
                pop();
                push(NUMBER_VAL(array->size));
            } else {
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
        } else {
            
            runtimeError("Only modules, instances, and arrays have properties.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        DISPATCH();
    } CASE(OP_GET_PROPERTY_LONG): {
        if (IS_MODULE(peek(0))) {
            ObjModule* module = AS_MODULE(peek(0));
            ObjString* name = READ_STRING_LONG();
            Value value;
            if (!tableGet(&module->table, name, &value)) {
                
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
            pop();
            push(value);
        } else if (IS_INSTANCE(peek(0))) {
            ObjInstance* instance = AS_INSTANCE(peek(0));
            ObjString* name = READ_STRING_LONG();
            Value value;
            if (tableGet(&instance->fields, name, &value)) {
                pop();
                push(value);
            } else if (!bindMethod(instance->class_, name)) {
                
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
        } else if (IS_ARRAY(peek(0))) {
            ObjArray* array = AS_ARRAY(peek(0));
            ObjString* name = READ_STRING_LONG();
            if (strcmp(name->chars, "length") == 0) {
                pop();
                push(NUMBER_VAL(array->size));
            } else {
                
                runtimeError("Undefined property '%s'.", name->chars);
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
        } else {
            
            runtimeError("Only modules, instances, and arrays have properties.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        DISPATCH();
    } CASE(OP_SET_PROPERTY): {
        if (!IS_INSTANCE(peek(1))) {
            
            runtimeError("Only instances have settable fields.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        ObjInstance* instance = AS_INSTANCE(peek(1));
        tableSet(&instance->fields, READ_STRING(), peek(0));
        Value value = pop();
        pop();
        push(value);
        DISPATCH();
    } CASE(OP_SET_PROPERTY_LONG): {
        if (!IS_INSTANCE(peek(1))) {
            
            runtimeError("Only instances have settable fields.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        ObjInstance* instance = AS_INSTANCE(peek(1));
        tableSet(&instance->fields, READ_STRING_LONG(), peek(0));
        Value value = pop();
        pop();
        push(value);
        DISPATCH();
    } CASE(OP_GET_SUPER): {
        ObjString* name = READ_STRING();
        ObjClass* superclass = AS_CLASS(pop());
        if (!bindMethod(superclass, name)) return INTERPRET_RUNTIME_ERROR;
        DISPATCH();
    } CASE(OP_GET_SUPER_LONG): {
        ObjString* name = READ_STRING_LONG();
        ObjClass* superclass = AS_CLASS(pop());
        if (!bindMethod(superclass, name)) return INTERPRET_RUNTIME_ERROR;
        DISPATCH();
    } CASE(OP_GET_INDEX): {
        Value indexVal = peek(0);
        Value val = peek(1);
        if ((!IS_STRING(val) && !IS_ARRAY(val)) || !IS_NUMBER(indexVal)) {
            runtimeError("Indexing requires string or array and number.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        if (IS_STRING(val)) {
            ObjString* str = AS_STRING(val);
            int index = (int)AS_NUMBER(indexVal);
            if (index < 0 || index >= str->length) {
                runtimeError("String index out of bounds.");
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
            char buffer[2] = { str->chars[index], '\0' };
            pop(); pop();
            push(OBJ_VAL(copyString(buffer, 1)));
        } else {
            ObjArray* arr = AS_ARRAY(val);
            int index = (int)AS_NUMBER(indexVal);
            if (index < 0 || index >= arr->capacity) {
                runtimeError("Array index out of bounds.");
                if (errorWasHandled) DISPATCH();
                return INTERPRET_RUNTIME_ERROR;
            }
            pop(); pop();
            push(arr->values[index]);
        }
        DISPATCH();
    } CASE(OP_SET_INDEX): {
        Value value = pop();
        Value index = pop();
        Value array = pop();
        if (!IS_NUMBER(index) || !IS_ARRAY(array)) {
            
            runtimeError("Setting index requires an array and a number.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        ObjArray* arr = AS_ARRAY(array);
        int idx = (int)AS_NUMBER(index);
        if (idx < 0 || idx >= arr->capacity) {
            runtimeError("Array index out of range.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        if (idx >= arr->size) {
            arr->size = idx+1;
        }
        arr->values[idx] = value;
        push(value);
        DISPATCH();
    } CASE(OP_GET_UPVALUE): {
        uint8_t slot = READ_BYTE();
        push(*frame->closure->upvalues[slot]->location);
        DISPATCH();
    } CASE(OP_SET_UPVALUE): {
        uint8_t slot = READ_BYTE();
        *frame->closure->upvalues[slot]->location = peek(0);
        DISPATCH();
    } CASE(OP_ARRAY_INIT): {
        int count = READ_BYTE();
        ObjArray* array = newArray(count);
        push(OBJ_VAL(array));                                     // root immediately
        for (int i = 0; i < count; i++)
            array->values[i] = vm.stackTop[-1 - count + i];
        array->size = count;
        vm.stackTop -= count + 1;                                 // remove elements AND the array slot
        push(OBJ_VAL(array));                                     // put array back on top
        DISPATCH();
    } CASE(OP_ARRAY_INIT_LONG): {
        int count = READ_LONG();
        ObjArray* array = newArray(count);
        push(OBJ_VAL(array));                                     // root immediately
        for (int i = 0; i < count; i++)
            array->values[i] = vm.stackTop[-1 - count + i];
        array->size = count;
        vm.stackTop -= count + 1;                                 // remove elements AND the array slot
        push(OBJ_VAL(array));                                     // put array back on top
        DISPATCH();
    } CASE(OP_EQUAL): {
        Value b = pop();
        Value a = pop();
        push(BOOL_VAL(valuesEqual(a, b)));
        DISPATCH();
    }
    CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
    CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
    CASE(OP_ADD): {
        if (IS_STRING(peek(0)) && IS_STRING(peek(1))) {
            concatenate();
        } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
            double b = AS_NUMBER(pop());
            double a = AS_NUMBER(pop());
            push(NUMBER_VAL(a + b));
        } else {
            
            runtimeError("Operands to addition must be two numbers or two strings.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        DISPATCH();
    }
    CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
    CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
    CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
    CASE(OP_MODULUS): {
        if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) {
            
            runtimeError("Operands to modulus must be two numbers.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        double b = AS_NUMBER(pop());
        double a = AS_NUMBER(pop());
        double result;
        if (b != 0 && (int64_t)a == a && (int64_t)b == b)
            result = (double)((int64_t)a % (int64_t)b);
        else
            result = fmod(a, b);
        push(NUMBER_VAL(result));
        DISPATCH();
    }
    CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
    CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
    CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
    CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
    CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
    CASE(OP_BITNOT): {
        if (!IS_NUMBER(peek(0))) {
            
            runtimeError("Operand to bitwise not must be a number.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        int32_t val = (int32_t)AS_NUMBER(pop());
        push(NUMBER_VAL((double)(~val)));
        DISPATCH();
    } CASE(OP_NOT):
        push(BOOL_VAL(isFalsey(pop())));
        DISPATCH();
    CASE(OP_NEGATE): {
        if (!IS_NUMBER(peek(0))) {
            
            runtimeError("Operand to unary negation must be a number.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        push(NUMBER_VAL(-AS_NUMBER(pop())));
        DISPATCH();
    } CASE(OP_PRINT): {
        int argCount = READ_BYTE();
        bool printError = false;
        Value* args = vm.stackTop - argCount;

        if (!IS_STRING(args[0])) {
            
            runtimeError("First argument to print must be a format string.");
            printError = true;
            goto print_end;
        }

        {
            ObjString* format = AS_STRING(args[0]);
            const char* chars = format->chars;
            int argIndex = 1;

            for (int i = 0; i < format->length; i++) {
                char c = chars[i];
                if (c == '%') {
                    if (i + 1 >= format->length) {
                        
                        runtimeError("Incomplete format specifier.");
                        printError = true;
                        break;
                    }
                    char spec = chars[++i];
                    if (argIndex >= argCount) {
                        
                        runtimeError("Not enough arguments for format string.");
                        printError = true;
                        break;
                    }
                    Value v = args[argIndex++];
                    switch (spec) {
                        case 'd':
                            if (!IS_NUMBER(v)) {
                                
                                runtimeError("%%d expects number.");
                                printError = true;
                                break;
                            }
                            printValue(v, NULL);
                            break;
                        case 's':
                            if (!IS_STRING(v)) {
                                
                                runtimeError("%%s expects string.");
                                printError = true;
                                break;
                            }
                            printObject(v, NULL);
                            break;
                        case 'o':
                            printValue(v, NULL);
                            break;
                        default:
                            
                            runtimeError("Unknown format specifier '%%%c'.", spec);
                            printError = true;
                            break;
                    }
                    if (printError) break;
                } else {
                    putchar(c);
                }
            }
        }

print_end:
        if (printError) {
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        vm.stackTop -= argCount;
        DISPATCH();
    }
    CASE(OP_DUP): push(peek(0)); DISPATCH();
    CASE(OP_JUMP): {
        uint16_t offset = READ_SHORT();
        frame->ip += offset;
        DISPATCH();
    } CASE(OP_JUMP_IF_FALSE): {
        uint16_t offset = READ_SHORT();
        if (isFalsey(peek(0))) frame->ip += offset;
        DISPATCH();
    } CASE(OP_LOOP): {
        uint16_t offset = READ_SHORT();
        frame->ip -= offset;
        DISPATCH();
    } CASE(OP_CALL): {
        int argCount = READ_BYTE();
        
        if (!callValue(peek(argCount), argCount)) return INTERPRET_RUNTIME_ERROR;
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    } CASE(OP_INVOKE): {
        ObjString* method = READ_STRING();
        int argCount = READ_BYTE();
        
        if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    } CASE(OP_INVOKE_LONG): {
        ObjString* method = READ_STRING_LONG();
        int argCount = READ_BYTE();
        
        if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    } CASE(OP_SUPER_INVOKE): {
        ObjString* method = READ_STRING();
        int argCount = READ_BYTE();
        ObjClass* superclass = AS_CLASS(pop());
        
        if (!invokeFromClass(superclass, method, argCount)) return INTERPRET_RUNTIME_ERROR;
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    } CASE(OP_SUPER_INVOKE_LONG): {
        ObjString* method = READ_STRING_LONG();
        int argCount = READ_BYTE();
        ObjClass* superclass = AS_CLASS(pop());
        
        if (!invokeFromClass(superclass, method, argCount)) return INTERPRET_RUNTIME_ERROR;
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    } CASE(OP_CLOSURE): {
        ObjFunction* function = AS_FUNCTION(READ_CONSTANT());
        ObjClosure* closure = newClosure(function);
        push(OBJ_VAL(closure));
        for (int i = 0; i < closure->upvalueCount; i++) {
            uint8_t isLocal = READ_BYTE();
            uint8_t index   = READ_BYTE();
            closure->upvalues[i] = isLocal
                ? captureUpvalue(frame->slots + index)
                : frame->closure->upvalues[index];
        }
        DISPATCH();
    } CASE(OP_CLOSURE_LONG): {
        ObjFunction* function = AS_FUNCTION(READ_CONSTANT_LONG());
        ObjClosure* closure = newClosure(function);
        push(OBJ_VAL(closure));
        for (int i = 0; i < closure->upvalueCount; i++) {
            uint8_t isLocal = READ_BYTE();
            uint8_t index   = READ_BYTE();
            closure->upvalues[i] = isLocal
                ? captureUpvalue(frame->slots + index)
                : frame->closure->upvalues[index];
        }
        DISPATCH();
    } CASE(OP_CLOSE_UPVALUE):
        closeUpvalues(vm.stackTop - 1);
        pop();
        DISPATCH();
    CASE(OP_TRY): {
        uint16_t offset = READ_SHORT();

        if (vm.handlerCount >= HANDLER_MAX) { 
            runtimeError("Too many nested try blocks.");
            exit(1);
        }

        ErrorHandler* handler = &vm.handlerStack[vm.handlerCount++];
        handler->frameCount = vm.frameCount;
        handler->stackTop   = vm.stackTop;
        handler->handlerIp  = frame->ip + offset;
        handler->frame      = frame;
        DISPATCH();
    }
    CASE(OP_END_TRY):
        vm.handlerCount--;
        DISPATCH();
    CASE(OP_RETURN): {
        Value result = pop();
        closeUpvalues(frame->slots);
        vm.frameCount--;
        if (vm.frameCount == 0) {
            pop();
            return INTERPRET_OK;
        }
        vm.stackTop = frame->slots;
        push(result);
        frame = &vm.frames[vm.frameCount - 1];
        
        DISPATCH();
    }
    CASE(OP_CLASS):
        push(OBJ_VAL(newClass(READ_STRING())));
        DISPATCH();
    CASE(OP_CLASS_LONG):
        push(OBJ_VAL(newClass(READ_STRING_LONG())));
        DISPATCH();
    CASE(OP_INHERIT): {
        Value superclass = peek(1);
        if (!IS_CLASS(superclass)) {
            
            runtimeError("Superclass must be a class.");
            if (errorWasHandled) DISPATCH();
            return INTERPRET_RUNTIME_ERROR;
        }
        ObjClass* subclass = AS_CLASS(peek(0));
        tableAddAll(&AS_CLASS(superclass)->methods, &subclass->methods);
        pop();
        DISPATCH();
    }
    CASE(OP_METHOD):
        defineMethod(READ_STRING());
        DISPATCH();
    CASE(OP_METHOD_LONG):
        defineMethod(READ_STRING_LONG());
        DISPATCH();

// ─────────────────────────────────────────────────────────────────────────────
#ifndef COMPUTED_GOTOS
        } // end switch
    } // end for(;;)
#endif

#if defined(DEBUG_TRACE_EXECUTION) || defined(DEBUG_TRACE_STACK)
    fclose(file);
#endif

#undef DISPATCH
#undef CASE
#undef READ_BYTE
#undef READ_SHORT
#undef READ_LONG
#undef READ_CONSTANT
#undef READ_CONSTANT_LONG
#undef READ_STRING
#undef READ_STRING_LONG
#undef BINARY_OP
#undef BIT_OP
#undef BIT_SHIFT_OP
}

InterpretResult interpret(const char* source) {
    initLookup();
    resetStack();

    ObjFunction* function = compile(source);
    if (function == NULL) return INTERPRET_COMPILE_ERROR;

    push(OBJ_VAL(function));
    ObjClosure* closure = newClosure(function);
    pop();
    push(OBJ_VAL(closure));
    call(closure, 0);

    return run();
}