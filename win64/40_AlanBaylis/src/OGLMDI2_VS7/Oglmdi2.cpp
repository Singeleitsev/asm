/*
                                     OpenGL MDI Editor

                                 Program by Alan Baylis 2001
*/

#include <windows.h>
#include "shared.h"
#include "vector.h"
#include "vertex.h"
#include "quat.h"
#include "matrix.h"
#include "texture.h"
#include "general.h"
#include "object.h"    // Base class
#include "camera.h"
#include "polygon.h"
#include "locmath.h"
#include "console.h"
#include "log.h"
#include "resource.h" // Header for resource file

//Math
float pi = 3.141592;
float radians = pi / 180;

//Text variables
COLORREF colorRGB; // Color struct for Win32 text
RECT MainRect;     // Rect struct for Win32 text
LOGFONT LogFont;   // Font structs for Win32 text
HFONT hFont;
HFONT hOldFont;

//Texture instance
TEXTURE* texture = new TEXTURE[1];

//Vertices for cube
VERTEX* vertex = new VERTEX[8];

//Polygons for cube
POLYGON* polygon = new POLYGON[12];

char g_szMainClassName[] = "MainWindow";
char g_szChild3DClassName[] = "3DOpenGL";   // 3D window class name
char g_szChild2DClassName[] = "2DOpenGL";   // 2D window class name
HINSTANCE g_hInst;
HWND g_hMDIClient;
HWND g_hMainWindow;
RECT g_rectChild;                           // RECT structure for child window dimensions

float g_fCubeRotationX, g_fCubeRotationY;
float Zoom = 0.025;                            // Ortho view zoom value
bool key[256];                                 // Array used for keyboard input
bool released_key[256];                        // Array used for toggled keyboard input
int VerticalShift = 0;
int HorizontalShift = 0;
bool g_bMouseDrag = 0;                         // Mouse capture flag
int g_iMouseLastX;                             // Holds previous X position of mouse
int g_iMouseLastY;                             // Holds previous Y position of mouse
int g_iMouseDeltaX;                            // Holds the mouse increment in X since LastX
int g_iMouseDeltaY;                            // Holds the mouse increment in Y since LastY
int VertexNumber;
int ShortestDistance = 10000;
int MouseX;
int MouseY;
float FrontDepth = 90;
float TopDepth = -90;
float LeftDepth = -90;
GLUquadricObj * sphere = gluNewQuadric();       // sphere for vertex selection

bool g_bMouseDrag2 = 0;                         // Mouse capture flag
int g_iMouseLastX2;                             // Holds previous X position of mouse
int g_iMouseLastY2;                             // Holds previous Y position of mouse
int g_iMouseDeltaX2;                            // Holds the mouse increment in X since LastX
int g_iMouseDeltaY2;                            // Holds the mouse increment in Y since LastY

typedef struct CHILD                           // Child structure for each child window
{
    int iType;                                 // Type of child window (1 = 3D, 2 = XY (Front) ortho view, 3 = XZ (Top) ortho view, 4 = ZY (Left) ortho view)
    HDC hDC;                                   // Individual device context
    HGLRC hRC;                                 // Individual rendering context
    HWND hWnd;                                 // Handle to child window
} CHILD;

int g_iMaxChild = 50;                          // Maximum number of child windows wanted
int g_iNumChild = 0;                           // Number of child windows created
CHILD* g_child = new CHILD[g_iMaxChild];       // Create the CHILD structures

void SetTextures()
{
    sprintf(texture[0].TexName, "%s", "tile1.tga");
    texture[0].LoadTGA();
}

void SetVertices()
{
// Set cubes vertices

    vertex[0].x = -100;
    vertex[0].y = -100;
    vertex[0].z = 100;

    vertex[1].x = 100;
    vertex[1].y = -100;
    vertex[1].z = 100;

    vertex[2].x = 100;
    vertex[2].y = 100;
    vertex[2].z = 100;

    vertex[3].x = -100;
    vertex[3].y = 100;
    vertex[3].z = 100;

    vertex[4].x = -100;
    vertex[4].y = -100;
    vertex[4].z = -100;

    vertex[5].x = 100;
    vertex[5].y = -100;
    vertex[5].z = -100;

    vertex[6].x = 100;
    vertex[6].y = 100;
    vertex[6].z = -100;

    vertex[7].x = -100;
    vertex[7].y = 100;
    vertex[7].z = -100;
}

void SetPolygons()
{
// Set cubes polygons

//Front
    polygon[0].Vertex[0] = vertex[0];
    polygon[0].Vertex[1] = vertex[1];
    polygon[0].Vertex[2] = vertex[2];

    polygon[1].Vertex[0] = vertex[0];
    polygon[1].Vertex[1] = vertex[2];
    polygon[1].Vertex[2] = vertex[3];
//Back
    polygon[2].Vertex[0] = vertex[5];
    polygon[2].Vertex[1] = vertex[4];
    polygon[2].Vertex[2] = vertex[7];

    polygon[3].Vertex[0] = vertex[5];
    polygon[3].Vertex[1] = vertex[7];
    polygon[3].Vertex[2] = vertex[6];
//Left
    polygon[4].Vertex[0] = vertex[4];
    polygon[4].Vertex[1] = vertex[0];
    polygon[4].Vertex[2] = vertex[3];

    polygon[5].Vertex[0] = vertex[4];
    polygon[5].Vertex[1] = vertex[3];
    polygon[5].Vertex[2] = vertex[7];
//Right
    polygon[6].Vertex[0] = vertex[1];
    polygon[6].Vertex[1] = vertex[5];
    polygon[6].Vertex[2] = vertex[6];

    polygon[7].Vertex[0] = vertex[1];
    polygon[7].Vertex[1] = vertex[6];
    polygon[7].Vertex[2] = vertex[2];
//Top
    polygon[8].Vertex[0] = vertex[3];
    polygon[8].Vertex[1] = vertex[2];
    polygon[8].Vertex[2] = vertex[6];

    polygon[9].Vertex[0] = vertex[3];
    polygon[9].Vertex[1] = vertex[6];
    polygon[9].Vertex[2] = vertex[7];
//Bottom
    polygon[10].Vertex[0] = vertex[5];
    polygon[10].Vertex[1] = vertex[1];
    polygon[10].Vertex[2] = vertex[0];

    polygon[11].Vertex[0] = vertex[5];
    polygon[11].Vertex[1] = vertex[0];
    polygon[11].Vertex[2] = vertex[4];

    polygon[0].SetNormal();
    polygon[1].SetNormal();
    polygon[2].SetNormal();
    polygon[3].SetNormal();
    polygon[4].SetNormal();
    polygon[5].SetNormal();
    polygon[6].SetNormal();
    polygon[7].SetNormal();
    polygon[8].SetNormal();
    polygon[9].SetNormal();
    polygon[10].SetNormal();
    polygon[11].SetNormal();
}

