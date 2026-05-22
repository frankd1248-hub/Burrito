#ifndef burrito_common_h
#define burrito_common_h

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

// #define DEBUG_PRINT_CODE
// #define DEBUG_TRACE_EXECUTION
// #define DEBUG_TRACE_STACK

// #define DEBUG_STRESS_GC
// #define DEBUG_LOG_GC

#define CONSTANT_OPTIMIZATIONS
#define NAN_BOXING

#define UINT8_COUNT (UINT8_MAX + 1)
#define ARB_COUNT (0x4000)          // Arbitrary limit so that the VM does not collapse the universe with its memory needs

extern bool disassembleFlag;

char* readFile(const char* path);

#endif