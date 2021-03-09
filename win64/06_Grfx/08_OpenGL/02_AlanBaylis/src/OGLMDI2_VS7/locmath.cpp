#include <windows.h>
#include "shared.h"
#include "locmath.h"
#include "vector.h"
#include "quat.h"
#include "vertex.h"


void LoadIdentity(float m[])
{
        m[0]=1.0f;
        m[1]=0.0f;
        m[2]=0.0f;
        m[3]=0.0f;

        m[4]=0.0f;
        m[5]=1.0f;
        m[6]=0.0f;
        m[7]=0.0f;

        m[8]=0.0f;
        m[9]=0.0f;
        m[10]=1.0f;
        m[11]=0.0f;

        m[12]=0.0f;
        m[13]=0.0f;
        m[14]=0.0f;
        m[15]=1.0f;
}

void CopyMatrix(float m[], float n[])
{
        m[0 ] = n[0 ];
        m[1 ] = n[1 ];
        m[2 ] = n[2 ];
        m[3 ] = n[3 ];
        m[4 ] = n[4 ];
        m[5 ] = n[5 ];
        m[6 ] = n[6 ];
        m[7 ] = n[7 ];
        m[8 ] = n[8 ];
        m[9 ] = n[9 ];
        m[10] = n[10];
        m[11] = n[11];
        m[12] = n[12];
        m[13] = n[13];
        m[14] = n[14];
        m[15] = n[15];
}

void MultMatrix(float m[], float n[])
{
        float temp[16];

        CopyMatrix(temp, m);
      m[0] = temp[0 ]*n[0 ]
               + temp[4 ]*n[1 ]
               + temp[8 ]*n[2 ]
               + temp[12]*n[3 ];

      m[1] = temp[1 ]*n[0 ]
               + temp[5 ]*n[1 ]
               + temp[9 ]*n[2 ]
               + temp[13]*n[3 ];

      m[2] = temp[2 ]*n[0 ]
               + temp[6 ]*n[1 ]
               + temp[10]*n[2 ]
               + temp[14]*n[3 ];

      m[3] = temp[3 ]*n[0 ]
               + temp[7 ]*n[1 ]
               + temp[11]*n[2 ]
               + temp[15]*n[3 ];

      m[4] = temp[0 ]*n[4 ]
               + temp[4 ]*n[5 ]
               + temp[8 ]*n[6 ]
               + temp[12]*n[7 ];

      m[5] = temp[1 ]*n[4 ]
               + temp[5 ]*n[5 ]
               + temp[9 ]*n[6 ]
               + temp[13]*n[7 ];

      m[6] = temp[2 ]*n[4 ]
               + temp[6 ]*n[5 ]
               + temp[10]*n[6 ]
               + temp[14]*n[7 ];

      m[7] = temp[3 ]*n[4 ]
               + temp[7 ]*n[5 ]
               + temp[11]*n[6 ]
               + temp[15]*n[7 ];

      m[8] = temp[0 ]*n[8 ]
               + temp[4 ]*n[9 ]
               + temp[8 ]*n[10]
               + temp[12]*n[11];

      m[9] = temp[1 ]*n[8 ]
               + temp[5 ]*n[9 ]
               + temp[9 ]*n[10]
               + temp[13]*n[11];

      m[10]= temp[2 ]*n[8 ]
               + temp[6 ]*n[9 ]
               + temp[10]*n[10]
               + temp[14]*n[11];

      m[11]= temp[3 ]*n[8 ]
               + temp[7 ]*n[9 ]
               + temp[11]*n[10]
               + temp[15]*n[11];

      m[12]= temp[0 ]*n[12]
               + temp[4 ]*n[13]
               + temp[8 ]*n[14]
               + temp[12]*n[15];

      m[13]= temp[1 ]*n[12]
               + temp[5 ]*n[13]
               + temp[9 ]*n[14]
               + temp[13]*n[15];

      m[14]= temp[2 ]*n[12]
               + temp[6 ]*n[13]
               + temp[10]*n[14]
               + temp[14]*n[15];

      m[15]= temp[3 ]*n[12]
               + temp[7 ]*n[13]
               + temp[11]*n[14]
               + temp[15]*n[15];
}

