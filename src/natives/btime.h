#ifndef burrito_time_h
#define burrito_time_h

#ifdef _WIN32
    #include <windows.h>
    #define SLEEP(useconds) Sleep((useconds) / 1000)
#else
    #include <unistd.h>
    #define SLEEP(useconds) usleep(useconds)
#endif

#include "../object.h"

ObjModule* buildTimeModule();

#endif