#include <windows.h>
#include "shared.h"
#include "vector.h"

VECTOR::VECTOR(float sx, float sy, float sz)
:
    x(sx),
    y(sy),
    z(sz)
{
}

VECTOR::~VECTOR()
{
}

void VECTOR::Set()
{
    x = 0;
    y = 0;
    z = 0;
}

float VECTOR::MagnitudeVector()
{
  return(sqrt(x*x+y*y+z*z));
}

VECTOR VECTOR::NormaliseVector()
{
  VECTOR vec;
  float temp = MagnitudeVector();
  vec.x = x / temp;
  vec.y = y / temp;
  vec.z = z / temp;
  return vec;
}

float VECTOR::DotProduct(VECTOR vect)
{
      float dot;
      dot = vect.x * x + vect.y * y + vect.z * z;
      return dot;
}

VECTOR VECTOR::CrossProduct(VECTOR vect)
{
      VECTOR temp = *this;
      x = vect.y * temp.z - vect.z * temp.y;
      y = vect.z * temp.x - vect.x * temp.z;
      z = vect.x * temp.y - vect.y * temp.x;
        return temp;
}
