'For 32 bit & 64 bit
Option Explicit

'WinMain
Declare PtrSafe Function GetModuleHandleW Lib "Kernel32" (ByVal lpModuleName As LongPtr) As LongPtr
Declare PtrSafe Function LoadIconW Lib "User32" (ByVal hInstance As LongPtr, ByVal lpIconName As LongPtr) As LongPtr
Declare PtrSafe Function LoadCursorW Lib "User32" (ByVal hInstance As LongPtr, ByVal lpCursorName As LongPtr) As LongPtr
Declare PtrSafe Function GetStockObject Lib "Gdi32" (ByVal i As LongPtr) As LongPtr
Declare PtrSafe Function RegisterClassExW Lib "User32" (ByVal lpWndClass As LongPtr) As LongPtr
Declare PtrSafe Function CreateWindowExW Lib "User32" (ByVal dwExStyle As LongPtr, ByVal lpClassName As LongPtr, ByVal lpWindowName As LongPtr, ByVal dwStyle As LongPtr, ByVal x As LongPtr, ByVal y As LongPtr, ByVal nWidth As LongPtr, ByVal nHeight As LongPtr, ByVal hWndParent As LongPtr, ByVal hMenu As LongPtr, ByVal hInstance As LongPtr, ByVal lpParam As LongPtr) As LongPtr
Declare PtrSafe Function ShowWindow Lib "User32" (ByVal hWnd As LongPtr, ByVal nCmdShow As LongPtr) As LongPtr
Declare PtrSafe Function UpdateWindow Lib "User32" (ByVal hWnd As LongPtr) As LongPtr
Declare PtrSafe Function PeekMessageW Lib "User32" (ByVal lpMsg As LongPtr, ByVal hWnd As LongPtr, ByVal wMsgFilterMin As LongPtr, ByVal wMsgFilterMax As LongPtr, ByVal wRemoveMsg As LongPtr) As LongPtr
Declare PtrSafe Function TranslateAcceleratorW Lib "User32" (ByVal hWnd As LongPtr, ByVal hAccTable As LongPtr, ByVal lpMsg As LongPtr) As LongPtr
Declare PtrSafe Function TranslateMessage Lib "User32" (ByVal lpMsg As LongPtr) As LongPtr
Declare PtrSafe Function DispatchMessageW Lib "User32" (ByVal lpMsg As LongPtr) As LongPtr
Declare PtrSafe Function SendMessageW Lib "User32" (ByVal hWnd As LongPtr, ByVal Msg As LongPtr, ByVal wParam As LongPtr, ByVal lParam As LongPtr) As LongPtr
Declare PtrSafe Function GetLastError Lib "Kernel32" () As LongPtr
'WndProc
Declare PtrSafe Function MessageBoxW Lib "User32" (ByVal hWnd As LongPtr, ByVal lpText As LongPtr, ByVal lpCaption As LongPtr, ByVal uType As LongPtr) As LongPtr
Declare PtrSafe Function SetWindowTextW Lib "User32" (ByVal hWnd As LongPtr, ByVal lpString As LongPtr) As LongPtr
Declare PtrSafe Function GetCursorPos Lib "User32" (ByVal lpPoint As LongPtr) As LongPtr
Declare PtrSafe Function DefWindowProcW Lib "User32" (ByVal hWnd As LongPtr, ByVal Msg As LongPtr, ByVal wParam As LongPtr, ByVal lParam As LongPtr) As LongPtr
Declare PtrSafe Function DestroyWindow Lib "User32" (ByVal hWnd As LongPtr) As LongPtr
Declare PtrSafe Function PostQuitMessage Lib "User32" (ByVal nExitCode As LongPtr) As LongPtr
'PopupMenu
Declare PtrSafe Function CreateMenu Lib "User32" () As LongPtr
Declare PtrSafe Function CreatePopupMenu Lib "User32" () As LongPtr
Declare PtrSafe Function SetMenu Lib "User32" (ByVal hWnd As LongPtr, ByVal hMenu As LongPtr) As LongPtr
Declare PtrSafe Function DrawMenuBar Lib "User32" (ByVal hWnd As LongPtr) As LongPtr
Declare PtrSafe Function AppendMenuW Lib "User32" (ByVal hMenu As LongPtr, ByVal uFlags As LongPtr, ByVal uIDNewItem As LongPtr, ByVal lpNewItem As LongPtr) As LongPtr
'Declare PtrSafe Function CheckMenuItem Lib "User32" (ByVal hMenu As LongPtr, ByVal uIDCheckItem As LongPtr, ByVal uCheck As LongPtr) As LongPtr
Declare PtrSafe Function CreateAcceleratorTableW Lib "User32" (ByVal paccel As LongPtr, ByVal cAccel As LongPtr) As LongPtr
Declare PtrSafe Function DestroyAcceleratorTable Lib "User32" (ByVal hAccel As LongPtr) As LongPtr
'Declare PtrSafe Function DestroyMenu Lib "User32" (ByVal hMenu As LongPtr) As LongPtr
'StatusBar
Declare PtrSafe Function InitCommonControlsEx Lib "Comctl32" (ByVal picce As LongPtr) As LongPtr
'GDI & Paint
Declare PtrSafe Function GetDC Lib "User32" (ByVal hdc As LongPtr) As LongPtr
Declare PtrSafe Function ReleaseDC Lib "User32" (ByVal hWnd As LongPtr, ByVal hdc As LongPtr) As LongPtr
Declare PtrSafe Function DeleteDC Lib "Gdi32" (ByVal hdc As LongPtr) As LongPtr
Declare PtrSafe Function GetClientRect Lib "User32" (ByVal hWnd As LongPtr, ByVal lpRect As LongPtr) As LongPtr
Declare PtrSafe Function InvalidateRect Lib "User32" (ByVal hWnd As LongPtr, ByVal lpRect As LongPtr, ByVal bErase As LongPtr) As LongPtr
Declare PtrSafe Function ChoosePixelFormat Lib "Gdi32" (ByVal hdc As LongPtr, ByVal ppfd As LongPtr) As LongPtr
Declare PtrSafe Function SetPixelFormat Lib "Gdi32" (ByVal hdc As LongPtr, ByVal format As LongPtr, ByVal ppfd As LongPtr) As LongPtr
Declare PtrSafe Function SwapBuffers Lib "Gdi32" (ByVal hdc As LongPtr) As LongPtr
'OpenGL
Declare PtrSafe Function wglCreateContext Lib "Opengl32" (ByVal hdc As LongPtr) As LongPtr
Declare PtrSafe Function wglMakeCurrent Lib "Opengl32" (ByVal hdc As LongPtr, ByVal hGLRC As LongPtr) As LongPtr
Declare PtrSafe Function wglDeleteContext Lib "Opengl32" (ByVal hGLRC As LongPtr) As LongPtr
Declare PtrSafe Function glViewport Lib "Opengl32" (ByVal x As LongPtr, ByVal y As LongPtr, ByVal Width As LongPtr, ByVal height As LongPtr) As LongPtr
Declare PtrSafe Function glMatrixMode Lib "Opengl32" (ByVal mode As LongPtr) As LongPtr
Declare PtrSafe Function glLoadIdentity Lib "Opengl32" () As LongPtr
Declare PtrSafe Function glLoadMatrixf Lib "Opengl32" (ByVal M As LongPtr) As LongPtr
Declare PtrSafe Function glMultMatrixf Lib "Opengl32" (ByVal M As LongPtr) As LongPtr
Declare PtrSafe Function glTranslatef Lib "Opengl32" (ByVal x As Single, ByVal y As Single, ByVal z As Single) As LongPtr
Declare PtrSafe Function glRotatef Lib "Opengl32" (ByVal Angle As Single, ByVal x As Single, ByVal y As Single, ByVal z As Single) As LongPtr
Declare PtrSafe Function glScalef Lib "Opengl32" (ByVal x As Single, ByVal y As Single, ByVal z As Single) As LongPtr
Declare PtrSafe Function gluPerspective Lib "Glu32" (ByVal fovy As Double, ByVal aspect As Double, ByVal zNear As Double, ByVal zFar As Double) As LongPtr
Declare PtrSafe Function glPushMatrix Lib "Opengl32" () As LongPtr
Declare PtrSafe Function glPopMatrix Lib "Opengl32" () As LongPtr
Declare PtrSafe Function glGetFloatv Lib "Opengl32" (ByVal pname As LongPtr, ByVal params As LongPtr) As LongPtr
Declare PtrSafe Function glEnable Lib "Opengl32" (ByVal cap As LongPtr) As LongPtr
Declare PtrSafe Function glDisable Lib "Opengl32" (ByVal cap As LongPtr) As LongPtr
Declare PtrSafe Function glHint Lib "Opengl32" (ByVal target As LongPtr, ByVal mode As LongPtr) As LongPtr
Declare PtrSafe Function glClearColor Lib "Opengl32" (ByVal red As Single, ByVal green As Single, ByVal blue As Single, ByVal alpha As Single) As LongPtr
Declare PtrSafe Function glClear Lib "Opengl32" (ByVal mask As LongPtr) As LongPtr
Declare PtrSafe Function glBegin Lib "Opengl32" (ByVal mode As LongPtr) As LongPtr
Declare PtrSafe Function glEnd Lib "Opengl32" () As LongPtr
Declare PtrSafe Function glBlendFunc Lib "Opengl32" (ByVal sfactor As LongPtr, ByVal dfactor As LongPtr) As LongPtr
Declare PtrSafe Function glColor3f Lib "Opengl32" (ByVal red As Single, ByVal green As Single, ByVal blue As Single) As LongPtr
Declare PtrSafe Function glVertex3f Lib "Opengl32" (ByVal x As Single, ByVal y As Single, ByVal z As Single) As LongPtr
Declare PtrSafe Function glNormal3fv Lib "Opengl32" (ByVal v As LongPtr) As LongPtr
Declare PtrSafe Function glShadeModel Lib "Opengl32" (ByVal mode As LongPtr) As LongPtr
Declare PtrSafe Function glMaterialfv Lib "Opengl32" (ByVal face As LongPtr, ByVal pname As LongPtr, ByVal params As LongPtr) As LongPtr
Declare PtrSafe Function glLightfv Lib "Opengl32" (ByVal light As LongPtr, ByVal pname As LongPtr, ByVal params As LongPtr) As LongPtr
Declare PtrSafe Function glFlush Lib "Opengl32" ()

