#include <stdlib.h>
#include <string.h>

#include "natives.h"
#include "../vm.h"

#include "bcast.h"
#include "bgraphics.h"
#include "bio.h"
#include "bmath.h"
#include "bstring.h"
#include "btime.h"

static bool exitNative(int argCount, Value* args, Value* result) {
    exit(AS_NUMBER(args[0]));
}

bool importModule(ObjString* name) {
    if (strcmp(name->chars, "cast") == 0) {
        defineModule("cast", buildCastModule());
        return true;
    } else if (strcmp(name->chars, "io") == 0) {
        defineModule("io", buildIOModule());
        return true;
    } else if (strcmp(name->chars, "math") == 0) {
        defineModule("math", buildMathModule());
        return true;
    } else if (strcmp(name->chars, "str") == 0) {
        defineModule("str", buildStringModule());
        return true;
    } else if (strcmp(name->chars, "time") == 0) {
        defineModule("time", buildTimeModule());
        return true;
    } else if (strcmp(name->chars, "graphics") == 0) {
        defineModule("graphics", buildGraphicsModules()[0]);
        return true;
    } else if (strcmp(name->chars, "game") == 0) {
        defineModule("game", buildGraphicsModules()[1]);
        return true;
    }
    return false;
}

void defineAllNatives() {
    // defineModule("cast", buildCastModule());
    // defineModule("io", buildIOModule());
    // defineModule("math", buildMathModule());
    // defineModule("str", buildStringModule());
    // defineModule("time", buildTimeModule());

    // ObjModule** gmodules = buildGraphicsModules();

    // defineModule("game", gmodules[1]);
    // defineModule("graphics", gmodules[0]);

    defineNative("exit", newNative(exitNative));
}