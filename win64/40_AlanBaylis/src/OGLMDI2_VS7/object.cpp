#include <windows.h>
#include "shared.h"
#include "object.h"

extern float pi;
extern float radians;

OBJECT::OBJECT()
{
}

OBJECT::~OBJECT()
{
}

void OBJECT::Set()
{
    Orientation.Set();
    Position.Set();
        Delta_x = 0.0;
        Delta_y = 0.0;
        Delta_z = 0.0;
        Movement_x = 0.0;
        Movement_y = 0.0;
        Movement_z = 0.0;
}

void OBJECT::Rotate()
{
        QUAT temp_quat;
    temp_quat.EulerToQuat(Delta_x * radians * Multiplier, Delta_y * radians * Multiplier, Delta_z * radians * Multiplier);
        Orientation.MultQuat(temp_quat);
}

void OBJECT::Draw()
{
  // Should probably be a pure virtual 
}

void OBJECT::UpdatePosition()
{
    if (Movement_x != 0)
        MoveX();
    if (Movement_y != 0)
        MoveY();
    if (Movement_z != 0)
        MoveZ();

    Movement_x = 0.0;
    Movement_y = 0.0;
    Movement_z = 0.0;
}

void OBJECT::UpdatePosition(float x, float y, float z)
{
    if (x != 0)
        MoveX(x);
    if (y != 0)
        MoveY(y);
    if (z != 0)
        MoveZ(z);
}

void OBJECT::MoveX()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(0.0, -90.0*(pi/180), 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * Movement_x * Multiplier;
    Position.y += DirY * Movement_x * Multiplier;
    Position.z += DirZ * Movement_x * Multiplier;
}

void OBJECT::MoveY()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(90.0*(pi/180), 0.0, 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * Movement_y * Multiplier;
    Position.y += DirY * Movement_y * Multiplier;
    Position.z += DirZ * Movement_y * Multiplier;
}

void OBJECT::MoveZ()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = Orientation.w;
    float X = Orientation.x;
    float Y = Orientation.y;
    float Z = Orientation.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * Movement_z * Multiplier;
    Position.y += DirY * Movement_z * Multiplier;
    Position.z += DirZ * Movement_z * Multiplier;
}

void OBJECT::MoveX(float x)
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(0.0, -90.0*(pi/180), 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * x * Multiplier;
    Position.y += DirY * x * Multiplier;
    Position.z += DirZ * x * Multiplier;
}

void OBJECT::MoveY(float y)
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(90.0*(pi/180), 0.0, 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * y * Multiplier;
    Position.y += DirY * y * Multiplier;
    Position.z += DirZ * y * Multiplier;
}

void OBJECT::MoveZ(float z)
{
    float DirX;
    float DirY;
    float DirZ;
    float W = Orientation.w;
    float X = Orientation.x;
    float Y = Orientation.y;
    float Z = Orientation.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    Position.x += DirX * z * Multiplier;
    Position.y += DirY * z * Multiplier;
    Position.z += DirZ * z * Multiplier;
}

VECTOR OBJECT::GetXUnit()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(0.0, -90.0*(pi/180), 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    VECTOR Unit;
    Unit.x += DirX * 1;
    Unit.y += DirY * 1;
    Unit.z += DirZ * 1;
    return Unit;
}

VECTOR OBJECT::GetYUnit()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = 0.0;
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    QUAT TempQuat;
    QUAT TempQuat2;
    TempQuat = Orientation;
    TempQuat2.EulerToQuat(90.0*(pi/180), 0.0, 0.0);
    TempQuat.MultQuat(TempQuat2);
    W = TempQuat.w;
    X = TempQuat.x;
    Y = TempQuat.y;
    Z = TempQuat.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    VECTOR Unit;    
    Unit.x += DirX * 1;
    Unit.y += DirY * 1;
    Unit.z += DirZ * 1;
    return Unit;
}

VECTOR OBJECT::GetZUnit()
{
    float DirX;
    float DirY;
    float DirZ;
    float W = Orientation.w;
    float X = Orientation.x;
    float Y = Orientation.y;
    float Z = Orientation.z;
    DirX = 2.0 * ( X * Z - W * Y );
    DirY = 2.0 * ( Y * Z + W * X );
    DirZ = 1.0 - 2.0 * ( X * X + Y * Y );
    VECTOR Unit;
    Unit.x += DirX * 1;
    Unit.y += DirY * 1;
    Unit.z += DirZ * 1;
    return Unit;
}

