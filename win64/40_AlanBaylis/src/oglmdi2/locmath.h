#ifndef MATH_H
#define MATH_H

#include "shared.h"
#include "vector.h"
#include "vertex.h"
#include "quat.h"

#define dot(u,v)   ((u).x * (v).x + (u).y * (v).y + (u).z * (v).z)
#define norm(v)    sqrt(dot(v,v))  // norm = length of vector
#define d(u,v)     norm(u-v)       // distance = norm of difference

void LoadIdentity(float m[]);
void CopyMatrix(float m[], float n[]);
void MultMatrix(float m[], float n[]);
void MatrixInverse(float m[]);
QUAT AxisAngleToMatrix(VECTOR axis, float theta, float m[16]);
float DotProduct(VECTOR vec1, VECTOR vec2);
VECTOR CrossVector(VECTOR vec1, VECTOR vec2);
void EulerToQuat(float roll, float pitch, float yaw, QUAT * quat);
float MagnitudeQuat(QUAT q1);
QUAT NormaliseQuat(QUAT q1);
void QuatToMatrix(QUAT quat, float m[16]);
QUAT MultQuat(QUAT q1, QUAT q2);
VERTEX GetNorm(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3);
float MagnitudeVector(VECTOR vec1);
VECTOR GetUnitVector(VECTOR vector);
VECTOR GetEdgeVector(VECTOR point1, VECTOR point2);

#endif
