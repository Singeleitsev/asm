;Application procedures
AboutProc PROTO
BuildLightingDisplayList PROTO
CameraDrag PROTO lParam:DWORD
CameraDolly PROTO wParam:DWORD
CameraMove PROTO ;ecx = axis:DWORD ;xmm0 = magnitude:REAL4
CameraWalkMagnitude PROTO ;xmm0 = direction:REAL4
CameraRotate PROTO lParam:DWORD
CloseGL PROTO hWnd:DWORD
CloseWndProc PROTO hWnd:DWORD
DrawScene PROTO
FloatToANSI PROTO binFloatValue:DWORD, pszOutput:DWORD
GetDefaults PROTO
GetGlobalOrigin PROTO ;edx = pMtxLocal:DWORD ;edx = pVecGlobal:DWORD
InitGL PROTO
InitLogger PROTO
ObjectMove PROTO ;ecx = axis:DWORD ;xmm0 = magnitude:REAL4
ObjectMoveMagnitude PROTO ;xmm0 = direction:REAL4
ObjectRotate PROTO lParam:DWORD
parseMtlFile PROTO
parseObjFile PROTO
SetGlobalOrigin PROTO ;edx = pMtxLocal:DWORD ;edx = pVecGlobal:DWORD
ResetScene PROTO
Tick PROTO
WndProc PROTO hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
WriteLog PROTO pszText:DWORD

;Custom  Procedures
DrawCube PROTO xCenter:REAL4, yCenter:REAL4, zCenter:REAL4, xSize:REAL4, ySize:REAL4, zSize:REAL4, red:REAL4, green:REAL4, blue:REAL4
DrawVoxelCylinder PROTO cylRadius:REAL4, cylCount:DWORD, cylLayers:DWORD, cylCubeSize:REAL4, cylLayerH:REAL4
DrawVoxelRing PROTO vRadius:REAL4, vCount:DWORD, vCubeSize:REAL4, vHeight:REAL4, vZBase:REAL4, vSeed:DWORD

;Kernel32
CloseHandle PROTO hObject:DWORD
CreateFileA PROTO lpFileName:DWORD, dwDesiredAccess:DWORD, dwShareMode:DWORD, lpSecurityAttributes:DWORD, dwCreationDisposition:DWORD, dwFlagsAndAttributes:DWORD, hTemplateFile:DWORD
CheckMenuItem PROTO hMenu:DWORD,uIDCheckItem:DWORD,uCheck:DWORD
ExitProcess PROTO uExitCode:DWORD
GetModuleHandleA PROTO lpModuleName:DWORD
GetLastError PROTO
lstrlenA PROTO lpString:DWORD
QueryPerformanceCounter PROTO lpPerformanceCount:DWORD
QueryPerformanceFrequency PROTO lpFrequency:DWORD
Sleep PROTO dwMilliseconds:DWORD
WriteFile PROTO hFile:DWORD, lpBuffer:DWORD, nNumberOfBytesToWrite:DWORD, lpNumberOfBytesWritten:DWORD, lpOverlapped:DWORD

;User32
AppendMenuA PROTO hMenu:DWORD, uFlags:DWORD, uIDNewItem:DWORD, lpNewItem:DWORD
CreateAcceleratorTableA PROTO paccel:DWORD, cAccel:DWORD
CreateMenu PROTO
CreatePopupMenu PROTO
CreateWindowExA PROTO dwExStyle:DWORD, lpClassName:DWORD, lpWindowName:DWORD, dwStyle:DWORD, x:DWORD, y:DWORD, nWidth:DWORD, nHeight:DWORD, hWndParent:DWORD, hMenu:DWORD, hInstance:DWORD, lpParam:DWORD
DefWindowProcA PROTO hWnd:DWORD, Msg:DWORD, wParam:DWORD, lParam:DWORD
DestroyAcceleratorTable PROTO hAccel:DWORD
DestroyWindow PROTO hWnd:DWORD
DispatchMessageA PROTO lpMsg:DWORD
DrawMenuBar PROTO hWnd:DWORD
GetClientRect PROTO hWnd:DWORD, lpRect:DWORD
GetDC PROTO hWnd:DWORD
KillTimer  PROTO hWnd:DWORD, uIDEvent:DWORD
LoadCursorA PROTO hInstance:DWORD, lpCursorName:DWORD
LoadIconA PROTO hInstance:DWORD, lpIconName:DWORD
MessageBoxA PROTO hWnd:DWORD, lpText:DWORD, lpCaption:DWORD, uType:DWORD
PeekMessageA PROTO lpMsg:DWORD, hWnd:DWORD, wMsgFilterMin:DWORD, wMsgFilterMax:DWORD, wRemoveMsg:DWORD
PostQuitMessage PROTO nExitCode:DWORD
ReleaseCapture PROTO 
ReleaseDC PROTO hWnd:DWORD, hdc:DWORD
RegisterClassExA PROTO lpWndClass:DWORD
SendMessageA PROTO hWnd:DWORD, Msg:DWORD, wParam:DWORD, lParam:DWORD
SetCapture PROTO hWnd:DWORD
SetFocus PROTO hWnd:DWORD
SetForegroundWindow PROTO hWnd:DWORD
SetMenu PROTO hWnd:DWORD, hMenu:DWORD
SetTimer   PROTO hWnd:DWORD, nIDEvent:DWORD, uElapse:DWORD, lpTimerFunc:DWORD
SetWindowTextA PROTO hWnd:DWORD, lpString:DWORD
ShowWindow PROTO hWnd:DWORD, nCmdShow:DWORD
TranslateAcceleratorA PROTO hWnd:DWORD, hAccTable:DWORD, lpMsg:DWORD
TranslateMessage PROTO lpMsg:DWORD
UpdateWindow PROTO hWnd:DWORD

