#ifndef burrito_time_h
#define burrito_time_h


#ifdef _WIN32
    #include <windows.h>
    #define SLEEP(mseconds) Sleep(useconds)
#else
    #include <math.h>
    #include <stdint.h>
    #include <time.h>

static inline void _sleep(double milliseconds) {
    struct timespec req = {
        (time_t) (milliseconds / 1000), 
        (time_t) (fmod(milliseconds, 1000.0) * 1000000)
    };
    struct timespec rem;

    while (nanosleep(&req, &rem) == -1) {
        req = rem;
    }
}

    #define SLEEP(mseconds) _sleep(mseconds);
#endif

#include "../object.h"
#include "nativeFlags.h"

ObjModule* buildTimeModule();

#endif