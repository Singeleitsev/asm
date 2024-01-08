#include <windows.h>
#include "shared.h"
#include "matrix.h"

MATRIX::MATRIX()
{
    LoadIdentity();
}

MATRIX::~MATRIX()
{
}

void MATRIX::LoadIdentity()
{
    Element[0]=1.0f;
        Element[1]=0.0f;
        Element[2]=0.0f;
        Element[3]=0.0f;

        Element[4]=0.0f;
        Element[5]=1.0f;
        Element[6]=0.0f;
        Element[7]=0.0f;

        Element[8]=0.0f;
        Element[9]=0.0f;
        Element[10]=1.0f;
        Element[11]=0.0f;

        Element[12]=0.0f;
        Element[13]=0.0f;
        Element[14]=0.0f;
        Element[15]=1.0f;
}

void MATRIX::CopyMatrix(float m[16])
{
        Element[0 ] = m[0 ];
        Element[1 ] = m[1 ];
        Element[2 ] = m[2 ];
        Element[3 ] = m[3 ];
        Element[4 ] = m[4 ];
        Element[5 ] = m[5 ];
        Element[6 ] = m[6 ];
        Element[7 ] = m[7 ];
        Element[8 ] = m[8 ];
        Element[9 ] = m[9 ];
        Element[10] = m[10];
        Element[11] = m[11];
        Element[12] = m[12];
        Element[13] = m[13];
        Element[14] = m[14];
        Element[15] = m[15];
}

void MATRIX::MultMatrix(float m[])
{
        MATRIX temp;

        temp.CopyMatrix(this->Element);

      Element[0] = temp.Element[0 ]*m[0 ]
            + temp.Element[4 ]*m[1 ]
            + temp.Element[8 ]*m[2 ]
            + temp.Element[12]*m[3 ];

      Element[1] = temp.Element[1 ]*m[0 ]
            + temp.Element[5 ]*m[1 ]
            + temp.Element[9 ]*m[2 ]
            + temp.Element[13]*m[3 ];

      Element[2] = temp.Element[2 ]*m[0 ]
               + temp.Element[6 ]*m[1 ]
               + temp.Element[10]*m[2 ]
               + temp.Element[14]*m[3 ];

    Element[3] = temp.Element[3 ]*m[0 ]
               + temp.Element[7 ]*m[1 ]
               + temp.Element[11]*m[2 ]
               + temp.Element[15]*m[3 ];

      Element[4] = temp.Element[0 ]*m[4 ]
               + temp.Element[4 ]*m[5 ]
               + temp.Element[8 ]*m[6 ]
               + temp.Element[12]*m[7 ];

      Element[5] = temp.Element[1 ]*m[4 ]
               + temp.Element[5 ]*m[5 ]
               + temp.Element[9 ]*m[6 ]
               + temp.Element[13]*m[7 ];

      Element[6] = temp.Element[2 ]*m[4 ]
               + temp.Element[6 ]*m[5 ]
               + temp.Element[10]*m[6 ]
               + temp.Element[14]*m[7 ];

      Element[7] = temp.Element[3 ]*m[4 ]
               + temp.Element[7 ]*m[5 ]
               + temp.Element[11]*m[6 ]
               + temp.Element[15]*m[7 ];

      Element[8] = temp.Element[0 ]*m[8 ]
               + temp.Element[4 ]*m[9 ]
               + temp.Element[8 ]*m[10]
               + temp.Element[12]*m[11];

      Element[9] = temp.Element[1 ]*m[8 ]
               + temp.Element[5 ]*m[9 ]
               + temp.Element[9 ]*m[10]
               + temp.Element[13]*m[11];

      Element[10]= temp.Element[2 ]*m[8 ]
               + temp.Element[6 ]*m[9 ]
               + temp.Element[10]*m[10]
               + temp.Element[14]*m[11];

      Element[11]= temp.Element[3 ]*m[8 ]
               + temp.Element[7 ]*m[9 ]
               + temp.Element[11]*m[10]
               + temp.Element[15]*m[11];

      Element[12]= temp.Element[0 ]*m[12]
               + temp.Element[4 ]*m[13]
               + temp.Element[8 ]*m[14]
               + temp.Element[12]*m[15];

      Element[13]= temp.Element[1 ]*m[12]
               + temp.Element[5 ]*m[13]
               + temp.Element[9 ]*m[14]
               + temp.Element[13]*m[15];

      Element[14]= temp.Element[2 ]*m[12]
               + temp.Element[6 ]*m[13]
               + temp.Element[10]*m[14]
               + temp.Element[14]*m[15];

      Element[15]= temp.Element[3 ]*m[12]
               + temp.Element[7 ]*m[13]
               + temp.Element[11]*m[14]
               + temp.Element[15]*m[15];
}

