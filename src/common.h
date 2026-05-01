#ifndef burrito_common_h
#define burrito_common_h

#include <stdbool.h>  // For the bool type
#include <stddef.h>   // For misc. definitions
#include <stdint.h>   // For fixed-width int types

// #define DEBUG_PRINT_CODE
// #define DEBUG_TRACE_EXECUTION
// #define DEBUG_TRACE_STACK

// #define DEBUG_STRESS_GC
// #define DEBUG_LOG_GC

#define CONSTANT_OPTIMIZATIONS
#define NAN_BOXING

#define UINT8_COUNT (UINT8_MAX + 1)
#define ARB_COUNT (0x4000)          // Arbitrary limit so that the VM does not collapse the universe with its memory needs

#endif