'Structures
'WNDCLASSEX wcx;
Type WNDCLASSEX
    cbSize As Long
    style As Long
    lpfnWndProc As LongPtr
    cbClsExtra As Long
    cbWndExtra As Long
    hInstance As LongPtr
    hIcon As LongPtr
    hCursor As LongPtr
    hbrBackground As LongPtr
    lpszMenuName As LongPtr
    lpszClassName As LongPtr
    hIconSm As LongPtr
End Type
Public wcx As WNDCLASSEX
Public lpWndClass As LongPtr 'Pointer
'POINT pt
Type POINT2D
    x As Long
    y As Long
End Type
Public pt As POINT2D
Public lpMsgPt As LongPtr
'MSG msg;
Type Msg
    hWnd As LongPtr
    message As Long
    wParam As LongPtr
    lParam As LongPtr
    time As Long
    pt As POINT2D
    lPrivate As LongPtr
End Type
Public wmsg As Msg
Public lpMsg As LongPtr 'Pointer
'RECT rct
Type RECT
    left As Long
    top As Long
    right As Long
    bottom As Long
End Type
Public RectMain As RECT
Public lpRectMain As LongPtr 'Pointer
Public RectWidth As Long
Public RectHeight As Long
Public RectAspect As Long
'PIXELFORMATDESCRIPTOR pfd = { 0 };
Type PIXELFORMATDESCRIPTOR
    nSize As Integer
    nVersion As Integer
    dwFlags As Long
    iPixelType As Byte
    cColorBits As Byte
    cRedBits As Byte
    cRedShift As Byte
    cGreenBits As Byte
    cGreenShift As Byte
    cBlueBits As Byte
    cBlueShift As Byte
    cAlphaBits As Byte
    cAlphaShift As Byte
    cAccumBits As Byte
    cAccumRedBits As Byte
    cAccumGreenBits As Byte
    cAccumBlueBits As Byte
    cAccumAlphaBits As Byte
    cDepthBits As Byte
    cStencilBits As Byte
    cAuxBuffers As Byte
    iLayerType As Byte
    bReserved As Byte
    dwLayerMask As Long
    dwVisibleMask As Long
    dwDamageMask As Long
End Type
Public pfd As PIXELFORMATDESCRIPTOR
Public lpPFD As LongPtr 'Pointer
'ACCEL accel;
Type ACCELSTRUCT
    fVirt As Integer
    'dummy As Byte
    key As Integer
    cmd As Integer
End Type
Public accel As ACCELSTRUCT
Public paccel As LongPtr 'Pointer
'INITCOMMONCONTROLSEX icce;
Type ICCESTRUCT
    dwSize As Long
    dwICC As Long
End Type
Public icce As ICCESTRUCT
Public lpIcce As LongPtr 'Pointer
'POINT3D
Type POINT3D
    x As Single
    y As Single
    z As Single
End Type
'POINT4D
Type POINT4D
    x As Single
    y As Single
    z As Single
    w As Single
End Type
'RGBA
Type RGBA
    r As Single
    g As Single
    b As Single
    a As Single
End Type