/* Set the rendering options for OpenGL */
void InitGL()
{
    glCullFace(GL_BACK);
    glEnable(GL_CULL_FACE);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClearDepth(1.0);
    glDepthFunc(GL_LESS);
    glEnable(GL_DEPTH_TEST);
    glShadeModel(GL_SMOOTH);
    glEnable(GL_NORMALIZE);

    float fMatAmbient[] = {0.8, 0.8, 0.8, 1.0};
    float fMatDiffuse[] = {0.8, 0.8, 0.8, 1.0};
    float fMatSpecular[] = {0.9, 0.9, 0.9, 1.0};
    float fMatEmmision[] = {0.0, 0.0, 0.0, 1.0};
    float fMatShininess[] = {100.0};

    glMaterialfv(GL_FRONT, GL_AMBIENT, fMatAmbient);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, fMatDiffuse);
    glMaterialfv(GL_FRONT, GL_SPECULAR, fMatSpecular);
    glMaterialfv(GL_FRONT, GL_EMISSION, fMatEmmision);
    glMaterialfv(GL_FRONT, GL_SHININESS, fMatShininess);

    float fLightAmbient[] = {0.2, 0.2, 0.2, 1.0};
    glLightfv(GL_LIGHT0, GL_AMBIENT, fLightAmbient);
    float fLightPosition[] = {200.0, 0.0, 0.0, 1.0};
    glLightfv(GL_LIGHT0, GL_POSITION, fLightPosition);

    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);

    SetTextures();

    glEnable(GL_TEXTURE_2D);
}

// Sets the 3D Projection matrix. The Modelview matrix is set in the DrawGLScene routine
void Set3DProjection(int iWidth, int iHeight)
{
    if(iHeight == 0)
    {
        iHeight = 1;
    }
    glViewport(0, 0, iWidth, iHeight);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,(float)iWidth/(float)iHeight, 1, 1000.0);
}

// Sets the 3D Projection matrix.
void Set2DProjection(int iWidth, int iHeight)
{
    if(iHeight == 0)
    {
        iHeight = 1;
    }
    glViewport(0, 0, iWidth, iHeight);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-iWidth * 0.5, iWidth * 0.5, -iHeight * 0.5, iHeight * 0.5, -2000, 2000);
}

void Draw3DScene(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    if(g_bMouseDrag)                                       // If left mouse button is down
    {
        g_fCubeRotationX += (float)g_iMouseDeltaY * 0.5;   // Apply mouse deltas to cube rotation values
        g_fCubeRotationY += (float)g_iMouseDeltaX * 0.5;
    }

    glTranslatef(0.0,0.0,-500.0);
    glRotatef(g_fCubeRotationX,1.0,0.0,0.0);
    glRotatef(g_fCubeRotationY,0.0,1.0,0.0);

    glBindTexture(GL_TEXTURE_2D, texture[0].TexID);
    glPushMatrix();
    glBegin(GL_TRIANGLES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[0].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[0].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[0].Vertex[2].x);

        glNormal3fv(&polygon[1].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[1].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[1].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[1].Vertex[2].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[2].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[2].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[2].Vertex[2].x);

        glNormal3fv(&polygon[3].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[3].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[3].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[3].Vertex[2].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[4].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[4].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[4].Vertex[2].x);

        glNormal3fv(&polygon[5].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[5].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[5].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[5].Vertex[2].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[6].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[6].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[6].Vertex[2].x);

        glNormal3fv(&polygon[7].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[7].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[7].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[7].Vertex[2].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[8].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[8].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[8].Vertex[2].x);

        glNormal3fv(&polygon[9].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[9].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[9].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[9].Vertex[2].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[10].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[10].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[10].Vertex[2].x);

        glNormal3fv(&polygon[11].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[11].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[11].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[11].Vertex[2].x);
    glEnd();
    glPopMatrix();
}

void Draw2DSceneFront(HWND hWnd)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    RECT WindowRect;
    GetClientRect(hWnd, &WindowRect);