void MatrixInverse(float m[])
{
    float n[16];

      CopyMatrix(n, m);
      m[0 ] = n[0 ];
      m[1 ] = n[4 ];
      m[2 ] = n[8 ];

      m[4 ] = n[1 ];
      m[5 ] = n[5 ];
      m[6 ] = n[9 ];

      m[8 ] = n[2 ];
      m[9 ] = n[6 ];
      m[10] = n[10];

      m[12] *= -1.0f;
      m[13] *= -1.0f;
      m[14] *= -1.0f;
}

    /* The following routine converts an angle and a unit axis vector
        * to a matrix, returning the corresponding unit quaternion at no
        * extra cost. It is written in such a way as to allow both fixed
        * point and floating point versions to be created by appropriate
        * definitions of FPOINT, ANGLE, VECTOR, QUAT, MATRIX, MUL, HALF,
        * TWICE, COS, SIN, ONE, and ZERO.
        * The following is an example of floating point definitions.*/
QUAT AxisAngleToMatrix(VECTOR axis, float theta, float m[16])
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
        m[0] = 1 - (yy + zz);
        m[1] = xy - wz;
        m[2] = xz + wy;
        m[4] = xy + wz;
        m[5] = 1 - (xx + zz);
        m[6] = yz - wx;
        m[8] = xz - wy;
        m[9] = yz + wx;
        m[10] = 1 - (xx + yy);
        /* Fill in remainder of 4x4 homogeneous transform matrix. */
        m[12] = m[13] = m[14] = m[3] = m[7] = m[11] = 0;
        m[15] = 1;
        return (q);
}

float DotProduct(VECTOR vec1, VECTOR vec2)
{
    /*
    Dot Product of two Vectors.

    U = (Ux, Uy, Uz)
    V = (Vx, Vy, Vz)
    U*V = UxVx + UyVy + UzVz
    U*V = |U||V|cos(t) (where t is the angle theta between the two vectors)
    */
      float dot;
      dot = vec1.x * vec2.x + vec1.y * vec2.y + vec1.z * vec2.z;
      return dot;
}

VECTOR CrossVector(VECTOR vec1, VECTOR vec2)
{
    /*
    Cross Product of Two Vectors.

    a × b = ( a.y * b.z - a.z * b.y,

    a.z * b.x - a.x * b.z,

    a.x * b.y - a.y * b.x )

    | a × b | = |a| * |b| * sin(ø)
    */
      VECTOR vec3;
      vec3.x = vec1.y * vec2.z - vec1.z * vec2.y;
      vec3.y = vec1.z * vec2.x - vec1.x * vec2.z;
      vec3.z = vec1.x * vec2.y - vec1.y * vec2.x;
      return vec3;
}

void EulerToQuat(float roll, float pitch, float yaw, QUAT * quat)
{
    /*
    Euler Angle to Quarternion.

    q = qyaw qpitch qroll where:

    qyaw = [cos(f /2), (0, 0, sin(f /2)]
    qpitch = [cos (q/2), (0, sin(q/2), 0)]
    qroll = [cos (y/2), (sin(y/2), 0, 0)]
    */
    float cr, cp, cy, sr, sp, sy, cpcy, spsy;  // calculate trig identities
        cr = cos(roll/2);
    cp = cos(pitch/2);
        cy = cos(yaw/2);
        sr = sin(roll/2);
    sp = sin(pitch/2);
        sy = sin(yaw/2);
        cpcy = cp * cy;
        spsy = sp * sy;
    quat->w = cr * cpcy + sr * spsy;
        quat->x = sr * cpcy - cr * spsy;
    quat->y = cr * sp * cy + sr * cp * sy;
        quat->z = cr * cp * sy - sr * sp * cy;
}

float MagnitudeQuat(QUAT q1)
{
      return( sqrt(q1.w*q1.w+q1.x*q1.x+q1.y*q1.y+q1.z*q1.z));
}

