#include <windows.h>
#include "vertex.h"



VERTEX::VERTEX(float sx, float sy, float sz, float snx, float sny, float snz)
:
    x(sx),
    y(sy),
    z(sz),
    nx(snx),
    ny(sny),
    nz(snz),
    numVertices(3)
{
}

VERTEX::~VERTEX()
{
}