'Const
Public Const PM_REMOVE = 1
'Window Styles
Public Const CS_VREDRAW = 1
Public Const CS_HREDRAW = 2
Public Const CS_DBLCLKS = 8
Public Const IDI_APPLICATION = 32512
Public Const IDC_ARROW = 32512
Public Const CW_USEDEFAULT = &H80000000
Public Const WS_OVERLAPPED = 0
Public Const WS_CAPTION = &HC00000
Public Const WS_SYSMENU = &H80000
Public Const WS_THICKFRAME = &H40000
Public Const WS_MINIMIZEBOX = &H20000
Public Const WS_MAXIMIZEBOX = &H10000
Public Const WS_OVERLAPPEDWINDOW = WS_OVERLAPPED Or WS_CAPTION Or WS_SYSMENU Or WS_THICKFRAME Or WS_MINIMIZEBOX Or WS_MAXIMIZEBOX
Public Const WS_CLIPCHILDREN = &H2000000
Public Const WS_CLIPSIBLINGS = &H4000000
Public Const WS_VISIBLE = &H10000000
Public Const WS_CHILD = &H40000000
Public Const SW_SHOW = 5
'Messages
Public Const WM_CREATE = 1
Public Const WM_DESTROY = 2
Public Const WM_SIZE = 5
Public Const WM_ACTIVATE = 6
Public Const WM_CLOSE = &H10
Public Const WM_QUIT = &H12
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_COMMAND = &H111
Public Const WM_MOUSEMOVE = &H200
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONUP = &H205
Public Const WM_MBUTTONDOWN = &H207
Public Const WM_MBUTTONUP = &H208
Public Const WM_MBUTTONDBLCLK = &H209
Public Const WM_MOUSEWHEEL = &H20A
Public Const WM_USER = &H400
'Virtual Keys
Public Const MB_OK = 0
Public Const MB_YESNO = 4
Public Const MB_ICONQUESTION = &H20
Public Const MB_ICONINFORMATION = &H40
Public Const IDYES = 6
Public Const IDNO = 7
Public Const VK_TAB = 9
Public Const VK_RETURN = &HD
Public Const VK_SHIFT = &H10
Public Const VK_ESCAPE = &H1B
Public Const VK_SPACE = &H20
Public Const VK_F1 = &H70
'Brushes
Public Const GRAY_BRUSH = 2
'Status Bar
Public Const ICC_BAR_CLASSES = 4
Public Const SBARS_SIZEGRIP = &H100
Public Const SBT_NOBORDERS = &H101 '0x0100
Public Const SB_SETPARTS = WM_USER + 4 '0x0404
Public Const SB_SETTEXTW = WM_USER + 11 '0x040B
'Menu
Public Const TPM_LEFTALIGN = 0
Public Const TPM_TOPALIGN = 0
Public Const TPM_RIGHTBUTTON = 2
'https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-insertmenua
Public Const MF_STRING = 0
Public Const MF_SEPARATOR = &H800
Public Const MF_ENABLED = 0
Public Const MF_GRAYED = 1
Public Const MF_DISABLED = 2
Public Const MF_UNCHECKED = 0
Public Const MF_CHECKED = 8
Public Const MF_POPUP = &H10
'Accelerators
Public Const FVIRTKEY = 1
Public Const FCONTROL = 8
'OpenGL
Public Const PFD_SUPPORT_OPENGL = &H20
Public Const PFD_DOUBLEBUFFER = 1
Public Const PFD_DRAW_TO_WINDOW = 4
Public Const PFD_TYPE_RGBA = 0
Public Const PFD_MAIN_PLANE = 0
Public Const GL_MODELVIEW = &H1700
Public Const GL_PROJECTION = &H1701
Public Const GL_MODELVIEW_MATRIX = &HBA6
Public Const GL_PROJECTION_MATRIX = &HBA7
Public Const GL_DEPTH_TEST = &HB71
Public Const GL_COLOR_BUFFER_BIT = &H4000
Public Const GL_DEPTH_BUFFER_BIT = &H100
Public Const GL_NICEST = &H1102
Public Const GL_POLYGON_SMOOTH = &HB41
Public Const GL_BLEND = &HBE2
Public Const GL_PERSPECTIVE_CORRECTION_HINT = &HC50
Public Const GL_POLYGON_SMOOTH_HINT = &HC53
Public Const GL_LINES = 1
Public Const GL_TRIANGLES = 4
Public Const GL_TRIANGLE_STRIP = 5
Public Const GL_QUADS = 7
Public Const GL_QUAD_STRIP = 8
Public Const GL_SRC_ALPHA = &H302
Public Const GL_ONE_MINUS_SRC_ALPHA = &H303
Public Const GL_FRONT = &H404
Public Const GL_LIGHTING = &HB50
Public Const GL_AMBIENT = &H1200
Public Const GL_DIFFUSE = &H1201
Public Const GL_SPECULAR = &H1202
Public Const GL_POSITION = &H1203
Public Const GL_EMISSION = &H1600
Public Const GL_SHININESS = &H1601
Public Const GL_AMBIENT_AND_DIFFUSE = &H1602
Public Const GL_SMOOTH = &H1D01
Public Const GL_FRONT_AND_BACK = &H408
Public Const GL_LIGHT0 = &H4000
Public Const GL_LIGHT1 = &H4001
Public Const GL_LIGHT2 = &H4002

'Custom Values
'Numeric
Public Const PI_OVER_180 = 1.74532925199433E-02
'Screen
Public Const DEFAULT_SCREEN_WIDTH = 1024
Public Const DEFAULT_SCREEN_HEIGHT = 768
'Menu ID's
Public Const IDM_APP_EXIT = &H109
Public Const IDM_HELP_ABOUT = &H901

'Global Handles
Public ghInst As LongPtr
Public ghWnd As LongPtr
'Status Bar
Public hwndStatusBar As LongPtr
Public idStatusBar As LongPtr
Public szStatusClassName As String
Public lpszStatusClassName As LongPtr
Public xStatusParts(11) As Long 'Divide Status Bar by 12 parts
Public lpStatusParts As LongPtr
'Menu Handles
Public hMenu As LongPtr
Public hMenuFile As LongPtr
Public hMenuHelp As LongPtr
Public hAccel As LongPtr
'Menu Text Strings
Public szMenuFile As String
Public szMenuFileExit As String
Public szMenuHelp As String
Public szMenuHelpAbout As String
'Menu Text Pointers
Public lpszMenuFile As LongPtr
Public lpszMenuFileExit As LongPtr
Public lpszMenuHelp As LongPtr
Public lpszMenuHelpAbout As LongPtr

'OpenGL
Public ghDC As LongPtr
Public ghRC As LongPtr
Public iPixelFormat As LongPtr
'Cursor Position
Public xPrevPos, yPrevPos As Integer
Public xCurPos, yCurPos As Integer
Public dxMouse, dyMouse As Integer
'Motion
Public LinearSpeed As Single
Public LinearBoost As Single
Public dStep As Single
Public AngularSpeed As Single
Public AngularBoost As Single
Public dAngle As Single
'Matrices
Public mtxProjectionBuffer(15) As Single
Public lpProjectionBuffer As LongPtr

'Flags
Public isNotActive As Byte
Public isInitialPosition As Byte
Public isRefreshed As Byte
Public nMouseMode As Integer
Public nFrame As Long
'Keyboard Buffer
Public key(255) As Byte
Public nKeyCode As Integer

'Materials
Public v3Normal As POINT3D
Public lpNormal As LongPtr

'Gray
'Public matGraySpecular As RGBA
'Public lp_matGraySpecular As LongPtr
'Public matGrayShininess As Single
'Public lp_matGrayShininess As LongPtr
Public matGrayAmbDiff As RGBA
Public lp_matGrayAmbDiff As LongPtr
'Green
'Public matGreenSpecular As RGBA
'Public lp_matGreenSpecular As LongPtr
'Public matGreenShininess As Single
'Public lp_matGreenShininess As LongPtr
Public matGreenAmbDiff As RGBA
Public lp_matGreenAmbDiff As LongPtr
'Yellow
'Public matYellowSpecular As RGBA
'Public lp_matYellowSpecular As LongPtr
'Public matYellowShininess As Single
'Public lp_matYellowShininess As LongPtr
Public matYellowAmbDiff As RGBA
Public lp_matYellowAmbDiff As LongPtr
'Red
'Public matRedSpecular As RGBA
'Public lp_matRedSpecular As LongPtr
'Public matRedShininess As Single
'Public lp_matRedShininess As LongPtr
Public matRedAmbDiff As RGBA
Public lp_matRedAmbDiff As LongPtr
'Blue
'Public matBlueSpecular As RGBA
'Public lp_matBlueSpecular As LongPtr
'Public matBlueShininess As Single
'Public lp_matBlueShininess As LongPtr
Public matBlueAmbDiff As RGBA
Public lp_matBlueAmbDiff As LongPtr
'Cherenkov-Vavilov
'Public matBlueEmission As RGBA
'Public lp_matBlueEmission As LongPtr

'Lights
Public light_position As POINT4D
Public lp_light_position As LongPtr
Public light_ambient As RGBA
Public lp_light_ambient As LongPtr
Public light_diffuse As RGBA
Public lp_light_diffuse As LongPtr
'Public light_specular As RGBA
'Public lp_light_specular As LongPtr

'Name Strings
Public szCaption As String
Public szMsgText As String
Public szMsgTitle As String
'Name Pointers
Public lpszCaption As LongPtr
Public lpszMsgText As LongPtr
Public lpszMsgTitle As LongPtr
'Status Strings
Public szAxisXX As String
Public szAxisYX As String
Public szAxisZX As String
Public szAxisXY As String
Public szAxisYY As String
Public szAxisZY As String
Public szAxisXZ As String
Public szAxisYZ As String
Public szAxisZZ As String
Public szAxisXW As String
Public szAxisYW As String
Public szAxisZW As String
'Status Pointers
Public lpszAxisXX As LongPtr
Public lpszAxisYX As LongPtr
Public lpszAxisZX As LongPtr
Public lpszAxisXY As LongPtr
Public lpszAxisYY As LongPtr
Public lpszAxisZY As LongPtr
Public lpszAxisXZ As LongPtr
Public lpszAxisYZ As LongPtr
Public lpszAxisZZ As LongPtr
Public lpszAxisXW As LongPtr
Public lpszAxisYW As LongPtr
Public lpszAxisZW As LongPtr