QUAT NormaliseQuat(QUAT q1)
{
      QUAT q2;
      float Mag;
      Mag = MagnitudeQuat(q1);
      q2.w = q1.w/Mag;
      q2.x = q1.x/Mag;
      q2.y = q1.y/Mag;
      q2.z = q1.z/Mag;
      return q2;
}

void QuatToMatrix(QUAT quat, float m[16])
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
      m[0] = 1.0 - (yy + zz);
      m[1] = xy - wz;
      m[2] = xz + wy;
      m[3] = 0.0;
      m[4] = xy + wz;
      m[5] = 1.0 - (xx + zz);
      m[6] = yz - wx;
      m[7] = 0.0;
      m[8] = xz - wy;
      m[9] = yz + wx;
      m[10] = 1.0 - (xx + yy);
      m[11] = 0.0;
      m[12] = 0;
      m[13] = 0;
      m[14] = 0;
      m[15] = 1;
}

QUAT MultQuat(QUAT q1, QUAT q2)
{
    /*
    Multiplication of two Quarternions.

    qq´ = [ww´ - v · v´, v x v´ + wv´ +w´v]
    ( · is vector dot product and x is vector cross product )
    */
      QUAT q3;
      VECTOR vectorq1;
      VECTOR vectorq2;
      vectorq1.x = q1.x;
      vectorq1.y = q1.y;
      vectorq1.z = q1.z;
      vectorq2.x = q2.x;
      vectorq2.y = q2.y;
      vectorq2.z = q2.z;

      VECTOR tempvec1;
      VECTOR tempvec2;
      VECTOR tempvec3;
      q3.w = (q1.w*q2.w) - DotProduct(vectorq1, vectorq2);
      tempvec1 = CrossVector(vectorq1, vectorq2);
      tempvec2.x = q1.w * q2.x;
      tempvec2.y = q1.w * q2.y;
      tempvec2.z = q1.w * q2.z;
      tempvec3.x = q2.w * q1.x;
      tempvec3.y = q2.w * q1.y;
      tempvec3.z = q2.w * q1.z;
      q3.x = tempvec1.x + tempvec2.x + tempvec3.x;
      q3.y = tempvec1.y + tempvec2.y + tempvec3.y;
      q3.z = tempvec1.z + tempvec2.z + tempvec3.z;
      return NormaliseQuat(q3);
}

VERTEX GetNorm(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3)
{
        float ux;
        float uy;
        float uz;
        float vx;
        float vy;
        float vz;
          VERTEX temp_vertex;
          ux = x1 - x2;
          uy = y1 - y2;
          uz = z1 - z2;
          vx = x3 - x2;
          vy = y3 - y2;
          vz = z3 - z2;
          temp_vertex.nx = (uy*vz)-(vy*uz);
          temp_vertex.ny = (uz*vx)-(vz*ux);
          temp_vertex.nz = (ux*vy)-(vx*uy);
          return temp_vertex;
}

GLfloat MagnitudeVector(VECTOR vec1)
{
  return(sqrt(vec1.x*vec1.x+vec1.y*vec1.y+vec1.z*vec1.z));
}

VECTOR GetUnitVector(VECTOR vector)
{
	// Reduces a normal vector specified as a set of three coordinates,
	// to a unit normal vector of length one.

	// Calculate the length of the vector		
	float length = (float) sqrt(( vector.x * vector.x) + 
						        ( vector.y * vector.y) +
						        ( vector.z * vector.z) );

	// Keep the program from blowing up by providing an exceptable
	// value for vectors that may calculated too close to zero.
	if(length == 0.0f)
		length = 1.0f;

	// Dividing each element by the length will result in a
	// unit normal vector.
	vector.x /= length;
	vector.y /= length;
	vector.z /= length;
        return vector;
}

VECTOR GetEdgeVector(VECTOR point1, VECTOR point2)
{
  VECTOR temp_vector;
  temp_vector.x = point1.x - point2.x;
  temp_vector.y = point1.y - point2.y;
  temp_vector.z = point1.z - point2.z;
  return temp_vector;
}