/*
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 1.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(-0.5 * WindowRect.right, TopDepth, 0);
        glVertex3f(0.5 * WindowRect.right, TopDepth, 0);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 0.0, 1.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(LeftDepth, 0.5 * WindowRect.bottom, 0);
        glVertex3f(LeftDepth, -0.5 * WindowRect.bottom, 0);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);
*/
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(1.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glVertex3fv(&polygon[0].Vertex[0].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[0].x);

        glVertex3fv(&polygon[1].Vertex[0].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[0].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glVertex3fv(&polygon[2].Vertex[0].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[0].x);

        glVertex3fv(&polygon[3].Vertex[0].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[0].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glVertex3fv(&polygon[4].Vertex[0].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[0].x);

        glVertex3fv(&polygon[5].Vertex[0].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[0].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glVertex3fv(&polygon[6].Vertex[0].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[0].x);

        glVertex3fv(&polygon[7].Vertex[0].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[0].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glVertex3fv(&polygon[8].Vertex[0].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[0].x);

        glVertex3fv(&polygon[9].Vertex[0].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[0].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glVertex3fv(&polygon[10].Vertex[0].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[0].x);

        glVertex3fv(&polygon[11].Vertex[0].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[0].x);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

float mat_ambient[] = { 0.8, 0.5, 0.1, 1.0 };
float mat_diffuse[] = { 0.8, 0.5, 0.1, 1.0 };
glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
glDisable(GL_TEXTURE_2D);
glPushMatrix();
glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z);
gluQuadricOrientation(sphere, GLU_OUTSIDE);
gluSphere(sphere,10.0,20,20);
glPopMatrix();
glEnable(GL_TEXTURE_2D);

}

void Draw2DSceneTop(HWND hWnd)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glRotatef(90, 1, 0, 0);
    RECT WindowRect;
    GetClientRect(hWnd, &WindowRect);
/*
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(1.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(-0.5 * WindowRect.right, 0, FrontDepth);
        glVertex3f(0.5 * WindowRect.right, 0, FrontDepth);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 0.0, 1.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(LeftDepth, 0,  0.5 * WindowRect.bottom);
        glVertex3f(LeftDepth, 0, -0.5 * WindowRect.bottom);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);
*/
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 1.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glVertex3fv(&polygon[0].Vertex[0].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[0].x);

        glVertex3fv(&polygon[1].Vertex[0].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[0].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glVertex3fv(&polygon[2].Vertex[0].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[0].x);

        glVertex3fv(&polygon[3].Vertex[0].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[0].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glVertex3fv(&polygon[4].Vertex[0].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[0].x);

        glVertex3fv(&polygon[5].Vertex[0].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[0].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glVertex3fv(&polygon[6].Vertex[0].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[0].x);

        glVertex3fv(&polygon[7].Vertex[0].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[0].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glVertex3fv(&polygon[8].Vertex[0].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[0].x);

        glVertex3fv(&polygon[9].Vertex[0].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[0].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glVertex3fv(&polygon[10].Vertex[0].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[0].x);

        glVertex3fv(&polygon[11].Vertex[0].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[0].x);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

float mat_ambient[] = { 0.8, 0.5, 0.1, 1.0 };
float mat_diffuse[] = { 0.8, 0.5, 0.1, 1.0 };
glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
glDisable(GL_TEXTURE_2D);
glPushMatrix();
glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z);
gluQuadricOrientation(sphere, GLU_OUTSIDE);
gluSphere(sphere,10.0,20,20);
glPopMatrix();
glEnable(GL_TEXTURE_2D);

}

void Draw2DSceneLeft(HWND hWnd)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glRotatef(90, 0, 1, 0);
    RECT WindowRect;
    GetClientRect(hWnd, &WindowRect);
/*
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(1.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(0, -0.5 * WindowRect.bottom, FrontDepth);
        glVertex3f(0, 0.5 * WindowRect.bottom, FrontDepth);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 1.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(0, TopDepth, -0.5 * WindowRect.right);
        glVertex3f(0, TopDepth, 0.5 * WindowRect.right);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);
*/
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 0.0, 1.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glVertex3fv(&polygon[0].Vertex[0].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[0].x);

        glVertex3fv(&polygon[1].Vertex[0].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[0].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glVertex3fv(&polygon[2].Vertex[0].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[0].x);

        glVertex3fv(&polygon[3].Vertex[0].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[0].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glVertex3fv(&polygon[4].Vertex[0].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[0].x);

        glVertex3fv(&polygon[5].Vertex[0].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[0].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glVertex3fv(&polygon[6].Vertex[0].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[0].x);

        glVertex3fv(&polygon[7].Vertex[0].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[0].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glVertex3fv(&polygon[8].Vertex[0].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[0].x);

        glVertex3fv(&polygon[9].Vertex[0].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[0].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glVertex3fv(&polygon[10].Vertex[0].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[0].x);

        glVertex3fv(&polygon[11].Vertex[0].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[0].x);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

float mat_ambient[] = { 0.8, 0.5, 0.1, 1.0 };
float mat_diffuse[] = { 0.8, 0.5, 0.1, 1.0 };
glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
glDisable(GL_TEXTURE_2D);
glPushMatrix();
glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z);
gluQuadricOrientation(sphere, GLU_OUTSIDE);
gluSphere(sphere,10.0,20,20);
glPopMatrix();
glEnable(GL_TEXTURE_2D);

}

LRESULT CALLBACK WndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
{
    switch(uMessage)
    {
        case WM_CREATE:
        {
            CLIENTCREATESTRUCT ccs;
            // Find window menu where children will be listed
            ccs.hWindowMenu = NULL;
// If the menus document list for more than 9 children didn't upset the child ID then I would use the line below
            //ccs.hWindowMenu = (HMENU)GetSubMenu(GetMenu(hWnd), 2); // if you use less than 10 windows then use this line
            ccs.idFirstChild = ID_MDI_FIRSTCHILD;

            g_hMDIClient = CreateWindowEx(WS_EX_CLIENTEDGE, "MDICLIENT", NULL,
            WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,                    //WS_VSCROLL and WS_HSCROLL do not work properly yet
            CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
            hWnd, (HMENU)ID_MDI_CLIENT, g_hInst, (LPVOID)&ccs);

            ShowWindow(g_hMDIClient, SW_SHOW);
            return 0;
        }
        case WM_COMMAND:
        {
            switch(LOWORD(wParam))
            {
                case CM_FILE_EXIT:
                    PostMessage(hWnd, WM_CLOSE, 0, 0);
                break;

                case CM_FILE_NEW_3D:
                {
                    HWND hChild;

                    if(g_iNumChild < g_iMaxChild)      // If the number of children hasn't reached the maximum
                        g_iNumChild++;                 // Increment the number of children
                    else
                        break;                         // Otherwise break out of the routine

                    char szWindowTitle[] = "3D";
                    //sprintf(szWindowTitle, "%d", g_iNumChild - 1);

/* One way to create a child window is to send a WM_MDICREATE message to the client
window and pass it a pointer to a MDICREATESTRUCT. */

/*
                    MDICREATESTRUCT mcs;
                    mcs.szTitle = szWindowTitle;
                    mcs.szClass = g_szChildClassName;
                    mcs.hOwner  = g_hInst;
                    mcs.x = mcs.cx = CW_USEDEFAULT;
                    mcs.y = mcs.cy = CW_USEDEFAULT;
                    mcs.style = MDIS_ALLCHILDSTYLES;

                    hChild = (HWND)SenduMessage(g_hMDIClient, WM_MDICREATE, 0, (LONG)&mcs);
//*/

/* Another way to create a child window is to use CreateWindowEx and set the extended
windows style  to WS_EX_MDICHILD. I prefer this method as it will allow each child to be created in
seperate threads in the future. */

//*
                    CREATESTRUCT cs;
                    ZeroMemory(&cs, sizeof(CREATESTRUCT));

                    hChild = CreateWindowEx(
                    WS_EX_MDICHILD,
                    g_szChild3DClassName,
                    szWindowTitle,
                    WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    g_hMDIClient,
                    NULL,
                    g_hInst,
                    &cs
                    );
//*/
                    if(!hChild)
                    {
                        MessageBox(NULL, "3D Child creation failed.", "Error",
                        MB_ICONEXCLAMATION | MB_OK);
                    }

                    g_child[g_iNumChild - 1].iType = 1;             // Set child windows type
                    g_child[g_iNumChild - 1].hWnd = hChild;         // Set child windows handle
                    g_child[g_iNumChild - 1].hDC = GetDC(hChild);   // Set child windows device context

                    PIXELFORMATDESCRIPTOR pfd;
                    ZeroMemory(&pfd, sizeof(pfd));
                    pfd.nSize = sizeof(pfd);
                    pfd.nVersion = 1;
                    pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
                    pfd.iPixelType = PFD_TYPE_RGBA;
                    pfd.cColorBits = 24;
                    pfd.cDepthBits = 16;
                    pfd.iLayerType = PFD_MAIN_PLANE;
                    int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
                    SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);               // Set pixel format for this child

                    g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);  // Set childs rendering context
                    wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);     // Make this child the current DC and RC
                    InitGL();              // Initialize the rendering defaults for this child
                }
                break;

                case CM_FILE_NEW_FRONT:
                {
                    HWND hChild;

                    if(g_iNumChild < g_iMaxChild)      // If the number of children hasn't reached the maximum
                        g_iNumChild++;                 // Increment the number of children
                    else
                        break;                         // Otherwise break out of the routine

                    char szWindowTitle[] = "Front";
                    //sprintf(szWindowTitle, "%d", g_iNumChild - 1);

                    CREATESTRUCT cs;
                    ZeroMemory(&cs, sizeof(CREATESTRUCT));

                    hChild = CreateWindowEx(
                    WS_EX_MDICHILD,
                    g_szChild2DClassName,
                    szWindowTitle,
                    WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    g_hMDIClient,
                    NULL,
                    g_hInst,
                    &cs
                    );

                    if(!hChild)
                    {
                        MessageBox(NULL, "2D Child creation failed.", "Error",
                        MB_ICONEXCLAMATION | MB_OK);
                    }

                    g_child[g_iNumChild - 1].iType = 2;             // Set child windows type
                    g_child[g_iNumChild - 1].hWnd = hChild;         // Set child windows handle
                    g_child[g_iNumChild - 1].hDC = GetDC(hChild);   // Set child windows device context

                    PIXELFORMATDESCRIPTOR pfd;
                    ZeroMemory(&pfd, sizeof(pfd));
                    pfd.nSize = sizeof(pfd);
                    pfd.nVersion = 1;
                    pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
                    pfd.iPixelType = PFD_TYPE_RGBA;
                    pfd.cColorBits = 24;
                    pfd.cDepthBits = 16;
                    pfd.iLayerType = PFD_MAIN_PLANE;
                    int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
                    SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);               // Set pixel format for this child

                    g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);  // Set childs rendering context
                    wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);     // Make this child the current DC and RC
                    InitGL();              // Initialize the rendering defaults for this child
                }
                break;

                case CM_FILE_NEW_TOP:
                {
                    HWND hChild;

                    if(g_iNumChild < g_iMaxChild)      // If the number of children hasn't reached the maximum
                        g_iNumChild++;                 // Increment the number of children
                    else
                        break;                         // Otherwise break out of the routine

                    char szWindowTitle[] = "Top";
                    //sprintf(szWindowTitle, "%d", g_iNumChild - 1);

                    CREATESTRUCT cs;
                    ZeroMemory(&cs, sizeof(CREATESTRUCT));

                    hChild = CreateWindowEx(
                    WS_EX_MDICHILD,
                    g_szChild2DClassName,
                    szWindowTitle,
                    WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    g_hMDIClient,
                    NULL,
                    g_hInst,
                    &cs
                    );

                    if(!hChild)
                    {
                        MessageBox(NULL, "2D Child creation failed.", "Error",
                        MB_ICONEXCLAMATION | MB_OK);
                    }

                    g_child[g_iNumChild - 1].iType = 3;             // Set child windows type
                    g_child[g_iNumChild - 1].hWnd = hChild;         // Set child windows handle
                    g_child[g_iNumChild - 1].hDC = GetDC(hChild);   // Set child windows device context

                    PIXELFORMATDESCRIPTOR pfd;
                    ZeroMemory(&pfd, sizeof(pfd));
                    pfd.nSize = sizeof(pfd);
                    pfd.nVersion = 1;
                    pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
                    pfd.iPixelType = PFD_TYPE_RGBA;
                    pfd.cColorBits = 24;
                    pfd.cDepthBits = 16;
                    pfd.iLayerType = PFD_MAIN_PLANE;
                    int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
                    SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);               // Set pixel format for this child

                    g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);  // Set childs rendering context
                    wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);     // Make this child the current DC and RC
                    InitGL();              // Initialize the rendering defaults for this child
                }
                break;

                case CM_FILE_NEW_LEFT:
                {
                    HWND hChild;

                    if(g_iNumChild < g_iMaxChild)      // If the number of children hasn't reached the maximum
                        g_iNumChild++;                 // Increment the number of children
                    else
                        break;                         // Otherwise break out of the routine

                    char szWindowTitle[] = "Left";
                    //sprintf(szWindowTitle, "%d", g_iNumChild - 1);

                    CREATESTRUCT cs;
                    ZeroMemory(&cs, sizeof(CREATESTRUCT));

                    hChild = CreateWindowEx(
                    WS_EX_MDICHILD,
                    g_szChild2DClassName,
                    szWindowTitle,
                    WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    CW_USEDEFAULT,
                    g_hMDIClient,
                    NULL,
                    g_hInst,
                    &cs
                    );

                    if(!hChild)
                    {
                        MessageBox(NULL, "2D Child creation failed.", "Error",
                        MB_ICONEXCLAMATION | MB_OK);
                    }

                    g_child[g_iNumChild - 1].iType = 4;             // Set child windows type
                    g_child[g_iNumChild - 1].hWnd = hChild;         // Set child windows handle
                    g_child[g_iNumChild - 1].hDC = GetDC(hChild);   // Set child windows device context

                    PIXELFORMATDESCRIPTOR pfd;
                    ZeroMemory(&pfd, sizeof(pfd));
                    pfd.nSize = sizeof(pfd);
                    pfd.nVersion = 1;
                    pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
                    pfd.iPixelType = PFD_TYPE_RGBA;
                    pfd.cColorBits = 24;
                    pfd.cDepthBits = 16;
                    pfd.iLayerType = PFD_MAIN_PLANE;
                    int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
                    SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);               // Set pixel format for this child

                    g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);  // Set childs rendering context
                    wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);     // Make this child the current DC and RC
                    InitGL();              // Initialize the rendering defaults for this child
                }
                break;

                case CM_WINDOW_TILEHORZ:
                    PostMessage(g_hMDIClient, WM_MDITILE, MDITILE_HORIZONTAL, 0);
                break;

                case CM_WINDOW_TILEVERT:
                    PostMessage(g_hMDIClient, WM_MDITILE, MDITILE_VERTICAL, 0);
                break;

                case CM_WINDOW_CASCADE:
                    PostMessage(g_hMDIClient, WM_MDICASCADE, 0, 0);
                break;

                case CM_WINDOW_ARRANGE:
                    PostMessage(g_hMDIClient, WM_MDIICONARRANGE, 0, 0);
                break;

                default:
                {
                    if(LOWORD(wParam) >= ID_MDI_FIRSTCHILD)
                    {
                        DefFrameProc(hWnd, g_hMDIClient, uMessage, wParam, lParam);
                    }
                    else
                    {
                        HWND hChild;
                        hChild = (HWND)SendMessage(g_hMDIClient, WM_MDIGETACTIVE, 0, 0);
                        if(hChild)
                        {
                            SendMessage(hChild, WM_COMMAND, wParam, lParam);
                        }
                    }
                }
            }
        }
        break;

        case WM_CLOSE:
        {
            int iLoop;
            if(g_iNumChild)                                      // If there are any children
            {
                for(iLoop = 0; iLoop < g_iNumChild; iLoop++)     // Send all children the WM_CLOSE to free up their DC and RC
                {
                    SendMessage(g_child[iLoop].hWnd, WM_CLOSE, 0, 0);
                }
            }
            delete[] g_child;                                     // Delete the array of children
            delete[] texture;
            delete[] vertex;
            delete[] polygon;
            DestroyWindow(hWnd);
        }
        break;

        case WM_DESTROY:
            PostQuitMessage(0);
        break;

        default:
            return DefFrameProc(hWnd, g_hMDIClient, uMessage, wParam, lParam);
    }
    return 0;
}