'Debug
Public nLastError As LongPtr

Sub Start()
    Call WinMain(0, 0, 0, 0)
End Sub

Function WinMain(ByVal hInstance As LongPtr, ByVal hPrevInstance As LongPtr, ByVal lpCmdLine As LongPtr, ByVal nCmdShow As LongPtr)
'Main Cycle
    Dim nPeek As LongPtr
'Debug
    Dim nWndClass As LongPtr 'For Debug Purpose

'Pointers
    lpWndClass = VarPtr(wcx)
    lpMsg = VarPtr(wmsg)

    wcx.cbSize = Len(wcx)
    wcx.style = CS_HREDRAW Or CS_VREDRAW Or CS_DBLCLKS
    wcx.lpfnWndProc = GetAddr(AddressOf WndProc)
    wcx.cbClsExtra = 0
    wcx.cbWndExtra = 0
    wcx.hInstance = GetModuleHandleW(0)
    If wcx.hInstance = 0 Then
        Call MsgBox("GetModuleHandle Error: " & GetLastError())
        Exit Function
    Else
        ghInst = wcx.hInstance
    End If
    wcx.hIcon = LoadIconW(0, IDI_APPLICATION)
    wcx.hCursor = LoadCursorW(0, IDC_ARROW)
    wcx.hbrBackground = GetStockObject(GRAY_BRUSH)
    wcx.lpszMenuName = 0
    wcx.lpszClassName = StrPtr("MainWindowClassName")
    wcx.hIconSm = wcx.hIcon

    nWndClass = RegisterClassExW(lpWndClass)
    If nWndClass = 0 Then
        nLastError = GetLastError()
        If nLastError = 1410 Then
            'Call MsgBox("RegisterClass Error 1410 (0x582): ERROR_CLASS_ALREADY_EXISTS")
        Else
            Call MsgBox("RegisterClass Error: " & nLastError)
            Exit Function
        End If
    End If

    szCaption = "VBA WinAPI OpenGL Demo"
    lpszCaption = StrPtr(szCaption)
    ghWnd = CreateWindowExW(0, wcx.lpszClassName, lpszCaption, WS_OVERLAPPEDWINDOW Or WS_CLIPSIBLINGS Or WS_CLIPCHILDREN, CW_USEDEFAULT, CW_USEDEFAULT, DEFAULT_SCREEN_WIDTH, DEFAULT_SCREEN_HEIGHT, 0, 0, wcx.hInstance, 0)
    If ghWnd = 0 Then
        Call MsgBox("CreateWindow Error: " & GetLastError())
        Exit Function
    End If

    Call Initialize

    Call ShowWindow(ghWnd, SW_SHOW)
    Call UpdateWindow(ghWnd)

WinMainLoop:
    nPeek = PeekMessageW(lpMsg, 0, 0, 0, PM_REMOVE)
    If nPeek = 0 And isNotActive = 0 Then
        Call DrawGLScene 'We'll draw the OpenGL Scene outside the WndProc
    ElseIf wmsg.message = WM_QUIT Then
        WinMain = wmsg.wParam
        Exit Function 'Don't use Call ExitProcess(0)
    ElseIf TranslateAcceleratorW(ghWnd, hAccel, lpMsg) = 0 Then
        Call TranslateMessage(lpMsg)
        Call DispatchMessageW(lpMsg)
    End If
    GoTo WinMainLoop
End Function

Function WndProc(ByVal hWnd As LongPtr, ByVal message As LongPtr, ByVal wParam As LongPtr, ByVal lParam As LongPtr) As LongPtr
Dim i As Byte

Select Case message
    Case WM_MOUSEMOVE
        GoTo lbl_wmMouseMove
    Case WM_KEYDOWN
        GoTo lbl_wmKeyDown
    Case WM_KEYUP
        GoTo lbl_wmKeyUp
    Case WM_MBUTTONDOWN
        GoTo lbl_wmMButtonDown
    Case WM_MBUTTONUP
        GoTo lbl_wmMButtonUp
    Case WM_LBUTTONDOWN
        GoTo lbl_wmLButtonDown
    Case WM_LBUTTONUP
        GoTo lbl_wmLButtonUp
     Case WM_RBUTTONDOWN
        GoTo lbl_wmRButtonDown
    Case WM_RBUTTONUP
        GoTo lbl_wmRButtonUp
    Case WM_MBUTTONDBLCLK
        GoTo lbl_wmMButtonDblClk
    Case WM_MOUSEWHEEL
        GoTo lbl_wmMouseWheel
    Case WM_COMMAND
        GoTo lbl_wmCommand
    Case WM_ACTIVATE
        GoTo lbl_wmActivate
    Case WM_SIZE
        GoTo lbl_wmSize
    Case WM_CLOSE
        GoTo lbl_wmClose
    Case WM_DESTROY
        GoTo lbl_wmDestroy
End Select

'If None of the Above Then Pass to Default
lbl_DefWndProc:
    WndProc = DefWindowProcW(hWnd, message, wParam, lParam)
    Exit Function

'Proceed Received Messages
lbl_wmSize:
    RectWidth = CInt(lParam And 32767) 'Low Word, Signed Integer
    RectHeight = CInt(lParam / 65536) 'High Word
    Call GLResize
    GoTo lbl_WndProc_Return0

lbl_wmActivate:
    isNotActive = CInt(wParam / 65536) 'High Word
    GoTo lbl_WndProc_Return0

lbl_wmKeyDown:
    nKeyCode = CInt(wParam And 32767) 'Low Word, Signed Integer
    key(nKeyCode) = 1
    Select Case nKeyCode 'For single (not continuous) KeyStrokes
        Case VK_TAB
            Call glMatrixMode(GL_MODELVIEW)
            Call glRotatef(30, 0, 0, 1)
            isRefreshed = 0
        Case VK_RETURN 'Enter
            Call AboutProc
        Case VK_SPACE
            Call SetView
        Case VK_ESCAPE
            If isInitialPosition = 0 Then
                Call SetView
            Else
                Call CloseWndProc
            End If
        Case VK_F1
            Call AboutProc
        End Select
    GoTo lbl_WndProc_Return0

lbl_wmKeyUp:
    nKeyCode = CInt(wParam And 32767) 'Low Word, Signed Integer
    key(nKeyCode) = 0
    GoTo lbl_WndProc_Return0

