#include <raylib.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "bgraphics.h"
#include "../vm.h"

static bool gInitNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
        *result = OBJ_VAL(copyString("init() requires three arguments: width, height, and title.", 58));
        return false;
    }
#endif

    InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
    *result = BOOL_VAL(true);
    return true;
}

static bool gCloseWindowNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("closeWindow() expects no arguments.", 35));
        return false;
    }
#endif

    CloseWindow();
    *result = BOOL_VAL(true);
    return true;
}

static bool gWindowShouldCloseNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("shouldCloseWindow() expects no arguments.", 41));
        return false;
    }
#endif

    *result = BOOL_VAL(WindowShouldClose());
    return true;
}

static bool gBeginDrawNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("beginDraw() expects no arguments.", 33));
        return false;
    }
#endif

    BeginDrawing();
    *result = BOOL_VAL(true);
    return true;
}

static bool gEndDrawNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("endDraw() expects no arguments.", 33));
        return false;
    }
#endif

    EndDrawing();
    *result = BOOL_VAL(true);
    return true;
}

static bool gClearColorNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
        *result = OBJ_VAL(copyString("clearColor() expects three number arguments.", 44));
        return false;
    }
#endif

    Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
    ClearBackground(color);
    *result = BOOL_VAL(true);
    return true;
}

static bool gTargetFPSNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("targetFPS() expects one number argument.", 40));
        return false;
    }
#endif

    SetTargetFPS((int) AS_NUMBER(args[0]));
    *result = BOOL_VAL(true);
    return true;
}

static bool getDeltaTimeNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("getDeltaTime() does not expect arguments.", 41));
        return false;
    }
#endif

    *result = NUMBER_VAL((double) GetFrameTime());
    return true;
}

static bool gIsKeyDownNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_NUMBER(args[0])) {
        *result = OBJ_VAL(copyString("isKeyDown() expects one number argument; key code.", 50));
        return false;
    }
#endif

    *result = BOOL_VAL(IsKeyDown((int) round(AS_NUMBER(args[0]))));
    return true;
}

static bool gDrawRectNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
        *result = OBJ_VAL(copyString("drawRect() expects seven number arguments.", 41));
        return false;
    }
#endif

    Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
    DrawRectangle(
        (int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
        (int) AS_NUMBER(args[5]), (int) AS_NUMBER(args[6]),
        color
    );
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawTextNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
        *result = OBJ_VAL(copyString("drawText() expects seven arguments: one string and six numbers.", 63));
        return false;
    }
#endif

    Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
    DrawText(
        AS_CSTRING(args[0]), (int) AS_NUMBER(args[4]), 
        (int) AS_NUMBER(args[5]), (int) AS_NUMBER(args[6]), color
    );
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawCircleNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
        *result = OBJ_VAL(copyString("drawCircle() expects six number arguments.", 41));
        return false;
    }
#endif

    Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
    DrawCircle(
        (int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
        (float) AS_NUMBER(args[5]), color
    );
    *result = BOOL_VAL(true);
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
}

static void addConst(ObjModule* module, const char* name, int length, double value) {
    tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
}

#define ADD_KEY(name) addConst(gamodule, (#name), strlen(#name), (name))

static void addKeys(ObjModule*);

ObjModule** buildGraphicsModules() {
    ObjModule** modules = malloc(sizeof(ObjModule*) * 2);

    ObjModule* grmodule = newModule();
    push(OBJ_VAL(grmodule));

    addNative(grmodule, "init", 4, gInitNative);
    addNative(grmodule, "closeWindow", 11, gCloseWindowNative);
    addNative(grmodule, "windowShouldClose", 17, gWindowShouldCloseNative);
    addNative(grmodule, "beginDraw", 9, gBeginDrawNative);
    addNative(grmodule, "endDraw", 7, gEndDrawNative);
    addNative(grmodule, "clearColor", 10, gClearColorNative);
    addNative(grmodule, "targetFPS", 9, gTargetFPSNative);
    addNative(grmodule, "getDeltaTime", 12, getDeltaTimeNative);
    addNative(grmodule, "isKeyDown", 9, gIsKeyDownNative);
    addNative(grmodule, "drawRect", 8, gDrawRectNative);
    addNative(grmodule, "drawText", 8, gDrawTextNative);
    addNative(grmodule, "drawCircle", 10, gDrawCircleNative);

    modules[0] = grmodule;

    ObjModule* gamodule = newModule();
    push(OBJ_VAL(gamodule));

    addKeys(gamodule);

    modules[1] = gamodule;

    pop();
    pop();
    return modules;
}

