#ifndef GENERAL_H
#define GENERAL_H

#include "shared.h"
#include "polygon.h"
#include "texture.h"
#include "camera.h"
#include "locmath.h"

bool LoadTGA(TEXTURE *texture, char *filename);                           
void SetGLProperties();
void SetGLView(int Width, int Height);
void SetGLMaterial();

#endif //GENERAL_H