void MATRIX::MatrixInverse()
 {
      MATRIX temp;

      temp.CopyMatrix(this->Element);

      Element[0 ] = temp.Element[0 ];
      Element[1 ] = temp.Element[4 ];
      Element[2 ] = temp.Element[8 ];

      Element[4 ] = temp.Element[1 ];
      Element[5 ] = temp.Element[5 ];
      Element[6 ] = temp.Element[9 ];

      Element[8 ] = temp.Element[2 ];
      Element[9 ] = temp.Element[6 ];
      Element[10] = temp.Element[10];

      Element[12] *= -1.0f;
      Element[13] *= -1.0f;
      Element[14] *= -1.0f;
}

void MATRIX::MatrixFromAxisAngle(VECTOR axis, float theta)
{
        QUAT q;
        float halfTheta = theta * 0.5;
        float cosHalfTheta = cos(halfTheta);
        float sinHalfTheta = sin(halfTheta);
        float xs, ys, zs, wx, wy, wz, xx, xy, xz, yy, yz, zz;
        q.x = axis.x * sinHalfTheta;
        q.y = axis.y * sinHalfTheta;
        q.z = axis.z * sinHalfTheta;
        q.w = cosHalfTheta;
        xs = q.x * 2;  ys = q.y * 2;  zs = q.z * 2;
        wx = q.w * xs; wy = q.w * ys; wz = q.w * zs;
        xx = q.x * xs; xy = q.x * ys; xz = q.x * zs;
        yy = q.y * ys; yz = q.y * zs; zz = q.z * zs;
        Element[0] = 1 - (yy + zz);
        Element[1] = xy - wz;
        Element[2] = xz + wy;
        Element[4] = xy + wz;
        Element[5] = 1 - (xx + zz);
        Element[6] = yz - wx;
        Element[8] = xz - wy;
        Element[9] = yz + wx;
        Element[10] = 1 - (xx + yy);
        Element[12] = Element[13] = Element[14] = Element[3] = Element[7] = Element[11] = 0;
        Element[15] = 1;
}

void MATRIX::QuatToMatrix(QUAT quat)
{
      float wx, wy, wz, xx, yy, yz, xy, xz, zz, x2, y2, z2;
      // calculate coefficients
      x2 = quat.x + quat.x;
      y2 = quat.y + quat.y;
      z2 = quat.z + quat.z;
      xx = quat.x * x2;
      xy = quat.x * y2;
      xz = quat.x * z2;
      yy = quat.y * y2;
      yz = quat.y * z2;
      zz = quat.z * z2;
      wx = quat.w * x2;
      wy = quat.w * y2;
      wz = quat.w * z2;
      Element[0] = 1.0 - (yy + zz);
      Element[1] = xy - wz;
      Element[2] = xz + wy;
      Element[3] = 0.0;
      Element[4] = xy + wz;
      Element[5] = 1.0 - (xx + zz);
      Element[6] = yz - wx;
      Element[7] = 0.0;
      Element[8] = xz - wy;
      Element[9] = yz + wx;
      Element[10] = 1.0 - (xx + yy);
      Element[11] = 0.0;
      Element[12] = 0;
      Element[13] = 0;
      Element[14] = 0;
      Element[15] = 1;
}