/**
 * US Keyboard excluding numpad
 */
static void addKeys(ObjModule* gamodule) {
    ADD_KEY(KEY_A);
    ADD_KEY(KEY_B);
    ADD_KEY(KEY_C);
    ADD_KEY(KEY_D);
    ADD_KEY(KEY_E);
    ADD_KEY(KEY_F);
    ADD_KEY(KEY_G);
    ADD_KEY(KEY_H);
    ADD_KEY(KEY_I);
    ADD_KEY(KEY_J);
    ADD_KEY(KEY_K);
    ADD_KEY(KEY_L);
    ADD_KEY(KEY_M);
    ADD_KEY(KEY_N);
    ADD_KEY(KEY_O);
    ADD_KEY(KEY_P);
    ADD_KEY(KEY_Q);
    ADD_KEY(KEY_R);
    ADD_KEY(KEY_S);
    ADD_KEY(KEY_T);
    ADD_KEY(KEY_U);
    ADD_KEY(KEY_V);
    ADD_KEY(KEY_W);
    ADD_KEY(KEY_X);
    ADD_KEY(KEY_Y);
    ADD_KEY(KEY_Z);

    ADD_KEY(KEY_ZERO);
    ADD_KEY(KEY_ONE);
    ADD_KEY(KEY_TWO);
    ADD_KEY(KEY_THREE);
    ADD_KEY(KEY_FOUR);
    ADD_KEY(KEY_FIVE);
    ADD_KEY(KEY_SIX);
    ADD_KEY(KEY_SEVEN);
    ADD_KEY(KEY_EIGHT);
    ADD_KEY(KEY_NINE);

    ADD_KEY(KEY_F1);
    ADD_KEY(KEY_F2);
    ADD_KEY(KEY_F3);
    ADD_KEY(KEY_F4);
    ADD_KEY(KEY_F5);
    ADD_KEY(KEY_F6);
    ADD_KEY(KEY_F7);
    ADD_KEY(KEY_F8);
    ADD_KEY(KEY_F9);
    ADD_KEY(KEY_F10);
    ADD_KEY(KEY_F11);
    ADD_KEY(KEY_F12);

    ADD_KEY(KEY_SPACE);
    ADD_KEY(KEY_ENTER);
    ADD_KEY(KEY_ESCAPE);
    ADD_KEY(KEY_TAB);
    ADD_KEY(KEY_BACKSPACE);
    ADD_KEY(KEY_INSERT);
    ADD_KEY(KEY_DELETE);
    ADD_KEY(KEY_HOME);
    ADD_KEY(KEY_END);
    ADD_KEY(KEY_PAGE_UP);
    ADD_KEY(KEY_PAGE_DOWN);
    ADD_KEY(KEY_CAPS_LOCK);

    ADD_KEY(KEY_UP);
    ADD_KEY(KEY_DOWN);
    ADD_KEY(KEY_LEFT);
    ADD_KEY(KEY_RIGHT);

    ADD_KEY(KEY_LEFT_SHIFT);
    ADD_KEY(KEY_RIGHT_SHIFT);

    ADD_KEY(KEY_LEFT_CONTROL);
    ADD_KEY(KEY_RIGHT_CONTROL);

    ADD_KEY(KEY_LEFT_ALT);
    ADD_KEY(KEY_RIGHT_ALT);

    ADD_KEY(KEY_LEFT_SUPER);
    ADD_KEY(KEY_RIGHT_SUPER);

    ADD_KEY(KEY_APOSTROPHE);   // '
    ADD_KEY(KEY_COMMA);        // ,
    ADD_KEY(KEY_MINUS);        // -
    ADD_KEY(KEY_PERIOD);       // .
    ADD_KEY(KEY_SLASH);        // /

    ADD_KEY(KEY_SEMICOLON);    // ;
    ADD_KEY(KEY_EQUAL);        // =
    ADD_KEY(KEY_LEFT_BRACKET); // [
    ADD_KEY(KEY_BACKSLASH);    // (\)
    ADD_KEY(KEY_RIGHT_BRACKET);// ]
    ADD_KEY(KEY_GRAVE);        // `

    ADD_KEY(KEY_INSERT);
    ADD_KEY(KEY_DELETE);
    ADD_KEY(KEY_HOME);
    ADD_KEY(KEY_END);
    ADD_KEY(KEY_PAGE_UP);
    ADD_KEY(KEY_PAGE_DOWN);
}