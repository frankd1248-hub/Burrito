
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _WIN32
    #include <direct.h>
    #define getcwd _getcwd // Windows uses _getcwd
#else
    #ifndef __USE_MISC
    #define __USE_MISC
    #endif

    #include <unistd.h>
    #include <dirent.h>
    #include <sys/stat.h>
#endif

#include "bio.h"
#include "../memory.h"
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
    if (count > 0 && buf[count - 1] == '\r') count--;
    buf[count] = '\0';

    *result = OBJ_VAL(copyString(buf, count));
    free(buf);
    return true;
}

static bool read_(const char* fn, Value* result) {
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

static bool write_(const char* fn, char* toWrite, char* mode) {
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

    bool res = read_(AS_CSTRING(args[0]), result);
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

    bool res = write_(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "w");
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

    bool res = write_(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "a");
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

static bool currentDirNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("currentDir() does not expect arguments.", 39));
        return false;
    }
#endif

    char* cwd = getcwd(NULL, 0);
    *result = OBJ_VAL(copyString(cwd, strlen(cwd)));
    free(cwd);
    return true;
}

static bool chdirNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("changeDir() takes one string argument.", 38));
        return false;
    }
#endif

    char* dir = AS_CSTRING(args[0]);
    if (chdir(dir) == 0) {
        *result = BOOL_VAL(true);
        return true;
    } else {
        *result = OBJ_VAL(copyString("Failed to change directory.", 27));
        return false;
    }
}

static bool listDirNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("listDir() expects no arguments.", 31));
        return false;
    }
#endif

#ifdef _WIN32

    // TEMPORARY STUB
    *result = BOOL_VAL(true);
    return true;
#else
    struct dirent *entry;
    DIR *dp = opendir("."); // Open current directory

    if (dp == NULL) {
        *result = OBJ_VAL(copyString("Could not open current directory.", 33));
        return false;
    }

    int capacity = 8;
    int count    = 0;
    char**  array   = ALLOCATE(char*, capacity);
    int*    lengths = ALLOCATE(int,   capacity);
    
    while ((entry = readdir(dp)) != NULL) {
        if (entry->d_type == DT_DIR) {
            if (strcmp(entry->d_name, ".") != 0 && strcmp(entry->d_name, "..") != 0) {
                if (count + 1 >= capacity) {
                    int newCapacity = GROW_CAPACITY(capacity);
                    array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
                    lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
                    capacity = newCapacity;
                }

                lengths[count] = strlen(entry->d_name);
                char* sub = ALLOCATE(char, lengths[count] + 1);
                memcpy(sub, entry->d_name, lengths[count]);
                sub[lengths[count]] = '\0';
                array[count] = sub;
                count++;
            }
        }
    }

    ObjArray* arr = newArray(count);
    push(OBJ_VAL(arr));
    for (int i = 0; i < count; i++) {
        arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
        FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
    }
    arr->size = count;

    *result = peek(0);
    pop();

    FREE_ARRAY(char*,  array,   capacity);
    FREE_ARRAY(int,    lengths, capacity);

    closedir(dp);

    return true;
#endif
}

static bool listFilesNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("listFiles() expects no arguments.", 33));
        return false;
    }
#endif

#ifdef _WIN32

    // TEMPORARY STUB
    *result = BOOL_VAL(true);
    return true;
