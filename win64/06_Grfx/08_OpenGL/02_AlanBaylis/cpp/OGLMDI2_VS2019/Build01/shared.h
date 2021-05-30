#ifndef SHARED_H
#define SHARED_H

#include <iostream>
using namespace std;

#pragma warning( disable : 4244 4305 4267 4800 4101)  // Disable warning messages

#ifdef __cplusplus
extern "C" {
#endif

#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <math.h>
#include <time.h>

#ifdef __cplusplus
}
#endif

#define BUFFER_SIZE 256

#endif //SHARED_H
