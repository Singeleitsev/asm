// Vertex Class    by Alan Baylis 2001

#ifndef VertexH
#define VertexH

class VERTEX
{
    public:
        VERTEX(float x = 0, float y = 0, float z = 0, float nx = 0, float ny = 0, float nz = 0);
        ~VERTEX();

        int numVertices;
        float x;
        float y;
        float z;
        float nx;
        float ny;
        float nz;
        float u;
        float v;
};

#endif