LRESULT CALLBACK Child3DWndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
{
    switch(uMessage)
    {
        case WM_KEYDOWN:
            key[wParam] = TRUE;
        break;

        case WM_KEYUP:
            key[wParam] = FALSE;
        break;
        case WM_LBUTTONDOWN:
            g_bMouseDrag = 1;                                     // Set mouse flag
            g_iMouseLastX = LOWORD(lParam);                       // Get mouse position
            g_iMouseLastY = HIWORD(lParam);
            SetCapture(hWnd);                                     // Capture the mouse
        break;

        case WM_MOUSEMOVE:
            if(g_bMouseDrag)                                       // If mouse flag set
            {
                g_iMouseDeltaX = LOWORD(lParam) - g_iMouseLastX;   // Get mouse deltas
                g_iMouseDeltaY = HIWORD(lParam) - g_iMouseLastY;
                g_iMouseLastX = LOWORD(lParam);                    // Get new mouse position
                g_iMouseLastY = HIWORD(lParam);
            }
        break;

        case WM_LBUTTONUP:
            g_bMouseDrag = 0;                                      // Clear mouse flag
            ReleaseCapture();                                      // Release the mouse capture
        break;

/*
        //This msg isn't posted if the mouse is captured
        case WM_NCMOUSEMOVE:
        {
            POINTS pts;
            if(g_bMouseDrag)
            {
                pts = MAKEPOINTS(lParam);
                g_iMouseDeltaX = pts.x - g_iMouseLastX;
                g_iMouseDeltaY = pts.y - g_iMouseLastY;
                g_iMouseLastX = pts.x;
                g_iMouseLastY = pts.y;
            }
        }
        break;
//*/

/* The following code paints the child window when necessary but isn't needed as we
repaint all of them each frame. */

/*
        case WM_PAINT:
        {
            int iThisChild;
            PAINTSTRUCT ps;
            BeginPaint(hWnd, &ps);
            iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
            wglMakeCurrent(g_child[iThisChild].hDC, g_child[iThisChild].hRC);
            GetClientRect(hWnd, &g_rectChild);
            if(g_rectChild.right > 0 && g_rectChild.bottom > 0)
                SetProjection(g_rectChild.right, g_rectChild.bottom);
            DrawGLScene();
            glFlush();
            SwapBuffers(hDC);
            EndPaint(hWnd, &ps);
        }
        break;
//*/
        case WM_CLOSE:
            g_iNumChild--;                                          // Decrement the number of child windows
            if(g_iNumChild == 0)                                    // If this is the last child window then just free the DC and RC
            {
                wglMakeCurrent( NULL, NULL );
                ReleaseDC(g_child[0].hWnd, g_child[0].hDC);
                wglDeleteContext(g_child[0].hRC);
            }
            else
            {
                int iLoop;
                int iThisChild;
                char szWindowTitle[20];
                iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
                ReleaseDC(g_child[iThisChild].hWnd, g_child[iThisChild].hDC);    // Free this childs DC and RC
                wglDeleteContext(g_child[iThisChild].hRC);
                if(iThisChild != g_iNumChild)                        // If this child isn't the last in the array of children
                {
                    for (iLoop = iThisChild; iLoop < (g_iNumChild); iLoop++)   // Loop from this child to the end of the array
                    {
                        g_child[iLoop] = g_child[iLoop + 1];         // Shift the children forward in the array
                        sprintf(szWindowTitle, "%d", iLoop);
                        SetWindowText(g_child[iLoop].hWnd, szWindowTitle);  // Renumber the children
                    }
                }
            }
        break;

        case WM_MDIACTIVATE:
        {
            HMENU hMenu, hFileMenu;
            UINT uEnableFlag;

            hMenu = GetMenu(g_hMainWindow);
            if(hWnd == (HWND)lParam)                               //being activated
            {
                uEnableFlag = MF_ENABLED;
            }
            else
            {
                uEnableFlag = MF_GRAYED;                           //being de-activated
            }
            EnableMenuItem(hMenu, 1, MF_BYPOSITION | uEnableFlag);
            EnableMenuItem(hMenu, 2, MF_BYPOSITION | uEnableFlag);

            hFileMenu = GetSubMenu(hMenu, 0);
            EnableMenuItem(hFileMenu, CM_FILE_SAVE, MF_BYCOMMAND | uEnableFlag);
            EnableMenuItem(hFileMenu, CM_FILE_SAVEAS, MF_BYCOMMAND | uEnableFlag);

            DrawMenuBar(g_hMainWindow);
        }
        break;

        case WM_COMMAND:
            switch(LOWORD(wParam))
            {
//              case CM_FILE_SAVE: etc
            }
        return 0;
    }
    return DefMDIChildProc(hWnd, uMessage, wParam, lParam);
}

