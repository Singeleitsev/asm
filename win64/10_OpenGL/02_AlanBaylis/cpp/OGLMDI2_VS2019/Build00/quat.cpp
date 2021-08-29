#include <windows.h>
#include "shared.h"
#include "quat.h"
#include "vector.h"

QUAT::QUAT(float sx, float sy, float sz, float sw)
:
    x(sx),
    y(sy),
    z(sz),
        w(sw)
{
}

QUAT::~QUAT()
{
}

void QUAT::Set()
{
    x = 0.0;
    y = 0.0;
    z = 0.0;
    w = 1.0;
}

void QUAT::CopyQuat(QUAT q)
{
    x = q.x;
    y = q.y;
    z = q.z;
    w = q.w;
}

void QUAT::AxisAngleToQuat(VECTOR axis, float theta)
{
        float halfTheta = theta * 0.5;
        float cosHalfTheta = cos(halfTheta);
        float sinHalfTheta = sin(halfTheta);
        x = axis.x * sinHalfTheta;
        y = axis.y * sinHalfTheta;
        z = axis.z * sinHalfTheta;
        w = cosHalfTheta;
}

void QUAT::EulerToQuat(float roll, float pitch, float yaw)
{
        float cr, cp, cy, sr, sp, sy, cpcy, spsy;  // calculate trig identities
        cr = cos(roll/2);
        cp = cos(pitch/2);
        cy = cos(yaw/2);
        sr = sin(roll/2);
        sp = sin(pitch/2);
        sy = sin(yaw/2);
        cpcy = cp * cy;
        spsy = sp * sy;
        w = cr * cpcy + sr * spsy;
        x = sr * cpcy - cr * spsy;
        y = cr * sp * cy + sr * cp * sy;
        z = cr * cp * sy - sr * sp * cy;
}

float QUAT::MagnitudeQuat()
{
      return( sqrt(w*w+x*x+y*y+z*z));
}

void QUAT::NormaliseQuat()
{
      float Mag;
      Mag = MagnitudeQuat();
      w = w/Mag;
      x = x/Mag;
      y = y/Mag;
      z = z/Mag;
}

void QUAT::MultQuat(QUAT q)
{
      QUAT q3;
      VECTOR vectorq1;
      VECTOR vectorq2;
      vectorq1.x = x;
      vectorq1.y = y;
      vectorq1.z = z;
      vectorq2.x = q.x;
      vectorq2.y = q.y;
      vectorq2.z = q.z;

      VECTOR tempvec1;
      VECTOR tempvec2;
      VECTOR tempvec3;
      tempvec1 = vectorq1;
      q3.w = (w*q.w) - tempvec1.DotProduct(vectorq2);
      tempvec1.CrossProduct(vectorq2);
      tempvec2.x = w * q.x;
      tempvec2.y = w * q.y;
      tempvec2.z = w * q.z;
      tempvec3.x = q.w * x;
      tempvec3.y = q.w * y;
      tempvec3.z = q.w * z;
      q3.x = tempvec1.x + tempvec2.x + tempvec3.x;
      q3.y = tempvec1.y + tempvec2.y + tempvec3.y;
      q3.z = tempvec1.z + tempvec2.z + tempvec3.z;
      CopyQuat(q3);
}
