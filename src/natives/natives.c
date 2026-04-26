#include <stdlib.h>

#include "natives.h"
#include "../vm.h"

#include "btime.h"
#include "bmath.h"
#include "bio.h"

static bool exitNative(int argCount, Value* args, Value* result) {
    exit(args[0].as.number);
}

void defineAllNatives() {
    defineModule("time", buildTimeModule());
    defineModule("math", buildMathModule());
    defineModule("io", buildIOModule());

    defineNative("exit", newNative(exitNative));
}