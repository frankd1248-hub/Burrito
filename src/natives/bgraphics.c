
#ifdef _WIN32
#include "C:\raylib\w64devkit\include\raylib.h"
#else
#include <raylib.h>
#endif

#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "bgraphics.h"
#include "../vm.h"

static Color readColor(Value arg) {
    Color color = {
        (int) AS_NUMBER(AS_ARRAY(arg)->values[0]),
        (int) AS_NUMBER(AS_ARRAY(arg)->values[1]),
        (int) AS_NUMBER(AS_ARRAY(arg)->values[2]),
        AS_ARRAY(arg)->size >= 4 ? (int) AS_NUMBER(AS_ARRAY(arg)->values[3]) : 255,
    };
    return color;
}

static bool gInitNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
        *result = OBJ_VAL(copyString("init() requires three arguments: width, height, and title.", 58));
        return false;
    }
#endif

    SetTraceLogLevel(LOG_NONE);
    InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
    InitAudioDevice();
    *result = BOOL_VAL(true);
    return true;
}

static bool gPollEventsNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 0) {
        *result = OBJ_VAL(copyString("pollEvents() does not expect arguments.", 39));
        return false;
    }
#endif

    eventQueue.count = 0;

    int buttons[] = { MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT, MOUSE_BUTTON_MIDDLE };
    EventType downTypes[] = { EVENT_MOUSE_DOWN, EVENT_MOUSE_DOWN, EVENT_MOUSE_DOWN };

    for (int i = 0; i < 3; i++) {
        double mx = (double)GetMouseX();
        double my = (double)GetMouseY();
        if (eventQueue.count < EVENT_QUEUE_MAX) {
            if (IsMouseButtonPressed(buttons[i])) {
                eventQueue.events[eventQueue.count++] =
                    (InputEvent){ EVENT_MOUSE_DOWN, i, mx, my };
            }
            if (IsMouseButtonReleased(buttons[i])) {
                eventQueue.events[eventQueue.count++] =
                    (InputEvent){ EVENT_MOUSE_UP, i, mx, my };
            }
        }
    }

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

    freeResources();
    CloseWindow();
    CloseAudioDevice();
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
        *result = OBJ_VAL(copyString("endDraw() expects no arguments.", 31));
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

static bool getEventsNative(int argCount, Value* args, Value* result) {
    ObjArray* outer = newArray(eventQueue.count);
    push(OBJ_VAL(outer));

    for (int i = 0; i < eventQueue.count; i++) {
        InputEvent* e = &eventQueue.events[i];

        ObjArray* ev = newArray(4);
        push(OBJ_VAL(ev));

        ev->values[0] = NUMBER_VAL((double)e->type);
        ev->values[1] = NUMBER_VAL((double)e->button);
        ev->values[2] = NUMBER_VAL(e->x);
        ev->values[3] = NUMBER_VAL(e->y);

        AS_ARRAY(peek(1))->values[i] = OBJ_VAL(ev);

        pop();
    }

    *result = peek(0);
    pop();
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
    if (argCount != 5 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1]) || 
        !IS_NUMBER(args[2]) || !IS_NUMBER(args[3]) || !IS_NUMBER(args[4])) {
        *result = OBJ_VAL(copyString("drawRect() expects one array and four number arguments.", 55));
        return false;
    }
#endif

    Color color = readColor(args[0]);

    DrawRectangle(
        (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 
        (int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]),
        color
    );
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawTextNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 5 || !IS_STRING(args[0]) || !IS_ARRAY(args[1]) || 
        !IS_NUMBER(args[2]) || !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) ) {
        *result = OBJ_VAL(copyString("drawText() expects five arguments: one string, one array, and three numbers.", 76));
        return false;
    }
#endif

    Color color = readColor(args[1]);

    DrawText(
        AS_CSTRING(args[0]), (int) AS_NUMBER(args[2]), 
        (int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), color
    );
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawCircleNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 4 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1]) || 
        !IS_NUMBER(args[2]) || !IS_NUMBER(args[3])) {
        *result = OBJ_VAL(copyString("drawCircle() expects one array and three number arguments.", 58));
        return false;
    }
#endif

    Color color = readColor(args[0]);

    DrawCircle(
        (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 
        (float) AS_NUMBER(args[3]), color
    );
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawLineNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 5 || !IS_ARRAY(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4])) {
        *result = OBJ_VAL(copyString("drawLine() expects one array and four number arguments.", 55));
        return false;
    }
#endif

    Color color = readColor(args[0]);

    DrawLine((int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 
             (int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), color);
    *result = BOOL_VAL(true);
    return true;
}

static bool gDrawTriangleNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 4 || !IS_ARRAY(args[0]) || !IS_ARRAY(args[1]) ||
        !IS_ARRAY(args[2]) || !IS_ARRAY(args[3])) {
        *result = OBJ_VAL(copyString("drawTriangle() takes four array arguments.", 42));
        return false;
    }
#endif

    Color color = readColor(args[0]);

    Vector2 v1 = {
        AS_NUMBER(AS_ARRAY(args[1])->values[0]),
        AS_NUMBER(AS_ARRAY(args[1])->values[1])
    };

    Vector2 v2 = {
        AS_NUMBER(AS_ARRAY(args[2])->values[0]),
        AS_NUMBER(AS_ARRAY(args[2])->values[1])
    };

    Vector2 v3 = {
        AS_NUMBER(AS_ARRAY(args[3])->values[0]),
        AS_NUMBER(AS_ARRAY(args[3])->values[1])
    };

    DrawTriangle(v1, v2, v3, color);
    *result = BOOL_VAL(true);
    return true;
}

