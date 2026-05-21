#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bio.h"
#include "../vm.h"

static bool getNumberNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("getNumber() does not expect arguments.", 38));
        return false;
    }
#endif

    double d;
    if (scanf("%lf", &d) != 1) {
        *result = OBJ_VAL(copyString("Failed to read number.", 23));
        return false;
    }

    int c;
    while ((c = getchar()) != '\n' && c != EOF);

    *result = NUMBER_VAL(d);
    return true;
}

static bool getStringNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("getString() does not expect arguments.", 38));
        return false;
    }
#endif

    char* buf = malloc(sizeof(char) * 512);
    if (scanf("%511s", buf) != 1) {
        *result = OBJ_VAL(copyString("Failed to read string.", 23));
        return false;
    }

    int c;
    while ((c = getchar()) != '\n' && c != EOF);

    *result = OBJ_VAL(copyString(buf, strlen(buf)));
    free(buf);
    return true;
}

static bool readLineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("readLine() does not expect arguments.", 37));
        return false;
    }
#endif

    char* buf = malloc(sizeof(char) * 512);
    int count = 0;
    int c;

    do {
        c = getchar();
        buf[count++] = c;
    } while (c != '\n' && c != EOF && count < 511);

    if (count > 0) count--;
    buf[count] = '\0';

    *result = OBJ_VAL(copyString(buf, count));
    free(buf);
    return true;
}

static bool read(const char* fn, Value* result) {
    FILE* file = fopen(fn, "r");
    if (file == NULL) return false;

    fseek(file, 0, SEEK_END);
    long fsize = ftell(file);
    rewind(file);

    char* buf = malloc(sizeof(char) * (fsize + 1));
    if (buf == NULL) {
        fclose(file);
        return false;
    }

    long red = fread(buf, sizeof(char), fsize, file);
    buf[red] = '\0';

    *result = OBJ_VAL(copyString(buf, red));
    fclose(file);
    free(buf);

    return true;
}

static bool write(const char* fn, char* toWrite, char* mode) {
    FILE* file = fopen(fn, mode);
    if (file == NULL) return false;

    fputs(toWrite, file);
    fclose(file);

    return true;
}

static bool readFileNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("readFile() expects one string argument.", 39));
        return false;
    }
#endif

    bool res = read(AS_CSTRING(args[0]), result);
    if (!res) {
        *result = OBJ_VAL(copyString("Failed to read file", 19));
        return false;
    }
    return true;
}

static bool writeFileNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("writeFile() expects two string arguments.", 41));
        return false;
    }
#endif

    bool res = write(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "w");
    if (!res) {
        *result = OBJ_VAL(copyString("Failed to write file", 20));
        return false;
    }
    *result = BOOL_VAL(true);
    return true;
}

static bool appendFileNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
        *result = OBJ_VAL(copyString("appendFile() expects two string arguments.", 42));
        return false;
    }
#endif

    bool res = write(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "a");
    if (!res) {
        *result = OBJ_VAL(copyString("Failed to write file", 20));
        return false;
    }
    *result = BOOL_VAL(true);
    return true;
}

static bool flushNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("flush() does not expect arguments.", 35));
        return false;
    }
#endif

    fflush(stdout);
    *result = BOOL_VAL(true);
    return true;
}

ObjModule* buildIOModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
    tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
    tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
    tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
    tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
    tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
    tableSet(&module->table, copyString("flush", 5), OBJ_VAL(newNative(flushNative)));

    pop();
    return module;
}