lbl_wmMouseMove:
    xCurPos = lParam And 32767 'Low Word, Signed Integer
    yCurPos = lParam / 65536 'High Word
    dxMouse = xPrevPos - xCurPos
    dyMouse = yPrevPos - yCurPos
    Select Case nMouseMode
        Case 1 'LButton
            Call glMatrixMode(GL_MODELVIEW)
            dAngle = dxMouse / 8
            Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
            Call glTranslatef(-mtxProjectionBuffer(12), -mtxProjectionBuffer(13), -mtxProjectionBuffer(14)) 'Camera UnMove
            Call glRotatef(dAngle, mtxProjectionBuffer(1), mtxProjectionBuffer(5), mtxProjectionBuffer(9)) 'World Y
            Call glTranslatef(mtxProjectionBuffer(12), mtxProjectionBuffer(13), mtxProjectionBuffer(14)) 'Camera Move
            dAngle = dyMouse / 16
            Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
            Call glTranslatef(-mtxProjectionBuffer(12), -mtxProjectionBuffer(13), -mtxProjectionBuffer(14)) 'Camera UnMove
            Call glRotatef(-dAngle, mtxProjectionBuffer(0), mtxProjectionBuffer(4), mtxProjectionBuffer(8)) 'World X
            Call glTranslatef(mtxProjectionBuffer(12), mtxProjectionBuffer(13), mtxProjectionBuffer(14)) 'Camera Move
            isRefreshed = 0
        Case 2 'MButton
            Call glMatrixMode(GL_MODELVIEW)
            dStep = -dxMouse * 8
            Call glTranslatef(dStep * mtxProjectionBuffer(0), dStep * mtxProjectionBuffer(4), dStep * mtxProjectionBuffer(8))
            dStep = dyMouse * 16
            Call glTranslatef(dStep * mtxProjectionBuffer(1), dStep * mtxProjectionBuffer(5), dStep * mtxProjectionBuffer(9))
            isRefreshed = 0
        Case 3 'RButton
            Call glMatrixMode(GL_MODELVIEW)
            dAngle = dxMouse / 8
            Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
            Call glTranslatef(-mtxProjectionBuffer(12), -mtxProjectionBuffer(13), -mtxProjectionBuffer(14)) 'Camera UnMove
            Call glRotatef(dAngle, mtxProjectionBuffer(1), mtxProjectionBuffer(5), mtxProjectionBuffer(9)) 'World Y
            Call glTranslatef(mtxProjectionBuffer(12), mtxProjectionBuffer(13), mtxProjectionBuffer(14)) 'Camera Move
            dAngle = dyMouse / 16
            Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
            Call glTranslatef(-mtxProjectionBuffer(12), -mtxProjectionBuffer(13), -mtxProjectionBuffer(14)) 'Camera UnMove
            Call glRotatef(dAngle, mtxProjectionBuffer(2), mtxProjectionBuffer(6), mtxProjectionBuffer(10)) 'World Z
            Call glTranslatef(mtxProjectionBuffer(12), mtxProjectionBuffer(13), mtxProjectionBuffer(14)) 'Camera Move
            isRefreshed = 0
        Case Else
            GoTo lbl_WndProc_Return0
    End Select
        xPrevPos = xCurPos
        yPrevPos = yCurPos
    GoTo lbl_WndProc_Return0

lbl_wmLButtonDown:
    nMouseMode = 1
    xPrevPos = lParam And 32767 'Low Word, Signed Integer
    yPrevPos = lParam / 65536 'High Word
    GoTo lbl_WndProc_Return0
lbl_wmLButtonUp:
    nMouseMode = 0
    GoTo lbl_WndProc_Return0

lbl_wmRButtonDown:
    nMouseMode = 3
    xPrevPos = lParam And 32767 'Low Word, Signed Integer
    yPrevPos = lParam / 65536 'High Word
    GoTo lbl_WndProc_Return0
lbl_wmRButtonUp:
    nMouseMode = 0
    GoTo lbl_WndProc_Return0

lbl_wmMButtonDown:
    nMouseMode = 2
    xPrevPos = lParam And 32767 'Low Word, Signed Integer
    yPrevPos = lParam / 65536 'High Word
    GoTo lbl_WndProc_Return0
lbl_wmMButtonUp:
    nMouseMode = 0
    GoTo lbl_WndProc_Return0

lbl_wmMButtonDblClk:
    Call SetView
    GoTo lbl_WndProc_Return0

lbl_wmMouseWheel:
    If (wParam And &H80000000) = 0 Then 'GET_WHEEL_DELTA_WPARAM(wParam) == HIWORD(wParam) == WHEEL_DELTA == either 120 or (-120)
        dStep = -LinearSpeed * 10
    Else
        dStep = LinearSpeed * 10
    End If
    Call glMatrixMode(GL_MODELVIEW)
    Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
    Call glTranslatef(dStep * mtxProjectionBuffer(2), dStep * mtxProjectionBuffer(6), dStep * mtxProjectionBuffer(10))
    isRefreshed = 0
    GoTo lbl_WndProc_Return0

lbl_wmCommand:
    Select Case CInt(wParam And 32767) 'Low Word, Signed Integer
        Case IDM_APP_EXIT
            Call CloseWndProc
        Case IDM_HELP_ABOUT
            Call AboutProc
    End Select
    GoTo lbl_WndProc_Return0

lbl_wmClose:
    Call CloseWndProc
    GoTo lbl_WndProc_Return0

lbl_wmDestroy:
    Call PostQuitMessage(0)
lbl_WndProc_Return0:
    WndProc = 0
End Function

Function GetAddr(ByVal lpProc As LongPtr) As LongPtr
    'This Function has been created to fit the 'AddressOf' syntax
    GetAddr = lpProc
End Function

Function Initialize()
    nFrame = 0
    nMouseMode = 0
    Call InitCommonControlsEx(lpIcce)
    Call DoCreateMenu
    Call DoCreateStatusBar
    Call InitializeGL
    Call SetView
End Function

Function DoCreateMenu()
'Menu Text  Strings
    szMenuFile = "&File"
    szMenuFileExit = "E&xit" + vbTab + "Ctrl+W"
    szMenuHelp = "&Help"
    szMenuHelpAbout = "&About..."
'Menu Text Pointers
    lpszMenuFile = StrPtr(szMenuFile)
    lpszMenuFileExit = StrPtr(szMenuFileExit)
    lpszMenuHelp = StrPtr(szMenuHelp)
    lpszMenuHelpAbout = StrPtr(szMenuHelpAbout)
'Main Menu
    hMenu = CreateMenu()
    hMenuFile = CreatePopupMenu()
    Call AppendMenuW(hMenu, MF_POPUP, hMenuFile, lpszMenuFile)
        Call AppendMenuW(hMenuFile, MF_STRING, IDM_APP_EXIT, lpszMenuFileExit)
    hMenuHelp = CreatePopupMenu()
    Call AppendMenuW(hMenu, MF_POPUP, hMenuHelp, lpszMenuHelp)
        Call AppendMenuW(hMenuHelp, MF_STRING, IDM_HELP_ABOUT, lpszMenuHelpAbout)
    Call SetMenu(ghWnd, hMenu)
    Call DrawMenuBar(ghWnd)
'ACCEL accel;
    accel.fVirt = FVIRTKEY Or FCONTROL
    'accel.dummy = 0
    accel.key = &H57 'W
    accel.cmd = IDM_APP_EXIT
    paccel = VarPtr(accel)
    hAccel = CreateAcceleratorTableW(paccel, 1)
End Function

Function DoCreateStatusBar()
    'https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
    szStatusClassName = "msctls_statusbar32" '"STATUSCLASSNAMEW"
    lpszStatusClassName = StrPtr(szStatusClassName)
    idStatusBar = 1 'Child window identifier for Status Bar
    hwndStatusBar = CreateWindowExW(0, lpszStatusClassName, 0, SBARS_SIZEGRIP Or WS_CHILD Or WS_VISIBLE, 0, 0, 0, 0, ghWnd, idStatusBar, ghInst, 0)
    If hwndStatusBar = 0 Then
        Call MsgBox("Status Bar Error: " & GetLastError())
        Exit Function
    End If
End Function

Function InitializeGL()
    Dim i As Integer
    For i = 0 To 255
        key(i) = 0
    Next i
