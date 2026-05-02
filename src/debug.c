#include <stdio.h>

#include "debug.h"
#include "object.h"
#include "value.h"

void dissassembleChunk(Chunk* chunk, const char* name, FILE* out) {
    if (out == NULL) out = stdout;
    fprintf(out, "== %s ==\n", name);
    for (int offset = 0; offset < chunk->count;) {
        offset = dissassembleInstruction(chunk, offset, out);
    }
}

static int constantInstruction(const char* name, Chunk* chunk, int offset, FILE* out) {
    uint8_t constant = chunk->code[offset + 1];
    fprintf(out, "%-16s %4d '", name, constant);
    printValue(chunk->constants.values[constant], out);
    fprintf(out, "'\n");
    return offset + 2;
}

static int longConstantInstruction(const char* name, Chunk* chunk, int offset, FILE* out) {
    uint32_t constant = chunk->code[offset + 1] |
                       (chunk->code[offset + 2] << 8) |
                       (chunk->code[offset + 3] << 16);

    fprintf(out, "%-16s %4d '", name, constant);
    printValue(chunk->constants.values[constant], out);
    fprintf(out, "'\n");
    return offset + 4;
}

static int simpleInstruction(const char* name, int offset, FILE* out) {
    fprintf(out, "%s\n", name);
    return offset + 1;
}

static int byteInstruction(const char* name, Chunk* chunk, int offset, FILE* out) {
    uint8_t slot = chunk->code[offset + 1];
    fprintf(out, "%-16s %4d\n", name, slot);
    return offset + 2;
}

static int longByteInstruction(const char* name, Chunk* chunk, int offset, FILE* out) {
    uint32_t slot = chunk->code[offset + 1] |
                   (chunk->code[offset + 2] << 8) |
                   (chunk->code[offset + 3] << 16);

    fprintf(out, "%-16s %4d\n", name, slot);
    return offset + 4;
}

static int jumpInstruction(const char* name, int sign, Chunk* chunk, int offset, FILE* out) {
    uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
    jump |= chunk->code[offset + 2];

    fprintf(out, "%-16s %4d -> %d\n",
            name,
            offset,
            offset + 3 + sign * jump);

    return offset + 3;
}