#else
    struct dirent *entry;
    DIR *dp = opendir("."); // Open current directory

    if (dp == NULL) {
        *result = OBJ_VAL(copyString("Could not open current directory.", 33));
        return false;
    }

    int capacity = 8;
    int count    = 0;
    char**  array   = ALLOCATE(char*, capacity);
    int*    lengths = ALLOCATE(int,   capacity);
    
    while ((entry = readdir(dp)) != NULL) {
        if (entry->d_type != DT_DIR) {
            if (strcmp(entry->d_name, ".") != 0 && strcmp(entry->d_name, "..") != 0) {
                if (count + 1 >= capacity) {
                    int newCapacity = GROW_CAPACITY(capacity);
                    array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
                    lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
                    capacity = newCapacity;
                }

                lengths[count] = strlen(entry->d_name);
                char* sub = ALLOCATE(char, lengths[count] + 1);
                memcpy(sub, entry->d_name, lengths[count]);
                sub[lengths[count]] = '\0';
                array[count] = sub;
                count++;
            }
        }
    }

    ObjArray* arr = newArray(count);
    push(OBJ_VAL(arr));
    for (int i = 0; i < count; i++) {
        arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
        FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
    }
    arr->size = count;

    *result = peek(0);
    pop();

    FREE_ARRAY(char*,  array,   capacity);
    FREE_ARRAY(int,    lengths, capacity);

    closedir(dp);

    return true;
#endif
}

static bool fileExistsNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("fileExists() expects one string argument.", 41));
        return false;
    }
#endif

    FILE* file = fopen(AS_CSTRING(args[0]), "r");
    if (file != NULL) {
        fclose(file);
        *result = BOOL_VAL(true);
    } else {
        *result = BOOL_VAL(false);
    }
    return true;
}

static bool makeDirNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("makeDir() expects one string argument.", 38));
        return false;
    }
#endif

#ifdef _WIN32
    int res = _mkdir(AS_CSTRING(args[0]));
#else
    int res = mkdir(AS_CSTRING(args[0]), 0755);
#endif

    if (res == 0) {
        *result = BOOL_VAL(true);
        return true;
    } else {
        *result = OBJ_VAL(copyString("makeDir() failed to create directory.", 37));
        return false;
    }
}

static bool removeDirNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("removeDir() takes one string argument.", 38));
        return false;
    }
#endif

#ifdef _WIN32
    int res = _rmdir(AS_CSTRING(args[0]));
#else
    int res = rmdir(AS_CSTRING(args[0]));
#endif

    if (res == 0) {
        *result = BOOL_VAL(true);
        return true;
    } else {
        *result = OBJ_VAL(copyString("removeDir() failed to remove directory. Are there still files there?", 68));
        return false;
    }
}

static bool createFileNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("createFile() expects one string argument.", 41));
        return false;
    }
#endif

    FILE* file = fopen(AS_CSTRING(args[0]), "wx");
    if (file == NULL) {
        *result = OBJ_VAL(copyString("createFile() failed — file may already exist.", 45));
        return false;
    }
    fclose(file);
    *result = BOOL_VAL(true);
    return true;
}

static bool removeFileNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("removeFile() expects one string argument.", 41));
        return false;
    }
#endif

    if (remove(AS_CSTRING(args[0])) == 0) {
        *result = BOOL_VAL(true);
        return true;
    } else {
        *result = OBJ_VAL(copyString("removeFile() failed to remove file.", 35));
        return false;
    }
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

ObjModule* buildIOModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "getNumber", 9, getNumberNative);
    addNative(module, "getString", 9, getStringNative);
    addNative(module, "readLine",  8, readLineNative);
    addNative(module, "flush",     5, flushNative);

    addNative(module, "readFile",    8, readFileNative);
    addNative(module, "writeFile",   9, writeFileNative);
    addNative(module, "appendFile", 10, appendFileNative);
    addNative(module, "currentDir", 10, currentDirNative);
    addNative(module, "changeDir",   9, chdirNative);
    addNative(module, "listDir",     7, listDirNative);
    addNative(module, "listFiles",   9, listFilesNative);
    addNative(module, "fileExists", 10, fileExistsNative);
    addNative(module, "makeDir",     7, makeDirNative);
    addNative(module, "removeDir",   9, removeDirNative);
    addNative(module, "createFile", 10, createFileNative);
    addNative(module, "removeFile", 10, removeFileNative);

    pop();
    return module;
}