'PIXELFORMATDESCRIPTOR pfd
    pfd.nSize = Len(pfd) 'sizeof( PIXELFORMATDESCRIPTOR )
    pfd.nVersion = 1 'always 1
    pfd.dwFlags = PFD_SUPPORT_OPENGL Or PFD_DOUBLEBUFFER Or PFD_DRAW_TO_WINDOW
    pfd.iPixelType = PFD_TYPE_RGBA
    pfd.cColorBits = 24
    pfd.cRedBits = 0
    pfd.cRedShift = 0
    pfd.cGreenBits = 0
    pfd.cGreenShift = 0
    pfd.cBlueBits = 0
    pfd.cBlueShift = 0
    pfd.cAlphaBits = 0
    pfd.cAlphaShift = 0
    pfd.cAccumBits = 0
    pfd.cAccumRedBits = 0
    pfd.cAccumGreenBits = 0
    pfd.cAccumBlueBits = 0
    pfd.cAccumAlphaBits = 0
    pfd.cDepthBits = 32
    pfd.cStencilBits = 0
    pfd.cAuxBuffers = 0
    pfd.iLayerType = PFD_MAIN_PLANE
    pfd.bReserved = 0
    pfd.dwLayerMask = 0
    pfd.dwVisibleMask = 0
    pfd.dwDamageMask = 0
    lpPFD = VarPtr(pfd)

    ghDC = GetDC(ghWnd)

    iPixelFormat = ChoosePixelFormat(ghDC, lpPFD)
    If iPixelFormat = 0 Then
        MsgBox ("ChoosePixelFormat Error: " & GetLastError())
    End If

    Call SetPixelFormat(ghDC, iPixelFormat, lpPFD)

    ghRC = wglCreateContext(ghDC)
    If ghRC = 0 Then
        nLastError = GetLastError()
        If nLastError = 2000 Then
            MsgBox ("wglCreateContext Error 2000 (0x7D0): ERROR_INVALID_PIXEL_FORMAT")
        Else
            MsgBox ("wglCreateContext Error: " & nLastError)
        End If
    End If

    Call wglMakeCurrent(ghDC, ghRC)
    
    Call glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
    Call glEnable(GL_BLEND)
    Call glEnable(GL_DEPTH_TEST)
    Call glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST)
    Call glEnable(GL_POLYGON_SMOOTH)
    Call glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST)

'MatrixBuffers
    lpProjectionBuffer = VarPtr(mtxProjectionBuffer(0))
'Normal Vector
    lpNormal = VarPtr(v3Normal)
'Gray
    'matGraySpecular.r = 0.65
    'matGraySpecular.g = 0.65
    'matGraySpecular.b = 0.65
    'matGraySpecular.a = 1
    'lp_matGraySpecular = VarPtr(matGraySpecular)
    'matGrayShininess = 64# '0.0 to 128.0
    'lp_matGrayShininess = VarPtr(matGrayShininess)
    matGrayAmbDiff.r = 0.65
    matGrayAmbDiff.g = 0.65
    matGrayAmbDiff.b = 0.65
    matGrayAmbDiff.a = 1
    lp_matGrayAmbDiff = VarPtr(matGrayAmbDiff)
'Green
    'matGreenSpecular.r = 0.15
    'matGreenSpecular.g = 0.75
    'matGreenSpecular.b = 0.15
    'matGreenSpecular.a = 1
    'lp_matGreenSpecular = VarPtr(matGreenSpecular)
    'matGreenShininess = 64# '0.0 to 128.0
    'lp_matGreenShininess = VarPtr(matGreenShininess)
    matGreenAmbDiff.r = 0.15
    matGreenAmbDiff.g = 0.75
    matGreenAmbDiff.b = 0.15
    matGreenAmbDiff.a = 1
    lp_matGreenAmbDiff = VarPtr(matGreenAmbDiff)
'Yellow
    'matYellowSpecular.r = 0.85
    'matYellowSpecular.g = 0.85
    'matYellowSpecular.b = 0.15
    'matYellowSpecular.a = 1
    'lp_matYellowSpecular = VarPtr(matYellowSpecular)
    'matYellowShininess = 64# '0.0 to 128.0
    'lp_matYellowShininess = VarPtr(matYellowShininess)
    matYellowAmbDiff.r = 0.85
    matYellowAmbDiff.g = 0.85
    matYellowAmbDiff.b = 0.15
    matYellowAmbDiff.a = 1
    lp_matYellowAmbDiff = VarPtr(matYellowAmbDiff)
'Red
    'matRedSpecular.r = 0.85
    'matRedSpecular.g = 0.15
    'matRedSpecular.b = 0.15
    'matRedSpecular.a = 1
    'lp_matRedSpecular = VarPtr(matRedSpecular)
    'matRedShininess = 64# '0.0 to 128.0
    'lp_matRedShininess = VarPtr(matRedShininess)
    matRedAmbDiff.r = 0.85
    matRedAmbDiff.g = 0.15
    matRedAmbDiff.b = 0.15
    matRedAmbDiff.a = 1
    lp_matRedAmbDiff = VarPtr(matRedAmbDiff)
'Blue
    'matBlueSpecular.r = 0.25
    'matBlueSpecular.g = 0.4
    'matBlueSpecular.b = 0.85
    'matBlueSpecular.a = 1
    'lp_matBlueSpecular = VarPtr(matBlueSpecular)
    'matBlueShininess = 64# '0.0 to 128.0
    'lp_matBlueShininess = VarPtr(matBlueShininess)
    matBlueAmbDiff.r = 0.25
    matBlueAmbDiff.g = 0.4
    matBlueAmbDiff.b = 0.85
    matBlueAmbDiff.a = 1
    lp_matBlueAmbDiff = VarPtr(matBlueAmbDiff)
'Cherenkov-Vavilov
    'matBlueEmission.r = 0.05
    'matBlueEmission.g = 0.075
    'matBlueEmission.b = 0.099
    'matBlueEmission.a = 1
    'lp_matBlueEmission = VarPtr(matBlueEmission)
'Lights
    light_position.x = -2000
    light_position.y = -1000
    light_position.z = 2000
    light_position.w = 1
    lp_light_position = VarPtr(light_position)
    light_ambient.r = 0.4
    light_ambient.g = 0.4
    light_ambient.b = 0.35
    light_ambient.a = 0
    lp_light_ambient = VarPtr(light_ambient)
    light_diffuse.r = 0.4
    light_diffuse.g = 0.4
    light_diffuse.b = 0.35
    light_diffuse.a = 0
    lp_light_diffuse = VarPtr(light_diffuse)
    'light_specular.r = 0.001
    'light_specular.g = 0.001
    'light_specular.b = 0.001
    'light_specular.a = 1
    'lp_light_specular = VarPtr(light_specular)

End Function

Function SetView()
'Set Values
    If Len(ghInst) = 4 Then
        LinearSpeed = 20 '32-bit Systems are Faster
        AngularSpeed = 1
    Else
        LinearSpeed = 50 '64-bit Systems are Slower
        AngularSpeed = 2
    End If
    LinearBoost = 10
    AngularBoost = 10

'Set Projection
    Call glMatrixMode(GL_PROJECTION)
    Call glLoadIdentity
    Call gluPerspective(90, RectAspect, 1, 1000000)
'Set ModelView
    Call glMatrixMode(GL_MODELVIEW)
    Call glLoadIdentity
    Call glTranslatef(0, 1500, -9000) 'Camera Move
    Call glRotatef(300, 1, 0, 0)  'Camera Tilt
    Call glRotatef(10, 0, 0, 1) 'Model Turn
    

'Set Flags
    isInitialPosition = 1
    isRefreshed = 0
End Function

Function GLResize()
Dim i
    If RectHeight > 0 Then
        RectAspect = RectWidth / RectHeight
    End If
    'Main Viewport
    Call glViewport(0, 0, RectWidth, RectHeight)
    'Status Bar Proportions
    For i = 0 To 10
        xStatusParts(i) = (i + 1) * CInt(RectWidth / 12)
    Next i
    xStatusParts(11) = -1
    lpStatusParts = VarPtr(xStatusParts(0))
    Call SendMessageW(hwndStatusBar, WM_SIZE, 0, 0)
    Call SendMessageW(hwndStatusBar, SB_SETPARTS, 12, lpStatusParts)
    isRefreshed = 0
End Function

