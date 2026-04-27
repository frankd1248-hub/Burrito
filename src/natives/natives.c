#include <stdlib.h>

#include "natives.h"
#include "../vm.h"

#include "btime.h"
#include "bmath.h"
#include "bio.h"
#include "bgraphics.h"
#include "bcast.h"

static bool exitNative(int argCount, Value* args, Value* result) {
    exit(args[0].as.number);
}

void defineAllNatives() {
    defineModule("time", buildTimeModule());
    defineModule("math", buildMathModule());
    defineModule("io", buildIOModule());
    defineModule("cast", buildCastModule());

    ObjModule** gmodules = buildGraphicsModules();

    defineModule("game", gmodules[1]);
    defineModule("graphics", gmodules[0]);

    defineNative("exit", newNative(exitNative));
}