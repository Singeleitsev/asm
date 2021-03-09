#include <windows.h>


#include "camera.h"
#include "general.h"

CAMERA::CAMERA()
{
}

CAMERA::~CAMERA()
{
}

void CAMERA::Set()
{
    Orientation.Set();
    Position.Set();
        Delta_x = 0.0;
        Delta_y = 0.0;
        Delta_z = 0.0;
        Matrix.LoadIdentity();
}

void CAMERA::UpdateCamera()
{
    Rotate();

    UpdatePosition();
}

void CAMERA::ApplyCamera()
{
    Matrix.QuatToMatrix(Orientation);
    Matrix.MatrixInverse();

    glLoadMatrixf(Matrix.Element);
    glTranslatef(-Position.x,-Position.y,-Position.z);
}
