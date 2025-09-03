// Vector Class    by Alan Baylis 2001

#ifndef VectorH
#define VectorH

class VECTOR
{
    public:
           VECTOR(float sx = 0, float sy = 0, float sz = 0);
          ~VECTOR();

        void Set();
          void Set(float sx, float sy, float sz) {x = sx, y = sy, z = sz;}
                float MagnitudeVector();
                VECTOR NormaliseVector();
                VECTOR CrossProduct(VECTOR vect);
                float DotProduct(VECTOR vect);

          float x;
            float y;
            float z;
};

#endif

