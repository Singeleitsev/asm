// Polygon Class    by Alan Baylis 2001

#ifndef PolygonH
#define PolygonH

#include "general.h"
#include "vertex.h"
#include "texture.h"
#include "vector.h"

class CAMERA;

class POLYGON
{
    public:
        POLYGON();
          ~POLYGON();

                VECTOR GetNormal();
                void SetNormal();
                VECTOR GetMidPoint();
                bool CheckForCollision(CAMERA* pLastCam, CAMERA* pCam);

          TEXTURE Texture;
          VERTEX Vertex[3];
};

#endif
