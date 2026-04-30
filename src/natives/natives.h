#ifndef burrito_natives_h
#define burrito_natives_h

#include <stdbool.h>
#include "../object.h"

void defineAllNatives();
bool importModule(ObjString* name);

#endif