void DrawWin32Text(HDC hDC, int right, int bottom, int x, int y)
{
    colorRGB = RGB(255, 255, 255);
    SetTextColor(hDC, colorRGB);              // Sets the text color
    SetBkMode(hDC, TRANSPARENT);              // Sets the text background to transparent
    MainRect.left = 0;                        // Set the whole screen as the drawing area
    MainRect.top = 0;
    MainRect.bottom = bottom;
    MainRect.right = right;
    ZeroMemory(&LogFont, sizeof(LogFont));
    LogFont.lfHeight = 14;                    // Font height
    LogFont.lfWidth = 8;                   // Font width
    LogFont.lfEscapement = 0;              // Text rotation for true type fonts. If this one is set then also set the next line to the same value
    LogFont.lfOrientation = 0;
    LogFont.lfWeight = FW_NORMAL;
    LogFont.lfItalic = 0;
    LogFont.lfUnderline = 0;
    LogFont.lfStrikeOut = 0;
    LogFont.lfCharSet = DEFAULT_CHARSET;
    LogFont.lfOutPrecision = OUT_DEFAULT_PRECIS;
    LogFont.lfClipPrecision = CLIP_DEFAULT_PRECIS;
    LogFont.lfQuality = DEFAULT_QUALITY;
    LogFont.lfPitchAndFamily = DEFAULT_PITCH;
    sprintf(LogFont.lfFaceName, "%s", "Arial");
    hFont = CreateFontIndirect(&LogFont);
    SaveDC(hDC);
    hOldFont = (HFONT)SelectObject(hDC, (HFONT)hFont);
    char tempstring[20];
    sprintf(tempstring, "%d", MouseX);
    DrawText(hDC, tempstring, 11, &MainRect, DT_NOCLIP | DT_LEFT | DT_BOTTOM | DT_WORDBREAK | DT_EDITCONTROL);
    SelectObject(hDC, (HFONT)hOldFont);
    DeleteObject(hFont);
    RestoreDC(hDC, -1);
}

