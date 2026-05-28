#include "bsys.h"

#include <stdlib.h>
#include <string.h>

#include "../vm.h"
#include "../memory.h"

#if defined(BURRITO_OS_WINDOWS)
    #include <windows.h>
    #include <process.h>
#else
    #include <unistd.h>
    #include <sys/types.h>
#endif

static bool argsNative(int argCount, Value* args, Value* result) {
    ObjArray* arr = newArray(0);
    push(OBJ_VAL(arr));
 
    // Skip argv[0] (the interpreter path) and argv[1] (the script path).
    // Script-visible args begin at argv[2].
    int start = (vm.argc >= 2) ? 2 : vm.argc;
 
    for (int i = start; i < vm.argc; i++) {
        arr = AS_ARRAY(peek(0));   // re-read after potential GC in copyString
        if (arr->size == arr->capacity) {
            int oldCap = arr->capacity;
            arr->capacity = GROW_CAPACITY(arr->capacity);
            arr->values = GROW_ARRAY(Value, arr->values, oldCap, arr->capacity);
        }
        arr->values[arr->size++] = OBJ_VAL(copyString(vm.argv[i], strlen(vm.argv[i])));
    }
 
    *result = peek(0);
    pop();
    return true;
}

static bool envNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("env() expects one string argument.", 34));
        return false;
    }
#endif
 
    const char* val = getenv(AS_CSTRING(args[0]));
    *result = val != NULL
        ? OBJ_VAL(copyString(val, strlen(val)))
        : NULL_VAL;
    return true;
}

static bool setEnvNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("setEnv() expects two string arguments.", 38));
        return false;
    }
#endif
 
#if defined(BURRITO_OS_WINDOWS)
    int ok = SetEnvironmentVariableA(AS_CSTRING(args[0]), AS_CSTRING(args[1]));
    *result = BOOL_VAL(ok != 0);
#else
    int ok = setenv(AS_CSTRING(args[0]), AS_CSTRING(args[1]), 1 /* overwrite */);
    *result = BOOL_VAL(ok == 0);
#endif
    return true;
}

static bool homeDirNative(int argCount, Value* args, Value* result) {
#if defined(BURRITO_OS_WINDOWS)
    const char* home = getenv("USERPROFILE");
    if (home == NULL) home = getenv("HOMEDRIVE");   // last-ditch fallback
#else
    const char* home = getenv("HOME");
#endif
 
    *result = home != NULL
        ? OBJ_VAL(copyString(home, strlen(home)))
        : NULL_VAL;
    return true;
}

static bool tempDirNative(int argCount, Value* args, Value* result) {
#if defined(BURRITO_OS_WINDOWS)
    char buf[MAX_PATH];
    DWORD len = GetTempPathA(MAX_PATH, buf);
    if (len == 0) {
        *result = OBJ_VAL(copyString("C:\\Temp", 7));
    } else {
        // GetTempPathA includes a trailing backslash; strip it for consistency.
        if (len > 0 && buf[len - 1] == '\\') len--;
        *result = OBJ_VAL(copyString(buf, (int)len));
    }
#else
    const char* tmp = getenv("TMPDIR");
    if (tmp == NULL) tmp = "/tmp";
    int len = strlen(tmp);
    // Strip trailing slash for consistency.
    if (len > 1 && tmp[len - 1] == '/') len--;
    *result = OBJ_VAL(copyString(tmp, len));
#endif
    return true;
}

static bool runNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("run() expects one string argument.", 34));
        return false;
    }
#endif
 
    int code = system(AS_CSTRING(args[0]));
    *result = NUMBER_VAL((double)code);
    return true;
}

static bool platformNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("platform() expects no arguments.", 32));
        return false;
    }
#endif

#if defined(BURRITO_OS_WINDOWS)
    *result = OBJ_VAL(copyString("Windows", 7));
#elif defined(BURRITO_OS_MACOS)
    *result = OBJ_VAL(copyString("MacOS/OSX", 5));
#elif defined(BURRITO_OS_LINUX)
    *result = OBJ_VAL(copyString("Linux", 5));
#elif defined(BURRITO_OS_UNIX)
    *result = OBJ_VAL(copyString("Unix", 4));
#elif defined(BURRITO_OS_FREEBSD)
    *result = OBJ_VAL(copyString("FreeBSD", 7));
#elif defined(BURRITO_OS_OPENBSD)
    *result = OBJ_VAL(copyString("OpenBSD", 7));
#elif defined(BURRITO_OS_NETBSD)
    *result = OBJ_VAL(copyString("NetBSD", 6));
#elif defined(BURRITO_OS_DRAGONFLY)
    *result = OBJ_VAL(copyString("Dragonfly", 9));
#elif defined(BURRITO_OS_UNKNOWN)
    *result = OBJ_VAL(copyString("Unknown OS", 10));
#else
    *result = OBJ_VAL(copyString("Internal error", 14));
#endif

    return true;
}

static bool archNative(int argCount, Value* args, Value* result) {
    const char* arch = BURRITO_ARCH;
    *result = OBJ_VAL(copyString(arch, strlen(arch)));
    return true;
}

static bool pidNative(int argCount, Value* args, Value* result) {
#if defined(BURRITO_OS_WINDOWS)
    *result = NUMBER_VAL((double)_getpid());
#else
    *result = NUMBER_VAL((double)getpid());
#endif
    return true;
}

static bool sysExitNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("exit() expects one number argument.", 35));
        return false;
    }
#endif
 
    exit((int)AS_NUMBER(args[0]));
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

ObjModule* buildSysModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "args",     4, argsNative);
    addNative(module, "env",      3, envNative);
    addNative(module, "setEnv",   6, setEnvNative);
    addNative(module, "homeDir",  7, homeDirNative);
    addNative(module, "tempDir",  7, tempDirNative);
 
    addNative(module, "run",      3, runNative);
 
    addNative(module, "platform", 8, platformNative);
    addNative(module, "arch",     4, archNative);
 
    addNative(module, "pid",      3, pidNative);
    addNative(module, "exit",     4, sysExitNative);

    pop();
    return module;
}