// QUAT Class    by Alan Baylis 2001

#ifndef QuatH
#define QuatH

#include "vector.h"
#include "quat.h"

class QUAT
{
    public:
          QUAT(float sx = 0, float sy = 0, float sz = 0, float sw = 1);
          ~QUAT();

        void Set();
        void CopyQuat(QUAT q);
                void Set(float sx, float sy, float sz, float sw) {x = sx, y = sy, z = sz, w = sw;}
                void AxisAngleToQuat(VECTOR axis, float theta);
          void EulerToQuat(float pitch, float yaw, float roll);
                void NormaliseQuat();
                float MagnitudeQuat();
                void MultQuat(QUAT q);

                float x;
            float y;
            float z;
            float w;
};


#endif