static void destroyFont(void* handle) {
    UnloadFont(*(Font*)handle);
    free(handle);
}

static bool gloadFontNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 2 || !IS_STRING(args[0]) || !IS_NUMBER(args[1])) {
        *result = OBJ_VAL(copyString("loadFont() takes one string and one number argument.", 52));
        return false;
    }
#endif

    Font* font = malloc(sizeof(Font));
    *font = LoadFontEx(AS_CSTRING(args[0]), (int)AS_NUMBER(args[1]), NULL, 0);
    *result = OBJ_VAL(newResource(RESOURCE_FONT, font, destroyFont));
    return true;
}

static bool gDrawTextExNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 6 || !IS_RESOURCE(args[0]) || !IS_STRING(args[1]) || !IS_ARRAY(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
        *result = OBJ_VAL(copyString("drawTextEx() expects six arguments: one font, one string, one array, and three numbers", 86));
        return false;
    }
#endif

    if (AS_RESOURCE(args[0])->type != RESOURCE_FONT) {
        *result = OBJ_VAL(copyString("drawTextEx() expects a font.", 28));
        return false;
    }

    Font* font = (Font*) AS_RESOURCE(args[0])->handle;
    Color color = readColor(args[2]);

    DrawTextEx(*font, AS_CSTRING(args[1]),
               (Vector2){ AS_NUMBER(args[3]), AS_NUMBER(args[4]) },
               AS_NUMBER(args[5]), 1.0f, color);

    *result = BOOL_VAL(true);
    return true;
}

static void destroyImage(void* handle) {
    UnloadTexture(*(Texture2D*)handle);
    free(handle);
}

static bool gloadImageNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("loadImage() takes one string argument.", 38));
        return false;
    }
#endif

    Image image = LoadImage(AS_CSTRING(args[0]));
    Texture2D* texture = malloc(sizeof(Texture2D));
    *texture = LoadTextureFromImage(image);
    UnloadImage(image);
    *result = OBJ_VAL(newResource(RESOURCE_IMAGE, texture, destroyImage));
    return true;
}

static bool gDrawImageNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 6 || !IS_RESOURCE(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
        !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
        *result = OBJ_VAL(copyString("drawTextEx() expects six arguments: one image and five numbers", 62));
        return false;
    }
#endif

    if (AS_RESOURCE(args[0])->type != RESOURCE_IMAGE) {
        *result = OBJ_VAL(copyString("drawImage() expects an image.", 29));
        return false;
    }

    Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
    DrawTexture(*((Texture2D*) AS_RESOURCE(args[0])->handle), 
                (int) AS_NUMBER(args[4]), (int) AS_NUMBER(args[5]), color);
    *result = BOOL_VAL(true);
    return true;
}

static void destroySound(void* sound) {
    UnloadSound(*(Sound*) sound);
    free(sound);
}

static bool gloadSoundNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("loadSound() takes one string argument.", 38));
        return false;
    }
#endif

    Sound* sound = malloc(sizeof(Sound));
    *sound = LoadSound(AS_CSTRING(args[0]));
    *result = OBJ_VAL(newResource(RESOURCE_SOUND, sound, destroySound));
    return true;
}

static bool gPlaySoundNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_RESOURCE(args[0])) {
        *result = OBJ_VAL(copyString("playSound() requires a resource argument.", 41));
        return false;
    }
#endif

    if (AS_RESOURCE(args[0])->type != RESOURCE_SOUND) {
        *result = OBJ_VAL(copyString("playSound() requires a Sound argument.", 38));
        return false;
    }

    PlaySound(*(Sound*) AS_RESOURCE(args[0])->handle);
    *result = BOOL_VAL(true);
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

static void addConst(ObjModule* module, const char* name, int length, double value) {
    tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
}

#define ADD_KEY(name) addConst(gamodule, (#name), strlen(#name), (name))

static void addKeys(ObjModule*);
static void addButtons(ObjModule*);

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

    addNative(grmodule, "drawRect", 8, gDrawRectNative);
    addNative(grmodule, "drawText", 8, gDrawTextNative);
    addNative(grmodule, "drawLine", 8, gDrawLineNative);
    addNative(grmodule, "drawCircle", 10, gDrawCircleNative);
    addNative(grmodule, "drawTriangle", 12, gDrawTriangleNative);

    addNative(grmodule, "loadImage", 9, gloadImageNative);
    addNative(grmodule, "drawImage", 9, gDrawImageNative);
    addNative(grmodule, "loadFont", 8, gloadFontNative);
    addNative(grmodule, "drawTextEx", 10, gDrawTextExNative);
    addNative(grmodule, "loadSound", 9, gloadSoundNative);
    addNative(grmodule, "playSound", 9, gPlaySoundNative);
    
    modules[0] = grmodule;

    ObjModule* gamodule = newModule();
    push(OBJ_VAL(gamodule));

    addNative(gamodule, "pollEvents", 10, gPollEventsNative);
    addNative(gamodule, "getEvents", 9, getEventsNative);
    addNative(gamodule, "isKeyDown", 9, gIsKeyDownNative);
    addKeys(gamodule);
    addButtons(gamodule);

    modules[1] = gamodule;

    pop();
    pop();
    return modules;
}

static void addButtons(ObjModule* gamodule) {
    addConst(gamodule, "MOUSE_DOWN",   10, (double)EVENT_MOUSE_DOWN);
    addConst(gamodule, "MOUSE_UP",     8,  (double)EVENT_MOUSE_UP);
    addConst(gamodule, "MOUSE_LEFT",   10, 0);
    addConst(gamodule, "MOUSE_RIGHT",  11, 1);
    addConst(gamodule, "MOUSE_MIDDLE", 12, 2);
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