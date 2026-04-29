#ifndef burrito_debug_h
#define burrito_debug_h

#include <stdio.h>

#include "chunk.h"

void dissassembleChunk(Chunk* chunk, const char* name, FILE* out);
int dissassembleInstruction(Chunk* chunk, int offset, FILE* out);

#endif