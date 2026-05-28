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

#if defined(_WIN32) || defined(_WIN64)
    #define BURRITO_OS_WINDOWS

#elif defined(__APPLE__) && defined(__MACH__)
    #include <TargetConditionals.h>
    #if TARGET_OS_MAC
        #define BURRITO_OS_MACOS
    #endif

#elif defined(__linux__)
    #define BURRITO_OS_LINUX

#elif defined(__FreeBSD__)
    #define BURRITO_OS_FREEBSD
    #define BURRITO_OS_BSD

#elif defined(__OpenBSD__)
    #define BURRITO_OS_OPENBSD
    #define BURRITO_OS_BSD

#elif defined(__NetBSD__)
    #define BURRITO_OS_NETBSD
    #define BURRITO_OS_BSD

#elif defined(__DragonFly__)
    #define BURRITO_OS_DRAGONFLY
    #define BURRITO_OS_BSD

#elif defined(__unix__)
    #define BURRITO_OS_UNIX

#else
    #define BURRITO_OS_UNKNOWN
#endif

#if defined(__x86_64__) || defined(_M_X64)
    #define BURRITO_ARCH "x86_64"
#elif defined(__i386__) || defined(_M_IX86)
    #define BURRITO_ARCH "x86"
#elif defined(__aarch64__) || defined(_M_ARM64)
    #define BURRITO_ARCH "arm64"
#elif defined(__arm__) || defined(_M_ARM)
    #define BURRITO_ARCH "arm"
#elif defined(__riscv) && __riscv_xlen == 64
    #define BURRITO_ARCH "riscv64"
#elif defined(__riscv) && __riscv_xlen == 32
    #define BURRITO_ARCH "riscv32"
#else
    #define BURRITO_ARCH "unknown"
#endif

extern bool disassembleFlag;

char* readFile(const char* path);

#endif