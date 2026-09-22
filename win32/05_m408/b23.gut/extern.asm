;Application procedures
AboutProc PROTO
CameraWalk PROTO distance:REAL4, axis:DWORD
CloseGL PROTO hWnd:DWORD
CloseWndProc PROTO hWnd:DWORD
DrawScene PROTO
GetDefaults PROTO
InitGL PROTO
InitLogger PROTO
ModelRotate PROTO angle:REAL4, xVector:REAL4,yVector:REAL4,zVector:REAL4
parseMtlFile PROTO
parseObjFile PROTO
ResetScene PROTO
Tick PROTO
WndProc PROTO hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
WriteLog PROTO pszText:DWORD

;Kernel32
CloseHandle PROTO hObject:DWORD
CreateFileA PROTO lpFileName:DWORD, dwDesiredAccess:DWORD, dwShareMode:DWORD, lpSecurityAttributes:DWORD, dwCreationDisposition:DWORD, dwFlagsAndAttributes:DWORD, hTemplateFile:DWORD
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
ReleaseDC PROTO hWnd:DWORD, hdc:DWORD
RegisterClassExA PROTO lpWndClass:DWORD
SendMessageA PROTO hWnd:DWORD, Msg:DWORD, wParam:DWORD, lParam:DWORD
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
wglCreateContext PROTO hdc:DWORD
wglDeleteContext PROTO hGLRC:DWORD
wglMakeCurrent PROTO hdc:DWORD, hGLRC:DWORD
;wglGetLastError

;Opengl32 state / matrices
glClear PROTO dwMask:DWORD
glClearColor PROTO red:REAL4, green:REAL4, blue:REAL4, alpha:REAL4
glCullFace PROTO eMode:DWORD
glDisable PROTO cap:DWORD
glEnable PROTO cap:DWORD
glFrontFace PROTO eMode:DWORD
glGetFloatv PROTO pname:DWORD, params:DWORD
glHint PROTO target:DWORD, eMode:DWORD
glLoadIdentity PROTO
glLoadMatrixf PROTO m:DWORD
glMatrixMode PROTO eMode:DWORD
glMultMatrixf PROTO m:DWORD
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
glMaterialfv PROTO face:DWORD, pname:DWORD, params:DWORD

;Opengl32 vertex arrays (core GL 1.1)
glColorPointer PROTO nSize:DWORD, eType:DWORD, nStride:DWORD, pData:DWORD
glDisableClientState PROTO capName:DWORD
glDrawArrays PROTO eMode:DWORD, nFirst:DWORD, nCount:DWORD
glEnableClientState PROTO capName:DWORD
glNormalPointer PROTO eType:DWORD, nStride:DWORD, pData:DWORD
glVertexPointer PROTO nSize:DWORD, eType:DWORD, nStride:DWORD, pData:DWORD

;Glu32
gluPerspective PROTO fovy:REAL8, aspect:REAL8, zNear:REAL8, zFar:REAL8