Function AboutProc()
    szMsgText = _
    "Camera Motion - Mouse Input:" & Chr(13) & _
    "Left Mouse Button - Turn and Tilt the Camera" & Chr(13) & _
    "Press Mouse Wheel - Move the Camera Up and Down, Left and Right" & Chr(13) & _
    "Right Mouse Button - Roll and Tilt the Camera" & Chr(13) & _
    "Mouse Scroll - Move the Camera Forward and Backward" & Chr(13) & Chr(13) & _
    "Camera Motion - Keyboard Input:" & Chr(13) & _
    "Arrow Up - Move Forward" & Chr(13) & _
    "Arrow Down - Move Backward" & Chr(13) & _
    "Arrow Left - Move Left" & Chr(13) & _
    "Arrow Right - Move Right" & Chr(13) & _
    "Page Up - Move Up" & Chr(13) & _
    "Page Down - Move Down" & Chr(13) & Chr(13) & _
    "Model Rotation:" & Chr(13) & _
    "W - Tilt the Object Forward" & Chr(13) & _
    "S - Tilt the Object Backward" & Chr(13) & _
    "A - Turn the Object Left" & Chr(13) & _
    "D - Turn the Object Right" & Chr(13) & _
    "Q - Turn the Object Counter-Clockwise" & Chr(13) & _
    "E - Turn the Object Clockwise" & Chr(13) & Chr(13) & _
    "Tab - Turn the Object Clockwise Quick" & Chr(13) & Chr(13) & _
    "Shift - Boost"
    lpszMsgText = StrPtr(szMsgText)
    szMsgTitle = "Manual"
    lpszMsgTitle = StrPtr(szMsgTitle)
    Call MessageBoxW(ghWnd, lpszMsgText, lpszMsgTitle, MB_OK Or MB_ICONINFORMATION)
End Function

Function CloseWndProc()
    szMsgText = "Close?"
    lpszMsgText = StrPtr(szMsgText)
    szMsgTitle = "VBA WinAPI OpenGL Demo Application"
    lpszMsgTitle = StrPtr(szMsgTitle)
    If MessageBoxW(ghWnd, lpszMsgText, lpszMsgTitle, MB_YESNO Or MB_ICONQUESTION) = IDYES Then
        Call wglMakeCurrent(0, 0)
        Call wglDeleteContext(ghRC)
        Call ReleaseDC(ghWnd, ghDC)
        Call DestroyAcceleratorTable(hAccel)
        Call DestroyWindow(ghWnd)
    End If
End Function

Function DrawGLScene()
    Call CheckKeys
    If isRefreshed = 0 Then
        Call RefreshStatus
        Call glClear(GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT)
        Call DrawAxes
        Call DrawObject
        Call SwapBuffers(ghDC)
        isRefreshed = 1
        nFrame = nFrame + 1
        szCaption = "VBA WinAPI OpenGL Demo" & " - [Frame " & nFrame & "]"
        lpszCaption = StrPtr(szCaption)
        Call SetWindowTextW(ghWnd, lpszCaption)
    End If
End Function

Function CheckKeys() 'For Continuous KeyStrokes
Dim dxMouse, dyMouse As Integer
'Return to Normal Speed
    dStep = LinearSpeed
    dAngle = AngularSpeed
'Boost
    If key(&H10) <> 0 Then  'Shift
        dStep = dStep * LinearBoost
        dAngle = dAngle * AngularBoost
    End If

Call glMatrixMode(GL_MODELVIEW)
'Model Rotation
    If key(&H57) <> 0 Then  'W - Camera Tilt Down
        Call glRotatef(-dAngle, 1, 0, 0)
        isRefreshed = 0
    End If
    If key(&H53) <> 0 Then  'S - Camera Tilt Up
        Call glRotatef(dAngle, 1, 0, 0)
        isRefreshed = 0
    End If
    If key(&H41) <> 0 Then  'A - Camera Turn Clockwise
        Call glRotatef(-dAngle, 0, 0, 1)
        isRefreshed = 0
    End If
    If key(&H44) <> 0 Then  'D - Camera Turn Counter-Clockwise
        Call glRotatef(dAngle, 0, 0, 1)
        isRefreshed = 0
    End If
    If key(&H51) <> 0 Then  'Q - Camera Roll Clockwise
        Call glRotatef(dAngle, 0, 1, 0)
        isRefreshed = 0
    End If
    If key(&H45) <> 0 Then  'E - Camera Roll Counter-Clockwise
        Call glRotatef(-dAngle, 0, 1, 0)
        isRefreshed = 0
    End If
'Camera Movement
    If key(&H26) <> 0 Then 'Up Arrow
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(dStep * mtxProjectionBuffer(2), dStep * mtxProjectionBuffer(6), dStep * mtxProjectionBuffer(10))
        isRefreshed = 0
    End If
    If key(&H28) <> 0 Then 'Down Arrow
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(-dStep * mtxProjectionBuffer(2), -dStep * mtxProjectionBuffer(6), -dStep * mtxProjectionBuffer(10))
        isRefreshed = 0
    End If
    If key(&H25) <> 0 Then 'Left Arrow
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(-dStep * mtxProjectionBuffer(0), -dStep * mtxProjectionBuffer(4), -dStep * mtxProjectionBuffer(8))
        isRefreshed = 0
    End If
    If key(&H27) <> 0 Then 'Right Arrow
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(dStep * mtxProjectionBuffer(0), dStep * mtxProjectionBuffer(4), dStep * mtxProjectionBuffer(8))
        isRefreshed = 0
    End If
    If key(&H21) <> 0 Then 'Page Up
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(-dStep * mtxProjectionBuffer(1), -dStep * mtxProjectionBuffer(5), -dStep * mtxProjectionBuffer(9))
        isRefreshed = 0
    End If
    If key(&H22) <> 0 Then 'Page Down
        Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
        Call glTranslatef(dStep * mtxProjectionBuffer(1), dStep * mtxProjectionBuffer(5), dStep * mtxProjectionBuffer(9))
        isRefreshed = 0
    End If
End Function

Function RefreshStatus()
    Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
    szAxisXX = "x.x=" & format(mtxProjectionBuffer(0), "0.000")
    szAxisYX = "y.x=" & format(mtxProjectionBuffer(1), "0.000")
    szAxisZX = "z.x=" & format(mtxProjectionBuffer(2), "0.000")
    szAxisXY = "x.y=" & format(mtxProjectionBuffer(4), "0.000")
    szAxisYY = "y.y=" & format(mtxProjectionBuffer(5), "0.000")
    szAxisZY = "z.y=" & format(mtxProjectionBuffer(6), "0.000")
    szAxisXZ = "x.z=" & format(mtxProjectionBuffer(8), "0.000")
    szAxisYZ = "y.z=" & format(mtxProjectionBuffer(9), "0.000")
    szAxisZZ = "z.z=" & format(mtxProjectionBuffer(10), "0.000")
    szAxisXW = "x.w=" & format(mtxProjectionBuffer(12), "0.000")
    szAxisYW = "y.w=" & format(mtxProjectionBuffer(13), "0.000")
    szAxisZW = "z.w=" & format(mtxProjectionBuffer(14), "0.000")

    lpszAxisXX = StrPtr(szAxisXX)
    lpszAxisYX = StrPtr(szAxisYX)
    lpszAxisZX = StrPtr(szAxisZX)
    lpszAxisXY = StrPtr(szAxisXY)
    lpszAxisYY = StrPtr(szAxisYY)
    lpszAxisZY = StrPtr(szAxisZY)
    lpszAxisXZ = StrPtr(szAxisXZ)
    lpszAxisYZ = StrPtr(szAxisYZ)
    lpszAxisZZ = StrPtr(szAxisZZ)
    lpszAxisXW = StrPtr(szAxisXW)
    lpszAxisYW = StrPtr(szAxisYW)
    lpszAxisZW = StrPtr(szAxisZW)

    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 0, lpszAxisXX)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 1, lpszAxisYX)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 2, lpszAxisZX)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 3, lpszAxisXY)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 4, lpszAxisYY)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 5, lpszAxisZY)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 6, lpszAxisXZ)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 7, lpszAxisYZ)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 8, lpszAxisZZ)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 9, lpszAxisXW)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 10, lpszAxisYW)
    Call SendMessageW(hwndStatusBar, SB_SETTEXTW, 11, lpszAxisZW)
End Function

Function DrawAxes()
Call glDisable(GL_LIGHTING)

