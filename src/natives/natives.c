#include <stdlib.h>

#include "natives.h"
#include "../vm.h"

#include "bcast.h"
#include "bgraphics.h"
#include "bio.h"
#include "bmath.h"
#include "bstring.h"
#include "btime.h"

static bool exitNative(int argCount, Value* args, Value* result) {
    exit(args[0].as.number);
}

void defineAllNatives() {
    defineModule("cast", buildCastModule());
    defineModule("io", buildIOModule());
    defineModule("math", buildMathModule());
    defineModule("str", buildStringModule());
    defineModule("time", buildTimeModule());

    ObjModule** gmodules = buildGraphicsModules();

    defineModule("game", gmodules[1]);
    defineModule("graphics", gmodules[0]);

    defineNative("exit", newNative(exitNative));
}