LRESULT CALLBACK Child2DWndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
{
    switch(uMessage)
    {
        case WM_SIZE:
        {
            if(wParam != SIZE_MINIMIZED)
            {
                RECT WindowRect;
                GetClientRect(hWnd, &WindowRect);
                int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
                if(g_child[iThisChild].iType == 2)
                {
                    TopDepth = -0.5 * WindowRect.bottom + 10;
                    LeftDepth = -0.5 * WindowRect.right + 10;
                }
                if(g_child[iThisChild].iType == 3)
                {
                    FrontDepth = 0.5 * WindowRect.bottom - 10;
                    LeftDepth = -0.5 * WindowRect.right + 10;
                }
                if(g_child[iThisChild].iType == 4)
                {
                    FrontDepth = -0.5 * WindowRect.right + 10;
                    TopDepth = -0.5 * WindowRect.bottom + 10;
                }
            }
        }
        break;

        case WM_KEYDOWN:
            key[wParam] = TRUE;
        break;

        case WM_KEYUP:
            key[wParam] = FALSE;
        break;

        case WM_LBUTTONDOWN:
            g_bMouseDrag2 = 1;                                     // Set mouse flag
            g_iMouseLastX2 = LOWORD(lParam);                       // Get mouse position
            g_iMouseLastY2 = HIWORD(lParam);
            SetCapture(hWnd);                                     // Capture the mouse
        break;

        case WM_LBUTTONUP:
            g_bMouseDrag2 = 0;                                      // Clear mouse flag
            ReleaseCapture();                                      // Release the mouse capture
        break;

        case WM_MOUSEMOVE:
        {
            RECT WindowRect;
            GetClientRect(hWnd, &WindowRect);
            MouseX = LOWORD(lParam);
            MouseY = HIWORD(lParam);
            int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
            if(g_bMouseDrag2)                                       // If mouse flag set
            {
                if (MouseX < WindowRect.left || MouseX > WindowRect.right)
                {
                    MouseX = g_iMouseLastX2;
                }
                if (MouseY < WindowRect.top || MouseY > WindowRect.bottom)
                {
                    MouseY = g_iMouseLastY2;
                }
                g_iMouseDeltaX2 = MouseX - g_iMouseLastX2;   // Get mouse deltas
                g_iMouseDeltaY2 = MouseY - g_iMouseLastY2;
                g_iMouseLastX2 = MouseX;                    // Get new mouse position
                g_iMouseLastY2 = MouseY;
                if(g_child[iThisChild].iType == 2)
                {
                    vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0;   // Apply mouse deltas to cube rotation values
                    vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0;
                }
                if(g_child[iThisChild].iType == 3)
                {
                    vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0;   // Apply mouse deltas to cube rotation values
                    vertex[VertexNumber].z += (float)g_iMouseDeltaY2 * 1.0;
                }
                if(g_child[iThisChild].iType == 4)
                {
                    vertex[VertexNumber].z += (float)g_iMouseDeltaX2 * 1.0;   // Apply mouse deltas to cube rotation values
                    vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0;
                }
                SetPolygons();
            }

            if(!g_bMouseDrag2)
            {
            MouseX = (int)(LOWORD(lParam) + (-0.5 * WindowRect.right));
            if(g_child[iThisChild].iType == 3)
                MouseY = (int)(HIWORD(lParam) + (-0.5 * WindowRect.bottom));
            else
                MouseY = (int)(-1 * (HIWORD(lParam) + (-0.5 * WindowRect.bottom)));
            ShortestDistance = 10000;
            int Loop;
            int TempX;
            int TempY;
            for(Loop = 0; Loop < 8; Loop++)
            {
                iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
                if(g_child[iThisChild].iType == 2)
                {
                    TempX = (int)(MouseX - vertex[Loop].x);
                    TempY = (int)(MouseY - vertex[Loop].y);
                }
                if(g_child[iThisChild].iType == 3)
                {
                    TempX = (int)(MouseX - vertex[Loop].x);
                    TempY = (int)(MouseY - vertex[Loop].z);
                }
                if(g_child[iThisChild].iType == 4)
                {
                    TempX = (int)(MouseX - vertex[Loop].z);
                    TempY = (int)(MouseY - vertex[Loop].y);
                }
                if(sqrt((TempX * TempX) + (TempY * TempY)) < ShortestDistance)
                {
                    ShortestDistance = (int)(sqrt((TempX * TempX) + (TempY * TempY)));
                    VertexNumber = Loop;
                }
            }

            //int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
            //DrawWin32Text(g_child[iThisChild].hDC, WindowRect.right, WindowRect.bottom, 1, 1);
            }
            }
            break;

        case WM_CLOSE:
            g_iNumChild--;                                          // Decrement the number of child windows
            if(g_iNumChild == 0)                                    // If this is the last child window then just free the DC and RC
            {
                wglMakeCurrent( NULL, NULL );
                ReleaseDC(g_child[0].hWnd, g_child[0].hDC);
                wglDeleteContext(g_child[0].hRC);
            }
            else
            {
                int iLoop;
                int iThisChild;
                char szWindowTitle[20];
                iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
                ReleaseDC(g_child[iThisChild].hWnd, g_child[iThisChild].hDC);    // Free this childs DC and RC
                wglDeleteContext(g_child[iThisChild].hRC);
                if(iThisChild != g_iNumChild)                        // If this child isn't the last in the array of children
                {
                    for (iLoop = iThisChild; iLoop < (g_iNumChild); iLoop++)   // Loop from this child to the end of the array
                    {
                        g_child[iLoop] = g_child[iLoop + 1];         // Shift the children forward in the array
                        sprintf(szWindowTitle, "%d", iLoop);
                        SetWindowText(g_child[iLoop].hWnd, szWindowTitle);  // Renumber the children
                    }
                }
            }
        break;

        case WM_MDIACTIVATE:
        {
            HMENU hMenu, hFileMenu;
            UINT uEnableFlag;

            hMenu = GetMenu(g_hMainWindow);
            if(hWnd == (HWND)lParam)                               //being activated
            {
                uEnableFlag = MF_ENABLED;
            }
            else
            {
                uEnableFlag = MF_GRAYED;                           //being de-activated
            }
            EnableMenuItem(hMenu, 1, MF_BYPOSITION | uEnableFlag);
            EnableMenuItem(hMenu, 2, MF_BYPOSITION | uEnableFlag);

            hFileMenu = GetSubMenu(hMenu, 0);
            EnableMenuItem(hFileMenu, CM_FILE_SAVE, MF_BYCOMMAND | uEnableFlag);
            EnableMenuItem(hFileMenu, CM_FILE_SAVEAS, MF_BYCOMMAND | uEnableFlag);

            DrawMenuBar(g_hMainWindow);
        }
        break;

        case WM_COMMAND:
            switch(LOWORD(wParam))
            {
//              case CM_FILE_SAVE: etc
            }
        return 0;
    }
    return DefMDIChildProc(hWnd, uMessage, wParam, lParam);
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int nCmdShow)
{
    MSG Msg;
    WNDCLASSEX wc;
    g_hInst = hInstance;

    // Create an OpenGL compatible window class
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS;
    wc.lpfnWndProc = (WNDPROC)Child3DWndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);    // Background color (Only seen if OGL fails)
    wc.lpszMenuName = NULL;
    wc.lpszClassName = g_szChild3DClassName;
    wc.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));

    if(!RegisterClassEx(&wc))
    {
        MessageBox(NULL,"Failed to register the child window.","Error",MB_OK|MB_ICONEXCLAMATION);
        return FALSE;
    }

    // Create an OpenGL compatible window class
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS;
    wc.lpfnWndProc = (WNDPROC)Child2DWndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);    // Background color (Only seen if OGL fails)
    wc.lpszMenuName = NULL;
    wc.lpszClassName = g_szChild2DClassName;
    wc.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));

    if(!RegisterClassEx(&wc))
    {
        MessageBox(NULL,"Failed to register the child window.","Error",MB_OK|MB_ICONEXCLAMATION);
        return FALSE;
    }

    // Create the frame window
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.style = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc = (WNDPROC)WndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);
    wc.lpszMenuName = "MAIN";
    wc.lpszClassName = g_szMainClassName;
    wc.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));

    if(!RegisterClassEx(&wc))
    {
        MessageBox(0, "Failed to register the main window.", "Error",
        MB_ICONEXCLAMATION | MB_OK);
        return -1;
    }

    g_hMainWindow = CreateWindowEx(WS_EX_LEFT, g_szMainClassName, "Al's OpenGL MDI Example",
    WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN,
    CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
    NULL, NULL, hInstance, NULL);

    if(g_hMainWindow == NULL)
    {
        MessageBox(0, "Failed to create window.", "ERROR", MB_ICONEXCLAMATION | MB_OK);
        return -1;
    }

    ShowWindow(g_hMainWindow, nCmdShow);
    UpdateWindow(g_hMainWindow);
    SetVertices();
    SetPolygons();

    int iLoop;
    while(GetMessage(&Msg, NULL, 0, 0))
    {
        if(!TranslateMDISysAccel(g_hMDIClient, &Msg))
        {
            TranslateMessage(&Msg);
            DispatchMessage(&Msg);
        }

        if(g_iNumChild)                                        // If we have some children
        {
            for(iLoop = 0; iLoop < g_iNumChild; iLoop++)       // Loop through all children
            {
                if(!IsIconic(g_child[iLoop].hWnd))             // If child isn't iconic (minimized)
                {
                    wglMakeCurrent(g_child[iLoop].hDC, g_child[iLoop].hRC);  // Make them the current DC and RC
                    GetClientRect(g_child[iLoop].hWnd, &g_rectChild);
                    if(g_rectChild.right > 0 && g_rectChild.bottom > 0)
                    {
                        if(g_child[iLoop].iType == 1)
                        {
                            Set3DProjection(g_rectChild.right, g_rectChild.bottom);// Set the childs projection matrix
                            Draw3DScene();
                        }
                        else
                        {
                            Set2DProjection(g_rectChild.right, g_rectChild.bottom);// Set the childs projection matrix
                            switch(g_child[iLoop].iType)
                            {
                                case 2:
                                    Draw2DSceneFront(g_child[iLoop].hWnd);
                                break;

                                case 3:
                                    Draw2DSceneTop(g_child[iLoop].hWnd);
                                break;

                                case 4:
                                    Draw2DSceneLeft(g_child[iLoop].hWnd);
                                break;
                            }
                        }
                    }
                    glFlush();
                    SwapBuffers(g_child[iLoop].hDC);

                    if (key[49])
                    {
                        if (Zoom < 1)
                            Zoom += 0.001;
                    }

                    if (key[50])
                    {
                        if (Zoom > 0)
                            Zoom -= 0.001;
                    }

                    if (key[51])
                    {
                        VerticalShift += 1;
                    }

                    if (key[52])
                    {
                        VerticalShift -= 1;
                    }

                    if (key[53])
                    {
                        HorizontalShift += 1;
                    }

                    if (key[54])
                    {
                        HorizontalShift -= 1;
                    }

                    if (key[VK_SPACE])
                    {
                        SetVertices();
                        SetPolygons();
                    }

                }
            }
        }
    }
    return Msg.wParam;
}

/*

If you use this code then give me credit and a link back to my site.

btw
The strange comment style you see in the code is a handy way to temporarily comment out blocks of
code. By removing the first forward slash the code is disabled and to enable just add the first
slash again. This saves having to run up and down the code adding and removing the first and last
comment delimiters.

ex.

//*
working code
//*/

/*
disabled code
//*/

                                         