Call glMatrixMode(GL_MODELVIEW)
Call glBegin(GL_LINES)
    Call glColor3f(1, 0, 0) 'Red
    Call glVertex3f(-7000, 0, 0)
    Call glVertex3f(7000, 0, 0)
    Call glVertex3f(6900, -50, 0) 'Arrow
    Call glVertex3f(7000, 0, 0)
    Call glVertex3f(7000, 0, 0)
    Call glVertex3f(6900, 50, 0)
    Call glColor3f(0, 1, 0) 'Green
    Call glVertex3f(0, -7000, 0)
    Call glVertex3f(0, 7000, 0)
    Call glVertex3f(-50, 6900, 0) 'Arrow
    Call glVertex3f(0, 7000, 0)
    Call glVertex3f(0, 7000, 0)
    Call glVertex3f(50, 6900, 0)
    Call glColor3f(0, 0, 1) 'Blue
    Call glVertex3f(0, 0, 0)
    Call glVertex3f(0, 0, 1000)
    Call glVertex3f(-50, 0, 900) 'Arrow
    Call glVertex3f(0, 0, 1000)
    Call glVertex3f(0, 0, 1000)
    Call glVertex3f(50, 0, 900)
Call glEnd

Call glGetFloatv(GL_MODELVIEW_MATRIX, lpProjectionBuffer)
Call glMatrixMode(GL_MODELVIEW)
Call glPushMatrix
Call glLoadIdentity
Call glBegin(GL_LINES)
    Call glColor3f(1, 0.5, 0.5) 'Red
    Call glVertex3f(0, 0, 0)
    Call glVertex3f(7000 * mtxProjectionBuffer(0), 7000 * mtxProjectionBuffer(4), 7000 * mtxProjectionBuffer(8))
    Call glColor3f(0.5, 1, 0.5) 'Green
    Call glVertex3f(0, 0, 0)
    Call glVertex3f(7000 * mtxProjectionBuffer(1), 7000 * mtxProjectionBuffer(5), 7000 * mtxProjectionBuffer(9))
    Call glColor3f(0.5, 0.5, 1) 'Blue
    Call glVertex3f(0, 0, 0)
    Call glVertex3f(-7000 * mtxProjectionBuffer(2), -7000 * mtxProjectionBuffer(6), -7000 * mtxProjectionBuffer(10)) 'Camera's Coordinates are Right-Handed (Mirrored about XY Plane)
    Call glColor3f(1, 1, 1) 'White
    Call glVertex3f(0, 0, 0)
    Call glVertex3f(-mtxProjectionBuffer(12), -mtxProjectionBuffer(13), -mtxProjectionBuffer(14))
Call glEnd
Call glPopMatrix
End Function

Function DrawObject()
Dim x, y As Integer

'Call glPushMatrix
'Call glMatrixMode(GL_MODELVIEW)
'Call glLoadIdentity
    Call glEnable(GL_LIGHTING)
    Call glEnable(GL_LIGHT0)
    Call glLightfv(GL_LIGHT0, GL_AMBIENT, lp_light_ambient)
    Call glLightfv(GL_LIGHT0, GL_POSITION, lp_light_position)
    Call glEnable(GL_LIGHT1)
    Call glLightfv(GL_LIGHT1, GL_DIFFUSE, lp_light_diffuse)
    Call glLightfv(GL_LIGHT1, GL_POSITION, lp_light_position)
    'Call glEnable(GL_LIGHT2)
    'Call glLightfv(GL_LIGHT2, GL_SPECULAR, lp_light_specular)
    'Call glLightfv(GL_LIGHT2, GL_POSITION, lp_light_position)
'Call glPopMatrix

Call glMatrixMode(GL_MODELVIEW)
Call glPushMatrix
Call glTranslatef(-5875, -5875, 0)
For y = 51 To 4 Step -1
    Call glPushMatrix
    For x = 4 To 51
        Select Case ActiveSheet.Cells(y, x).Value
            Case 1
                'Call glColor3f(0.75, 0.75, 0.75) 'Gray
                'Call glMaterialfv(GL_FRONT, GL_SPECULAR, lp_matGraySpecular)
                'Call glMaterialfv(GL_FRONT, GL_SHININESS, lp_matGrayShininess)
                Call glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, lp_matGrayAmbDiff)
                'Call glMaterialfv(GL_FRONT, GL_EMISSION, lp_matBlueEmission)
                Call DrawCap
            Case 2
                'Call glColor3f(0.15, 0.75, 0.15) 'Green
                'Call glMaterialfv(GL_FRONT, GL_SPECULAR, lp_matGreenSpecular)
                'Call glMaterialfv(GL_FRONT, GL_SHININESS, lp_matGreenShininess)
                Call glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, lp_matGreenAmbDiff)
                Call DrawCap
            Case 3
                'Call glColor3f(0.85, 0.85, 0.15) 'Yellow
                'Call glMaterialfv(GL_FRONT, GL_SPECULAR, lp_matYellowSpecular)
                'Call glMaterialfv(GL_FRONT, GL_SHININESS, lp_matYellowShininess)
                Call glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, lp_matYellowAmbDiff)
                Call DrawCap
            Case 4
                'Call glColor3f(0.85, 0.15, 0.15) 'Red
                'Call glMaterialfv(GL_FRONT, GL_SPECULAR, lp_matRedSpecular)
                'Call glMaterialfv(GL_FRONT, GL_SHININESS, lp_matRedShininess)
                Call glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, lp_matRedAmbDiff)
                Call DrawCap
            Case 5
                'Call glColor3f(0.25, 0.4, 0.85) 'Blue
                'Call glMaterialfv(GL_FRONT, GL_SPECULAR, lp_matBlueSpecular)
                'Call glMaterialfv(GL_FRONT, GL_SHININESS, lp_matBlueShininess)
                Call glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, lp_matBlueAmbDiff)
                Call DrawCap
        End Select
        Call glTranslatef(250, 0, 0)
    Next x
    Call glPopMatrix
    Call glTranslatef(0, 250, 0)
Next y
Call glPopMatrix
End Function

Function DrawCap()
'Call glPushMatrix
'Call glRotatef(CSng(5 * Rnd - 2.5), 0, 0, 1)
'Call glTranslatef(0, 0, CSng(10 * Rnd))
Call glBegin(GL_QUADS)
    v3Normal.x = 0#
    v3Normal.y = 0#
    v3Normal.z = 1#
    Call glNormal3fv(lpNormal) '0 - Top
    Call glVertex3f(110, 110, 0)
    Call glVertex3f(-110, 110, 0)
    Call glVertex3f(-110, -110, 0)
    Call glVertex3f(110, -110, 0)
    v3Normal.x = 0#
    v3Normal.y = 1#
    v3Normal.z = 1#
    Call glNormal3fv(lpNormal) '1 - North
    Call glVertex3f(120, 120, -10)
    Call glVertex3f(-120, 120, -10)
    Call glVertex3f(-110, 110, 0)
    Call glVertex3f(110, 110, 0)
    v3Normal.x = -1#
    v3Normal.y = 0#
    v3Normal.z = 1#
    Call glNormal3fv(lpNormal) '2 - West
    Call glVertex3f(-120, 120, -10)
    Call glVertex3f(-120, -120, -10)
    Call glVertex3f(-110, -110, 0)
    Call glVertex3f(-110, 110, 0)
    v3Normal.x = 0#
    v3Normal.y = -1#
    v3Normal.z = 1#
    Call glNormal3fv(lpNormal) '3 - South
    Call glVertex3f(-120, -120, -10)
    Call glVertex3f(120, -120, -10)
    Call glVertex3f(110, -110, 0)
    Call glVertex3f(-110, -110, 0)
    v3Normal.x = 1#
    v3Normal.y = 0#
    v3Normal.z = 1#
    Call glNormal3fv(lpNormal) '4 - East
    Call glVertex3f(120, -120, -10)
    Call glVertex3f(120, 120, -10)
    Call glVertex3f(110, 110, 0)
    Call glVertex3f(110, -110, 0)
Call glEnd
'Call glPopMatrix
End Function