;Comctl32
InitCommonControlsEx PROTO picce:DWORD

;Gdi32
ChoosePixelFormat PROTO hdc:DWORD, ppfd:DWORD
DescribePixelFormat PROTO hdc:DWORD, iFormat:DWORD, nBytes:DWORD, ppfd:DWORD
GetStockObject PROTO i:DWORD
SetPixelFormat PROTO hdc:DWORD, iFormat:DWORD, ppfd:DWORD
SwapBuffers PROTO hdc:DWORD

;Opengl32 context
glGetString PROTO nName:DWORD
wglCreateContext PROTO hdc:DWORD
wglDeleteContext PROTO hGLRC:DWORD
wglMakeCurrent PROTO hdc:DWORD, hGLRC:DWORD
;wglGetLastError

;Opengl32 state / matrices
glCallList PROTO list:DWORD
glClear PROTO dwMask:DWORD
glClearColor PROTO red:REAL4, green:REAL4, blue:REAL4, alpha:REAL4
glCullFace PROTO eMode:DWORD
glDepthFunc PROTO func:DWORD
glDepthMask PROTO flag:DWORD
glDisable PROTO cap:DWORD
glEnable PROTO cap:DWORD
glEndList PROTO
glFrontFace PROTO eMode:DWORD
glGetFloatv PROTO pname:DWORD, params:DWORD
glHint PROTO target:DWORD, eMode:DWORD
glLoadIdentity PROTO
glLoadMatrixf PROTO m:DWORD
glMatrixMode PROTO eMode:DWORD
glMultMatrixf PROTO m:DWORD
glNewList PROTO list:DWORD,mode:DWORD
glPopMatrix PROTO
glPushMatrix PROTO
glRotatef PROTO Angle:REAL4, x:REAL4, y:REAL4, z:REAL4
glShadeModel PROTO eMode:DWORD
glTranslatef PROTO x:REAL4, y:REAL4, z:REAL4
glViewport PROTO x:DWORD, y:DWORD, nWidth:DWORD, nHeight:DWORD

;Opengl32 immediate mode (axes only)
glBegin PROTO eMode:DWORD
glColor3f PROTO red:REAL4, green:REAL4, blue:REAL4
glEnd PROTO
glVertex3f PROTO x:REAL4, y:REAL4, z:REAL4

;Opengl32 lighting / materials
glColorMaterial PROTO face:DWORD, eMode:DWORD
glLightfv PROTO light:DWORD, pname:DWORD, params:DWORD
glMaterialf PROTO face:DWORD, pname:DWORD, params:REAL4
glMaterialfv PROTO face:DWORD, pname:DWORD, params:DWORD
glNormal3f PROTO nx:REAL4, ny:REAL4, nz:REAL4

;Opengl32 vertex arrays (core GL 1.1)
glColorPointer PROTO nSize:DWORD, eType:DWORD, nStride:DWORD, pData:DWORD
glDisableClientState PROTO capName:DWORD
glDrawArrays PROTO eMode:DWORD, nFirst:DWORD, nCount:DWORD
glEnableClientState PROTO capName:DWORD
glNormalPointer PROTO eType:DWORD, nStride:DWORD, pData:DWORD
glVertexPointer PROTO nSize:DWORD, eType:DWORD, nStride:DWORD, pData:DWORD

;Glu32
gluPerspective PROTO fovy:REAL8, aspect:REAL8, zNear:REAL8, zFar:REAL8


