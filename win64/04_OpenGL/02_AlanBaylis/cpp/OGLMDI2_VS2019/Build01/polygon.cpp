#include <windows.h>


#include "polygon.h"
#include "general.h"

POLYGON::POLYGON()
{
}

POLYGON::~POLYGON()
{
}

VECTOR POLYGON::GetNormal()
{
        VECTOR temp; 
        float ux;
        float uy;
        float uz;
        float vx;
        float vy;
        float vz;
          ux = Vertex[1].x - Vertex[0].x;
          uy = Vertex[1].y - Vertex[0].y;
          uz = Vertex[1].z - Vertex[0].z;
          vx = Vertex[2].x - Vertex[0].x;
          vy = Vertex[2].y - Vertex[0].y;
          vz = Vertex[2].z - Vertex[0].z;
          temp.x = (uy*vz)-(vy*uz);
          temp.y = (uz*vx)-(vz*ux);
          temp.z = (ux*vy)-(vx*uy);
        return temp;
}

void POLYGON::SetNormal()
{
        float ux;
        float uy;
        float uz;
        float vx;
        float vy;
        float vz;
          ux = Vertex[1].x - Vertex[0].x;
          uy = Vertex[1].y - Vertex[0].y;
          uz = Vertex[1].z - Vertex[0].z;
          vx = Vertex[2].x - Vertex[0].x;
          vy = Vertex[2].y - Vertex[0].y;
          vz = Vertex[2].z - Vertex[0].z;
          Vertex[0].nx = (uy*vz)-(vy*uz);
          Vertex[0].ny = (uz*vx)-(vz*ux);
          Vertex[0].nz = (ux*vy)-(vx*uy);
        Vertex[1].nx = Vertex[0].nx;
          Vertex[1].ny = Vertex[0].ny;
          Vertex[1].nz = Vertex[0].nz;
          Vertex[2].nx = Vertex[0].nx;
          Vertex[2].ny = Vertex[0].ny;
          Vertex[2].nz = Vertex[0].nz;
}

VECTOR POLYGON::GetMidPoint()
{
    VECTOR temp;
    temp.x = (Vertex[0].x + Vertex[1].x + Vertex[2].x)/3;
    temp.y = (Vertex[0].y + Vertex[1].y + Vertex[2].y)/3;
    temp.z = (Vertex[0].z + Vertex[1].z + Vertex[2].z)/3;
    return temp;
}

bool POLYGON::CheckForCollision(CAMERA* pLastCam, CAMERA* pCam)
{
  float Radius = 0.5;                            //Collision sphere radius
  VECTOR Vect1;                                    //Change vertex representation of data to vectors
  Vect1.x = Vertex[0].x;
  Vect1.y = Vertex[0].y;
  Vect1.z = Vertex[0].z;
  VECTOR Vect2;
  Vect2.x = Vertex[1].x;
  Vect2.y = Vertex[1].y;
  Vect2.z = Vertex[1].z;
  VECTOR Vect3;
  Vect3.x = Vertex[2].x;
  Vect3.y = Vertex[2].y;
  Vect3.z = Vertex[2].z;
  float Flag = 0;                                //Collision flag, 1 = collision occured
  float CamDistance;                                //Camera distance from plane
  float LastCamDistance;                                //LastCamera distance from plane
  VECTOR CameraPos;                                //Vector for the cameras position
  VECTOR LastCameraPos;                                //Vector for the cameras position
  VECTOR TempVect;                                 //Work variables
  float TempFloat;
  VECTOR Normal = GetNormal();                     //Get this polygons face normal
  Normal.x = Normal.x * -1;                        //Invert normal. Not sure if this is a problem with my code or an ogl thing.
  Normal.y = Normal.y * -1;
  Normal.z = Normal.z * -1;
  Normal = GetUnitVector(Normal);                  //Convert to a unit vector
  TempFloat = -1 * DotProduct(Normal, Vect1);      // Take the dot product of the face normal and any point on the face, and negate that. This will be your d (distance offset) component of the plane equation.
  CameraPos.x = -1 * pCam->Position.x;             //Get inverted current camera position
  CameraPos.y = -1 * pCam->Position.y;
  CameraPos.z = -1 * pCam->Position.z;
  CamDistance = DotProduct(Normal, CameraPos) - TempFloat;  //Distance from polygons plane
  LastCameraPos.x = -1 * pLastCam->Position.x;             //Get inverted last camera position
  LastCameraPos.y = -1 * pLastCam->Position.y;
  LastCameraPos.z = -1 * pLastCam->Position.z;
  LastCamDistance = DotProduct(Normal, LastCameraPos) - TempFloat;  //Distance from polygons plane
  if(!(CamDistance < Radius && LastCamDistance >= Radius))             //If CamDistance < Radius and LastCamDistance >= Radius then it passed through the polygon
    goto Skip;                                     //If not, end the collision test
  TempVect = GetEdgeVector(Vect1, Vect2);          //Create edge vector
  TempVect = CrossVector(Normal, TempVect);       //Cross product of edge vector and polygons normal gives us the anti-planes normal
  TempVect = GetUnitVector(TempVect);              //Reduce anti-plane normal to a unit vector
  TempFloat = -1 * DotProduct(TempVect, Vect1);    //Distance offset to plane equation
  TempFloat = DotProduct(TempVect, CameraPos) - TempFloat; //Find distance to the plane
  if(TempFloat >= Radius)// - 0.2)                    //Reducing the radius here makes sure the sphere is well on the polygon before colliding
    goto Skip;
  TempVect = GetEdgeVector(Vect2, Vect3);
  TempVect = CrossVector(Normal, TempVect);
  TempVect = GetUnitVector(TempVect);
  TempFloat = -1 * DotProduct(TempVect, Vect2);
  TempFloat = DotProduct(TempVect, CameraPos) - TempFloat;
  if(TempFloat >= Radius)// - 0.2)
    goto Skip;
  TempVect = GetEdgeVector(Vect3, Vect1);
  TempVect = CrossVector(Normal, TempVect);
  TempVect = GetUnitVector(TempVect);
  TempFloat = -1 * DotProduct(TempVect, Vect3);
  TempFloat = DotProduct(TempVect, CameraPos) - TempFloat;
  if(TempFloat >= Radius)// - 0.2)
    goto Skip;
  TempFloat = (Radius - CamDistance)/MagnitudeVector(Normal);  //Calculate new position and distance of slide
  pCam->Position.x -= (TempFloat * Normal.x);               //Update the camera position
  pCam->Position.y -= (TempFloat * Normal.y);
  pCam->Position.z -= (TempFloat * Normal.z);
  Flag = 1;                                    //Set collision flag to true
  return Flag;
Skip:
  return Flag;
}



