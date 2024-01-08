// Object Class    by Alan Baylis 2001

#ifndef ObjectH
#define ObjectH

#include "vector.h"
#include "quat.h"

class OBJECT
{
    public:
        OBJECT();
          ~OBJECT();
                
                void Set();
                void Rotate();
                void Draw();
                void UpdatePosition();
                void UpdatePosition(float x, float y, float z); 
                void MoveX(); 
                void MoveY(); 
                void MoveZ(); 
                void MoveX(float x); 
                void MoveY(float y); 
                void MoveZ(float z); 
                VECTOR GetXUnit();                
                VECTOR GetYUnit();                
                VECTOR GetZUnit();                

        QUAT Orientation;
                VECTOR Position;
                float Delta_x;   //Rotation deltas  
                float Delta_y;
                float Delta_z;
         float Movement_x;    //Movement displacements
        float Movement_y;
        float Movement_z;
                float Multiplier;
};

#endif
