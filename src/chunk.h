#ifndef burrito_chunk_h
#define burrito_chunk_h

#include "common.h"
#include "value.h"

/**
 * 69 Opcodes (nice)
 */
typedef enum {
    OP_CONSTANT,             // Fetch a constant from the array
    OP_CONSTANT_LONG,
    OP_ZERO,                 // Push 0.0
    OP_ONE,                  // Push 1.0
    OP_NULL,                 // Push null
    OP_TRUE,                 // Push true
    OP_FALSE,                // Push false
    OP_POP,
    OP_GET_LOCAL,            // Fetch a local from the frame stack
    OP_GET_LOCAL_LONG,
    OP_SET_LOCAL,
    OP_SET_LOCAL_LONG,
    OP_GET_GLOBAL,           // Fetch a global from the table
    OP_GET_GLOBAL_LONG,
    OP_DEFINE_GLOBAL,
    OP_DEFINE_GLOBAL_LONG,
    OP_SET_GLOBAL,
    OP_SET_GLOBAL_LONG,
    OP_DEFINE_CONST,
    OP_DEFINE_CONST_LONG,
    OP_GET_PROPERTY,         // Get property from module, array, string, or instance.
    OP_GET_PROPERTY_LONG,
    OP_SET_PROPERTY,
    OP_SET_PROPERTY_LONG,
    OP_GET_SUPER,            // Get superclass for a class
    OP_GET_SUPER_LONG,
    OP_GET_INDEX,            // Get indexed element from a string or array
    OP_SET_INDEX,
    OP_GET_UPVALUE,          // Fetch an upvalue from the array
    OP_SET_UPVALUE,
    OP_ARRAY_INIT,           // Create an array object from values on the stack
    OP_ARRAY_INIT_LONG,
    OP_ARRAY_NEW,
    OP_EQUAL,
    OP_GREATER,
    OP_LESS,
    OP_ADD,
    OP_SUBTRACT,
    OP_MULTIPLY,
    OP_DIVIDE,
    OP_MODULUS,
    OP_NOT,
    OP_NEGATE,
    OP_BITAND,
    OP_BITOR,
    OP_BITXOR,
    OP_BITNOT,
    OP_BITRIGHT,
    OP_BITLEFT,
    OP_PRINT,                // Formatted print
    OP_TO_STRING,
    OP_DUP,                  // Duplicate top two values on the stack
    OP_DUP2,
    OP_JUMP,                 // Unconditional jump forwards
    OP_JUMP_IF_FALSE,
    OP_LOOP,                 // Unconditional jump back
    OP_CALL,                 // Call a value
    OP_INVOKE,
    OP_INVOKE_LONG,
    OP_SUPER_INVOKE,         // Invoke from superclass
    OP_SUPER_INVOKE_LONG,
    OP_IMPORT,               // import one;           — puts the ObjModule in globals as "one"
    OP_IMPORT_FROM,          // from one import foo;  — puts specific names into globals
    OP_CLOSURE,              // Create a closure
    OP_CLOSURE_LONG,
    OP_CLOSE_UPVALUE,
    OP_TRY,                  // Start try block (push handler)
    OP_END_TRY,              // Pop handler
    OP_RETURN,
    OP_CLASS,                // Create class
    OP_CLASS_LONG,
    OP_INHERIT,              // Create inheritance relationship between class objects
    OP_METHOD,               // Create method
    OP_METHOD_LONG,
} OpCode;

typedef struct {
    int offset;
    int line;
} LineStart;

typedef struct {
    int count;
    int capacity;
    uint8_t* code;
    int lineCount;
    int lineCapacity;
    LineStart* lines;
    ValueArray constants;
} Chunk;

void initChunk(Chunk* chunk);
void freeChunk(Chunk* chunk);
void writeChunk(Chunk* chunk, uint8_t byte, int line);
int addConstant(Chunk* chunk, Value value);
void writeConstant(Chunk* chunk, Value value, int line);
int getLine(Chunk* chunk, int instruction);

#endif