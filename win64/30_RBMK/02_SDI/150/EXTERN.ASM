;Application procedures
AboutProc PROTO
BuildGeometry PROTO
BuildLightingDisplayList PROTO
CameraDrag PROTO lParam:QWORD
CameraDolly PROTO wParam:QWORD
CameraMove PROTO ;rcx = axis:DWORD ;xmm0 = magnitude:REAL4
CameraWalkMagnitude PROTO ;xmm0 = direction:REAL4
CameraRotate PROTO lParam:QWORD
CloseGL PROTO hWnd:QWORD
CloseWndProc PROTO hWnd:QWORD
FloatToANSI PROTO binFloatValue:QWORD,pszOutput:QWORD
DrawScene PROTO
GetDefaults PROTO
GetGlobalOrigin PROTO ;rcx = pMtxLocal:QWORD ;rdx = pVecGlobal:QWORD
InitGL PROTO
InitLogger PROTO
ObjectMove PROTO ;rcx = axis:DWORD ;xmm0 = magnitude:REAL4
ObjectMoveMagnitude PROTO ;xmm0 = direction:REAL4
ObjectRotate PROTO lParam:QWORD
SetGlobalOrigin PROTO ;rcx = pMtxLocal:QWORD ;rdx = pVecGlobal:QWORD
SetShaders PROTO
SetVBO PROTO
SpellEAX PROTO
ResetScene PROTO
WndProc PROTO hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
WriteLog PROTO pszText:QWORD
WriteDecimalToLog PROTO nNumber:QWORD

;Kernel32
CloseHandle PROTO hObject:QWORD
CreateFileA PROTO lpFileName:QWORD, dwDesiredAccess:QWORD, dwShareMode:QWORD, lpSecurityAttributes:QWORD, dwCreationDisposition:QWORD, dwFlagsAndAttributes:QWORD, hTemplateFile:QWORD
CheckMenuItem PROTO hMenu:QWORD,uIDCheckItem:QWORD,uCheck:QWORD
ExitProcess PROTO uExitCode:QWORD
GetModuleHandleA PROTO lpModuleName:QWORD
GetLastError PROTO
GetProcessHeap PROTO
HeapAlloc PROTO hHeap:QWORD,dwFlags:QWORD,dwBytes:QWORD
lstrlenA PROTO lpString:QWORD
QueryPerformanceCounter PROTO lpPerformanceCount:QWORD
QueryPerformanceFrequency PROTO lpFrequency:QWORD
Sleep PROTO dwMilliseconds:QWORD
WriteFile PROTO hFile:QWORD, lpBuffer:QWORD, nNumberOfBytesToWrite:QWORD, lpNumberOfBytesWritten:QWORD, lpOverlapped:QWORD

;User32
AppendMenuA PROTO hMenu:QWORD, uFlags:QWORD, uIDNewItem:QWORD, lpNewItem:QWORD
CreateAcceleratorTableA PROTO paccel:QWORD, cAccel:QWORD
CreateMenu PROTO
CreatePopupMenu PROTO
CreateWindowExA PROTO dwExStyle:QWORD, lpClassName:QWORD, lpWindowName:QWORD, dwStyle:QWORD, x:QWORD, y:QWORD, nWidth:QWORD, nHeight:QWORD, hWndParent:QWORD, hMenu:QWORD, hInstance:QWORD, lpParam:QWORD
DefWindowProcA PROTO hWnd:QWORD, Msg:QWORD, wParam:QWORD, lParam:QWORD
DestroyAcceleratorTable PROTO hAccel:QWORD
DestroyWindow PROTO hWnd:QWORD
DispatchMessageA PROTO lpMsg:QWORD
DrawMenuBar PROTO hWnd:QWORD
GetClientRect PROTO hWnd:QWORD, lpRect:QWORD
GetDC PROTO hWnd:QWORD
KillTimer  PROTO hWnd:QWORD, uIDEvent:QWORD
LoadCursorA PROTO hInstance:QWORD, lpCursorName:QWORD
LoadIconA PROTO hInstance:QWORD, lpIconName:QWORD
MessageBoxA PROTO hWnd:QWORD, lpText:QWORD, lpCaption:QWORD, uType:QWORD
PeekMessageA PROTO lpMsg:QWORD, hWnd:QWORD, wMsgFilterMin:QWORD, wMsgFilterMax:QWORD, wRemoveMsg:QWORD
PostQuitMessage PROTO nExitCode:QWORD
ReleaseCapture PROTO 
ReleaseDC PROTO hWnd:QWORD, hdc:QWORD
RegisterClassExA PROTO lpWndClass:QWORD
SendMessageA PROTO hWnd:QWORD, Msg:QWORD, wParam:QWORD, lParam:QWORD
SetCapture PROTO hWnd:QWORD
SetFocus PROTO hWnd:QWORD
SetForegroundWindow PROTO hWnd:QWORD
SetMenu PROTO hWnd:QWORD, hMenu:QWORD
SetTimer   PROTO hWnd:QWORD, nIDEvent:QWORD, uElapse:QWORD, lpTimerFunc:QWORD
SetWindowTextA PROTO hWnd:QWORD, lpString:QWORD
ShowWindow PROTO hWnd:QWORD, nCmdShow:QWORD
TranslateAcceleratorA PROTO hWnd:QWORD, hAccTable:QWORD, lpMsg:QWORD
TranslateMessage PROTO lpMsg:QWORD
UpdateWindow PROTO hWnd:QWORD