int dissassembleInstruction(Chunk* chunk, int offset, FILE* out) {
    if (out == NULL) out = stdout;

    fprintf(out, "%06d ", offset);

    int line = getLine(chunk, offset);
    if (offset > 0 && line == getLine(chunk, offset - 1)) {
        fprintf(out, "     | ");
    } else {
        fprintf(out, "%6d ", line);
    }

    uint8_t instruction = chunk->code[offset];

    switch(instruction) {
        case OP_CONSTANT:
            return constantInstruction("OP_CONSTANT", chunk, offset, out);
        case OP_CONSTANT_LONG:
            return longConstantInstruction("OP_CONSTANT_LONG", chunk, offset, out);
        case OP_NULL:
            return simpleInstruction("OP_NULL", offset, out);
        case OP_TRUE:
            return simpleInstruction("OP_TRUE", offset, out);
        case OP_FALSE:
            return simpleInstruction("OP_FALSE", offset, out);
        case OP_POP:
            return simpleInstruction("OP_POP", offset, out);
        case OP_GET_LOCAL:
            return byteInstruction("OP_GET_LOCAL", chunk, offset, out);
        case OP_GET_LOCAL_LONG:
            return longByteInstruction("OP_GET_LOCAL_LONG", chunk, offset, out);
        case OP_SET_LOCAL:
            return byteInstruction("OP_SET_LOCAL", chunk, offset, out);
        case OP_SET_LOCAL_LONG:
            return longByteInstruction("OP_SET_LOCAL_LONG", chunk, offset, out);
        case OP_GET_GLOBAL:
            return constantInstruction("OP_GET_GLOBAL", chunk, offset, out);
        case OP_GET_GLOBAL_LONG:
            return longConstantInstruction("OP_GET_GLOBAL_LONG", chunk, offset, out);
        case OP_DEFINE_GLOBAL:
            return constantInstruction("OP_DEFINE_GLOBAL", chunk, offset, out);
        case OP_DEFINE_GLOBAL_LONG:
            return longConstantInstruction("OP_DEFINE_GLOBAL_LONG", chunk, offset, out);
        case OP_SET_GLOBAL:
            return constantInstruction("OP_SET_GLOBAL", chunk, offset, out);
        case OP_SET_GLOBAL_LONG:
            return longConstantInstruction("OP_SET_GLOBAL_LONG", chunk, offset, out);
        case OP_DEFINE_CONST:
            return constantInstruction("OP_DEFINE_CONST", chunk, offset, out);
        case OP_DEFINE_CONST_LONG:
            return longConstantInstruction("OP_DEFINE_CONST_LONG", chunk, offset, out);
        case OP_GET_PROPERTY:
            return constantInstruction("OP_GET_PROPERTY", chunk, offset, out);
        case OP_GET_PROPERTY_LONG:
            return longConstantInstruction("OP_GET_PROPERTY_LONG", chunk, offset, out);
        case OP_SET_PROPERTY:
            return constantInstruction("OP_SET_PROPERTY", chunk, offset, out);
        case OP_SET_PROPERTY_LONG:
            return longConstantInstruction("OP_SET_PROPERTY_LONG", chunk, offset, out);
        case OP_GET_INDEX:
            return simpleInstruction("OP_GET_INDEX", offset, out);
        case OP_SET_INDEX:
            return simpleInstruction("OP_SET_INDEX", offset, out);
        case OP_GET_UPVALUE:
            return byteInstruction("OP_GET_UPVALUE", chunk, offset, out);
        case OP_SET_UPVALUE:
            return byteInstruction("OP_SET_UPVALUE", chunk, offset, out);
        case OP_ARRAY_INIT:
            return constantInstruction("OP_ARRAY_INIT", chunk, offset, out);
        case OP_ARRAY_INIT_LONG:
            return longConstantInstruction("OP_ARRAY_INIT_LONG", chunk, offset, out);
        case OP_ARRAY_NEW:
            return simpleInstruction("OP_ARRAY_NEW", offset, out);
        case OP_EQUAL:
            return simpleInstruction("OP_EQUAL", offset, out);
        case OP_GREATER:
            return simpleInstruction("OP_GREATER", offset, out);
        case OP_LESS:
            return simpleInstruction("OP_LESS", offset, out);
        case OP_ADD:
            return simpleInstruction("OP_ADD", offset, out);
        case OP_SUBTRACT:
            return simpleInstruction("OP_SUBTRACT", offset, out);
        case OP_MULTIPLY:
            return simpleInstruction("OP_MULTIPLY", offset, out);
        case OP_DIVIDE:
            return simpleInstruction("OP_DIVIDE", offset, out);
        case OP_NOT:
            return simpleInstruction("OP_NOT", offset, out);
        case OP_NEGATE:
            return simpleInstruction("OP_NEGATE", offset, out);
        case OP_PRINT:
            return byteInstruction("OP_PRINT", chunk, offset, out);
        case OP_JUMP:
            return jumpInstruction("OP_JUMP", 1, chunk, offset, out);
        case OP_JUMP_IF_FALSE:
            return jumpInstruction("OP_JUMP_IF_FALSE", 1, chunk, offset, out);
        case OP_LOOP:
            return jumpInstruction("OP_LOOP", -1, chunk, offset, out);
        case OP_CALL:
            return byteInstruction("OP_CALL", chunk, offset, out);
        case OP_CLOSURE: {
            offset++;
            uint8_t constant = chunk->code[offset++];
            
            fprintf(out, "%-16s %4d ", "OP_CLOSURE", constant);
            printValue(chunk->constants.values[constant], out);
            fprintf(out, "\n");

            ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);

            for (int j = 0; j < function->upvalueCount; j++) {
                int isLocal = chunk->code[offset++];
                int index = chunk->code[offset++];
                fprintf(out, "%04d      |                     %s %d\n",
                        offset - 2,
                        isLocal ? "local" : "upvalue",
                        index);
            }

            return offset;
        }
        case OP_CLOSURE_LONG: {
            offset++;
            uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
            
            fprintf(out, "%-16s %4d ", "OP_CLOSURE_LONG", constant);
            printValue(chunk->constants.values[constant], out);
            fprintf(out, "\n");

            ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);

            for (int j = 0; j < function->upvalueCount; j++) {
                int isLocal = chunk->code[offset++];
                int index = chunk->code[offset++];
                fprintf(out, "%04d      |                     %s %d\n",
                        offset - 2,
                        isLocal ? "local" : "upvalue",
                        index);
            }

            return offset;
        }
        case OP_CLOSE_UPVALUE:
            return simpleInstruction("OP_CLOSE_UPVALUE", offset, out);
        case OP_RETURN:
            return simpleInstruction("OP_RETURN", offset, out);
        case OP_CLASS:
            return constantInstruction("OP_CLASS", chunk, offset, out);
        case OP_CLASS_LONG:
            return longConstantInstruction("OP_CLASS_LONG", chunk, offset, out);
        default:
            fprintf(out, "Unknown opcode %d\n", instruction);
            return offset + 1;
    }
}