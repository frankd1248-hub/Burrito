#ifndef burrito_chunk_h
#define burrito_chunk_h

#include "common.h"
#include "value.h"

typedef enum {
    OP_CONSTANT,             // Constant values 0-255
    OP_CONSTANT_LONG,        // Constant values 256-16777215
    OP_NULL,                 // Null value singleton
    OP_TRUE,                 // True value singleton
    OP_FALSE,                // False value singleton
    OP_POP,                  // Pop a value from the VM stack
    OP_GET_LOCAL,            // Push the value of the local at index (operand) to the VM stack
    OP_GET_LOCAL_LONG,       // Same as above, 256-16383
    OP_SET_LOCAL,            // Pop a value from the VM stack and store it at the local at index (operand)
    OP_SET_LOCAL_LONG,       // Same as above, 256-16383
    OP_GET_GLOBAL,           // Push the value of the global with the name (operand) to the VM stack
    OP_GET_GLOBAL_LONG,      // Same as above, 256-16777215
    OP_DEFINE_GLOBAL,        // Pop a value from the VM stack and store it at the global with name (operand)
    OP_DEFINE_GLOBAL_LONG,   // Same as above, 256-16777215. These opcodes are only used at initialization.
    OP_SET_GLOBAL,           // Same as OP_DEFINE_GLOBAL, but with runtime error checking
    OP_SET_GLOBAL_LONG,      // Same as above, 256-16777215.
    OP_DEFINE_CONST,         // Does the same as OP_DEFINE_GLOBAL and sets a value in the VM consts table
    OP_DEFINE_CONST_LONG,    // Same as above, 256-16777215.
    OP_GET_PROPERTY,         // Gets a function or constant from a module, or length from an array.
    OP_GET_PROPERTY_LONG,    // Same as above, if the name is stored past 256 in the constant table.
    OP_GET_INDEX,            // Gets character from a string or entry in an array    [value] [index]
    OP_SET_INDEX,            // Sets a value to an entry in an array                 [array] [index] [newValue]
    OP_GET_UPVALUE,          // Gets the value from the upvalue at slot (operand) and pushes it to the VM stack
    OP_SET_UPVALUE,          // Gets the value at the top of the VM stack and sets it to the upvalue at slot (operand)
    OP_ARRAY_INIT,           // Pops (operand) values from the VM stack and creates an array literal and pushes it back
    OP_ARRAY_INIT_LONG,      // Same as above, if array size is >= 256
    OP_ARRAY_NEW,            // Creates an array literal of (operand) NULL singletons and pushes it onto the VM stack
    OP_IMPORT,               // Import the module with name (operand)
    OP_IMPORT_LONG,          // Same as above, if the name got put into a long constant index
    OP_EQUAL,                // Pops two values and pushes a boolean (if they are equal)
    OP_GREATER,              // Pops two values and pushes a boolean (if the first is greater than the second)
    OP_LESS,                 // Pops two values and pushes a boolean (if the first is less than the second)
    OP_ADD,                  // Pops two values and pushes one back (sum)
    OP_SUBTRACT,             // Pops two values and pushes a number (difference)
    OP_MULTIPLY,             // Pops two values and pushes a number (product)
    OP_DIVIDE,               // Pops two values and pushes a number (quotient)
    OP_NOT,                  // Pops a value and pushes its falsiness onto the VM stack
    OP_NEGATE,               // Pops a value and pushes its opposite onto the VM stack
    OP_PRINT,                // Pops (operant) values and formatted-prints them.
    OP_DUP,                  // Duplicates value on the top of the VM stack
    OP_JUMP,                 // Unconditional jump forward by (operand)
    OP_JUMP_IF_FALSE,        // Conditional jump forward by (operand)
    OP_LOOP,                 // Unconditional jump back by (operand)
    OP_CALL,                 // Calls the function that is stored under all its arguments in the stack
    OP_CLOSURE,              // Creates a closure.
    OP_CLOSE_UPVALUE,        // Closes one upvalue
    OP_RETURN,               // Returns from the current funcion with the value at the top of the stack
} OpCode;

/**
 * A struct to store line information in tokens more efficiently
 */
typedef struct {
    int offset;
    int line;
} LineStart;

/**
 * A chunk of code, representing one function at runtime.
 */
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