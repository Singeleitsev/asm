/*
                                   OpenGL MDI Example

                                 Program by Alan Baylis 
                                  Copyright 24/01/2001


This program demonstrates a Win32 MDI application with OpenGL compatible child windows.

This code may be freely modified and redistributed but I make no warrantees about it; use at your own risk. If you use this code then give me credit and a link back to this site.
An email or a post to my message board of where we could find your program would be nice too.

*/

#include <windows.h>
#include <gl\gl.h>
#include <gl\glu.h>
#include <stdio.h>
#include <stdlib.h>                            // Header for Visual Component Library required for USERC(...);
#include "resource.h"                            // Header for resource file

#define ID_MDI_CLIENT      4999             // ID for client menu
#define ID_MDI_FIRSTCHILD  50000            // Start ID for child windows

char g_szMainClassName[] = "MainWindow";
char g_szChildClassName[] = "OpenGL";
HINSTANCE g_hInst;
HWND g_hMDIClient;
HWND g_hMainWindow;
RECT g_rectChild;                         // RECT structure required to get the child window dimensions

float    g_fCubeRotationX, g_fCubeRotationY;      

bool g_bMouseDrag = 0;                         // Mouse capture flag
int g_iMouseLastX;                             // Holds previous X position of mouse
int g_iMouseLastY;                             // Holds previous Y position of mouse
int g_iMouseDeltaX;                            // Holds the mouse increment in X since LastX
int g_iMouseDeltaY;                            // Holds the mouse increment in Y since LastY

typedef struct CHILD                        // Child structure for each child window
{
    HDC hDC;                                // Individual device context
    HGLRC hRC;                              // Individual rendering context
    HWND hWnd;                              // Handle to child window
} CHILD;

int g_iMaxChild = 50;                          // Maximum number of child windows wanted
int g_iNumChild = 0;                           // Number of child windows created
CHILD* g_child = new CHILD[g_iMaxChild];         // Create the CHILD structures

/* Set the rendering options for OpenGL */
void InitGL()
{
    glCullFace(GL_BACK);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClearDepth(1.0);
    glDepthFunc(GL_LESS);
    glEnable(GL_DEPTH_TEST);
    glShadeModel(GL_SMOOTH);
    glEnable(GL_NORMALIZE);

    float MatAmbient[] = {0.8, 0.8, 0.8, 1.0};
    float MatDiffuse[] = {0.8, 0.8, 0.8, 1.0};
    float MatSpecular[] = {0.9, 0.9, 0.9, 1.0};
    float MatEmmision[] = {0.0, 0.0, 0.0, 1.0};
    float MatShininess[] = {100.0};

    glMaterialfv(GL_FRONT, GL_AMBIENT, MatAmbient);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, MatDiffuse);
    glMaterialfv(GL_FRONT, GL_SPECULAR, MatSpecular);
    glMaterialfv(GL_FRONT, GL_EMISSION, MatEmmision);
    glMaterialfv(GL_FRONT, GL_SHININESS, MatShininess);

    float LightAmbient[] = {0.2, 0.2, 0.2, 1.0};
    glLightfv(GL_LIGHT0, GL_AMBIENT, LightAmbient);
    float LightPosition[] = {-3.0, 2.0, 1.0, 1.0};
    glLightfv(GL_LIGHT0, GL_POSITION, LightPosition);

    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_CULL_FACE);
}

/* Sets the Projection matrix. The Modelview matrix is set in the DrawGLScene routine */
void SetProjection(int iWidth, int iHeight)
{
    if(iHeight == 0)
    {
        iHeight = 1;
    }
    glViewport(0, 0, iWidth, iHeight);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,(float)iWidth/(float)iHeight,0.1,200.0);
}