;Comctl32
InitCommonControlsEx PROTO picce:QWORD

;Gdi32
ChoosePixelFormat PROTO hdc:QWORD, ppfd:QWORD
DescribePixelFormat PROTO hdc:QWORD, iFormat:QWORD, nBytes:QWORD, ppfd:QWORD
GetStockObject PROTO i:QWORD
SetPixelFormat PROTO hdc:QWORD, iFormat:QWORD, ppfd:QWORD
SwapBuffers PROTO hdc:QWORD

;Opengl32 context
glGetString PROTO nName:QWORD
wglCreateContext PROTO hdc:QWORD
wglDeleteContext PROTO hGLRC:QWORD
wglMakeCurrent PROTO hdc:QWORD, hGLRC:QWORD
;wglGetLastError

;Opengl32 state / matrices
glCallList PROTO list:QWORD
glClear PROTO dwMask:QWORD
glClearColor PROTO red:REAL4, green:REAL4, blue:REAL4, alpha:REAL4
glCullFace PROTO eMode:QWORD
glDepthFunc PROTO func:QWORD
glDepthMask PROTO flag:QWORD
glDisable PROTO cap:QWORD
glEnable PROTO cap:QWORD
glEndList PROTO
glFrontFace PROTO eMode:QWORD
glGetFloatv PROTO pname:QWORD, params:QWORD
glHint PROTO target:QWORD, eMode:QWORD
glLoadIdentity PROTO
glLoadMatrixf PROTO m:QWORD
glMatrixMode PROTO eMode:QWORD
glMultMatrixf PROTO m:QWORD
glNewList PROTO list:QWORD,mode:QWORD
glPopMatrix PROTO
glPushMatrix PROTO
glRotatef PROTO Angle:REAL4, x:REAL4, y:REAL4, z:REAL4
glShadeModel PROTO eMode:QWORD
glTranslatef PROTO x:REAL4, y:REAL4, z:REAL4
glViewport PROTO x:QWORD, y:QWORD, nWidth:QWORD, nHeight:QWORD

;Opengl32 lighting / materials
glColorMaterial PROTO face:QWORD, eMode:QWORD
glLightfv PROTO light:QWORD, pname:QWORD, params:QWORD
glMaterialf PROTO face:QWORD, pname:QWORD, params:REAL4
glMaterialfv PROTO face:QWORD, pname:QWORD, params:QWORD

;Opengl32 vertex arrays (core GL 1.1)
glColorPointer PROTO nSize:QWORD, eType:QWORD, nStride:QWORD, pData:QWORD
glDisableClientState PROTO capName:QWORD
glDrawElements PROTO mode:QWORD, count:QWORD, dwType:QWORD, indices:QWORD
glEnableClientState PROTO capName:QWORD
glNormalPointer PROTO eType:QWORD, nStride:QWORD, pData:QWORD
glVertexPointer PROTO nSize:QWORD, eType:QWORD, nStride:QWORD, pData:QWORD

;Glu32
gluPerspective PROTO fovy:REAL8, aspect:REAL8, zNear:REAL8, zFar:REAL8

;Loader for the Entry Points from the vendor's driver DLL
wglGetProcAddress PROTO pName:QWORD