void DrawGLScene(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    if(g_bMouseDrag)        // If left mouse button is down
    {
        g_fCubeRotationX += (float)g_iMouseDeltaY * 0.5;   // Apply mouse deltas to cube rotation values
        g_fCubeRotationY += (float)g_iMouseDeltaX * 0.5;
    }

    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glPushMatrix();
    glTranslatef(0.0,0.0,-5.0);
    glRotatef(g_fCubeRotationX,1.0,0.0,0.0);
    glRotatef(g_fCubeRotationY,0.0,1.0,0.0);
    glBegin(GL_QUADS);
        // Front Face
        glColor3f(1.0,0.0,0.0);
        glVertex3f(-1.0, -1.0,  1.0);    // Bottom Left
        glColor3f(0.0,1.0,0.0);
        glVertex3f( 1.0, -1.0,  1.0);    // Bottom Right
        glColor3f(0.0,0.0,1.0);
        glVertex3f( 1.0,  1.0,  1.0);    // Top Right
        glColor3f(1.0,1.0,0.0);
        glVertex3f(-1.0,  1.0,  1.0);    // Top Left
        // Back Face
        glColor3f(0.0,0.0,1.0);
        glVertex3f(-1.0, -1.0, -1.0);    // Bottom Right
        glColor3f(0.0,1.0,0.0);
        glVertex3f(-1.0,  1.0, -1.0);    // Top Right
        glColor3f(1.0,0.0,0.0);
        glVertex3f( 1.0,  1.0, -1.0);    // Top Left
        glColor3f(1.0,1.0,0.0);
        glVertex3f( 1.0, -1.0, -1.0);    // Bottom Left
        // Top Face
        glColor3f(0.0,1.0,0.0);
        glVertex3f(-1.0,  1.0, -1.0);    // Top Left
        glColor3f(1.0,1.0,0.0);
        glVertex3f(-1.0,  1.0,  1.0);    // Bottom Left
        glColor3f(0.0,0.0,1.0);
        glVertex3f( 1.0,  1.0,  1.0);    // Bottom Right
        glColor3f(1.0,0.0,0.0);
        glVertex3f( 1.0,  1.0, -1.0);    // Top Right
        // Bottom Face
        glColor3f(0.0,0.0,1.0);
        glVertex3f(-1.0, -1.0, -1.0);    // Top Right
        glColor3f(1.0,1.0,0.0);
        glVertex3f( 1.0, -1.0, -1.0);    // Top Left
        glColor3f(0.0,1.0,0.0);
        glVertex3f( 1.0, -1.0,  1.0);    // Bottom Left
        glColor3f(1.0,0.0,0.0);
        glVertex3f(-1.0, -1.0,  1.0);    // Bottom Right
        // Right face
        glColor3f(1.0,1.0,0.0);
        glVertex3f( 1.0, -1.0, -1.0);    // Bottom Right
        glColor3f(1.0,0.0,0.0);
        glVertex3f( 1.0,  1.0, -1.0);    // Top Right
        glColor3f(0.0,0.0,1.0);
        glVertex3f( 1.0,  1.0,  1.0);    // Top Left
        glColor3f(0.0,1.0,0.0);
        glVertex3f( 1.0, -1.0,  1.0);    // Bottom Left
        // Left Face
        glColor3f(0.0,0.0,1.0);
        glVertex3f(-1.0, -1.0, -1.0);    // Bottom Left
        glColor3f(1.0,0.0,0.0);
        glVertex3f(-1.0, -1.0,  1.0);    // Bottom Right
        glColor3f(1.0,1.0,0.0);
        glVertex3f(-1.0,  1.0,  1.0);    // Top Right
        glColor3f(0.0,1.0,0.0);
        glVertex3f(-1.0,  1.0, -1.0);    // Top Left
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
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

                case CM_FILE_NEW:
                {
                    HWND hChild;

                    if(g_iNumChild < g_iMaxChild)      // If the number of children hasn't reached the maximum
                        g_iNumChild++;              // Increment the number of children
                    else
                        break;                   // Otherwise break out of the routine

                    char szWindowTitle[20];
                    sprintf(szWindowTitle, "%d", g_iNumChild - 1);

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
                    g_szChildClassName,
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
                        MessageBox(NULL, "Child creation failed.", "Error",
                        MB_ICONEXCLAMATION | MB_OK);
                    }

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
                    InitGL();                                                             // Initialize the rendering defaults for this child
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
            if(g_iNumChild)             // If there are any children
            {
                for(iLoop = 0; iLoop < g_iNumChild; iLoop++)     // Send all children the WM_CLOSE to free up their DC and RC
                {
                    SendMessage(g_child[iLoop].hWnd, WM_CLOSE, 0, 0);
                }
            }
            delete[] g_child;             // Delete the array of children
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

LRESULT CALLBACK MDIChildWndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
{
    switch(uMessage)
    {
        case WM_LBUTTONDOWN:
            g_bMouseDrag = 1;                // Set mouse flag
            g_iMouseLastX = LOWORD(lParam);  // Get mouse position
            g_iMouseLastY = HIWORD(lParam);
            SetCapture(hWnd);             // Capture the mouse
        break;

        case WM_MOUSEMOVE:
            if(g_bMouseDrag)                  // If mouse flag set
            {
                g_iMouseDeltaX = LOWORD(lParam) - g_iMouseLastX;   // Get mouse deltas
                g_iMouseDeltaY = HIWORD(lParam) - g_iMouseLastY;
                g_iMouseLastX = LOWORD(lParam);                 // Get new mouse position
                g_iMouseLastY = HIWORD(lParam);
            }
        break;

        case WM_LBUTTONUP:         // If left button is released
            g_bMouseDrag = 0;         // Clear mouse flag
            ReleaseCapture();      // Release the mouse capture
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
            g_iNumChild--;                       // Decrement the number of child windows
            if(g_iNumChild == 0)                 // If this is the last child window then just free the DC and RC
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
                if(iThisChild != g_iNumChild)                  // If this child isn't the last in the array of children
                {
                    for (iLoop = iThisChild; iLoop < (g_iNumChild); iLoop++)   // Loop from this child to the end of the array
                    {
                        g_child[iLoop] = g_child[iLoop + 1];       // Shift the children forward in the array
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
            if(hWnd == (HWND)lParam)       //being activated
            {
                uEnableFlag = MF_ENABLED;
            }
            else
            {
                uEnableFlag = MF_GRAYED;    //being de-activated
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
    wc.lpfnWndProc = (WNDPROC)MDIChildWndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);    // Background color (Only seen if OGL fails)
    wc.lpszMenuName = NULL;
    wc.lpszClassName = g_szChildClassName;
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

    int iLoop;
    while(GetMessage(&Msg, NULL, 0, 0))
    {
        if(!TranslateMDISysAccel(g_hMDIClient, &Msg))
        {
            TranslateMessage(&Msg);
            DispatchMessage(&Msg);
        }

        if(g_iNumChild)                             // If we have some children
        {
            for(iLoop = 0; iLoop < g_iNumChild; iLoop++)   // Loop through all children
            {
                if(!IsIconic(g_child[iLoop].hWnd))   // If child isn't iconic (minimized)
                {
                    wglMakeCurrent(g_child[iLoop].hDC, g_child[iLoop].hRC);  // Make them the current DC and RC
                    GetClientRect(g_child[iLoop].hWnd, &g_rectChild);
                    if(g_rectChild.right > 0 && g_rectChild.bottom > 0)
                        SetProjection(g_rectChild.right, g_rectChild.bottom);        // Set the childs projection matrix
                    DrawGLScene();
                    glFlush();
                    SwapBuffers(g_child[iLoop].hDC);
                }
            }
        }
    }
    return Msg.wParam;
}

/*

In this example I use the same draw routine for each child window. By adding a integer type
index to the child structure a different draw routine could be used based on the index. This
could then also be used to choose the type of child class to create and which child window
process to use.

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

                                         


