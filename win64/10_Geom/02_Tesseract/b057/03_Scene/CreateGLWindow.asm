;========================================================================================
CreateGLWindow proc; title:QWORD, width:DWORD, height:DWORD, bits:DWORD, fullscreen:DWORD
;========================================================================================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szStart
;lea r8,szCreateGLWindow
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

;Register Class
;Fill the WNDCLASSEX64 Structure
mov wc.cbSize,50h
mov wc.style,23h ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC
lea rax,WndProc
mov wc.lpfnWndProc,rax
mov wc.cbClsExtra,0 ;No Extra Window Data
mov wc.cbWndExtra,0 ;No Extra Window Data
;Load Instance
mov rax,g_hInst
mov wc.hInstance,rax
;Load Icon
xor rcx,rcx
mov rdx,7F00h ;hIcon = IDI_WINLOGO = 7F05h
call LoadIconA
mov wc.hIcon,rax
mov wc.hIconSm,rax
;Load Cursor
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 37F00h
call LoadCursorA
mov wc.hCursor,rax
mov wc.hbrBackground,0
mov wc.lpszMenuName,0
lea rax,szClass
mov wc.lpszClassName,rax

;Now call the Function
lea rcx,wc
call RegisterClassExA
cmp rax,0
je lbl_ErrRegisterClass


;Adjust Window To True Requested Size
mov rc.left,0
mov rc.top,0
mov eax,nWidth ;640 = 280h
mov rc.right,eax
mov eax,nHeight ;480 = 1E0h
mov rc.bottom,eax

lea rcx,rc
mov rdx,0CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
xor r8,r8 ;FALSE
mov r9,40100h ;dwExStyle = WS_EX_APPWINDOW + WS_EX_WINDOWEDGE
call AdjustWindowRectEx
;If Error
cmp rax,0
je lbl_ErrAdjustWindow

;Create the Window
mov rcx,40100h ;dwExStyle = WS_EX_APPWINDOW + WS_EX_WINDOWEDGE
lea rdx,szClass
lea r8,szTitle
mov r9,6CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW | WS_CLIPSIBLINGS | WS_CLIPCHILDREN = 6CF.0000h
xor rax,rax
mov qword ptr [rsp+20h],rax ;X = 0
mov qword ptr [rsp+28h],rax ;Y = 0
mov eax,rc.right
sub eax,rc.left
mov qword ptr [rsp+30h],rax ;nWidth
mov eax,rc.bottom
sub eax,rc.top
mov qword ptr [rsp+38h],rax ;nHeight
mov qword ptr [rsp+40h],0 ;hWndParent
mov qword ptr [rsp+48h],0 ;hMenu
mov rax,g_hInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
;If Error
cmp rax,0
je lbl_ErrCreateWindow
mov g_hWnd,rax

;Spell hWnd
mov rcx,g_hWnd
mov rdx,g_hWnd
lea r8,szCreateGLWindow
lea r9,sz_hWnd
call Spell64


;Fill the PIXELFORMATDESCRIPTOR Structure
mov pfd.nSize,28h ;sizeof.PIXELFORMATDESCRIPTOR
mov pfd.nVersion,1
mov pfd.dwFlags,25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
mov pfd.cColorBits,10h ;Color Depth = 16 bits per pixel
mov pfd.cRedBits,0 ;Color Bits Ignored
mov pfd.cRedShift,0 ;Color Bits Ignored
mov pfd.cGreenBits,0 ;Color Bits Ignored
mov pfd.cGreenShift,0 ;Color Bits Ignored
mov pfd.cBlueBits,0 ;Color Bits Ignored
mov pfd.cBlueShift,0 ;Color Bits Ignored
mov pfd.cAlphaBits,0 ;No Alpha Buffer
mov pfd.cAlphaShift,0 ;Shift Bit Ignored
mov pfd.cAccumBits,0 ;No Accumulation Buffer
mov pfd.cAccumRedBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumGreenBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumBlueBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumAlphaBits,0 ;Accumulation Bits Ignored
mov pfd.cDepthBits,10h ;16 Bit z-Buffer (Depth Buffer) 
mov pfd.cStencilBits,0 ;No Stencil Buffer
mov pfd.cAuxBuffers,0 ;No Auxiliary Buffer
mov pfd.iLayerType,0 ;PFD_MAIN_PLANE
mov pfd.bReserved,0 ;Reserved
mov pfd.dwLayerMask,0 ;Layer Masks Ignored
mov pfd.dwVisibleMask,0 ;Layer Masks Ignored
mov pfd.dwDamageMask,0 ;Layer Masks Ignored

;Get A Device Context
mov rcx,g_hWnd
call GetDC
cmp rax,0
je lbl_ErrGetDC
mov g_hDC,rax

;Spell hDC
mov rcx,g_hDC
mov rdx,g_hWnd
lea r8,szCreateGLWindow
lea r9,szGetDC
call Spell64

;Find A Matching Pixel Format
mov rcx,g_hDC
lea rdx,pfd
call ChoosePixelFormat
cmp rax,0
je lbl_ErrChoosePixelFormat
mov g_PixelFormat,rax

mov rcx,g_hDC
mov rdx,rax ;g_PixelFormat
lea r8,pfd
call SetPixelFormat
cmp rax,0
je lbl_ErrSetPixelFormat

mov rcx,g_hDC
call wglCreateContext
cmp rax,0
je lbl_ErrCreateContext
mov g_hRC,rax

;Spell hRC
mov rcx,g_hRC
mov rdx,g_hWnd
lea r8,szCreateGLWindow
lea r9,szGetRC
call Spell64

mov rcx,g_hDC
mov rdx,g_hRC
call wglMakeCurrent
cmp rax,0
je lbl_ErrMakeCurrent

;Show The Window
mov rcx,g_hWnd
mov rdx,5 ;SW_SHOW
call ShowWindow

;Slightly Higher Priority
mov rcx,g_hWnd
call SetForegroundWindow

;Sets Keyboard Focus To The Window
mov rcx,g_hWnd
call SetFocus

;Set Up Our Perspective GL Screen
call ReSizeGLScene
cmp rax,1
jne lbl_ErrReSizeGLScene

;Initialize Our Newly Created GL Window
call InitGL
cmp rax,1
jne lbl_ErrInitGL



;Normal Exit


;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szEnd
;lea r8,szCreateGLWindow
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

mov rax,1
jmp lbl_EndCreateGLWindow


;Error Markers


lbl_ErrCreateWindow:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrCreateWindow
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrAdjustWindow:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrAdjustWindow
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrRegisterClass:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrRegisterClass
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrGetDC:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrGetDC
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrChoosePixelFormat:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrChoosePixelFormat
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrSetPixelFormat:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrSetPixelFormat
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrCreateContext:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrCreateContext
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrMakeCurrent:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrMakeCurrent
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrReSizeGLScene:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrReSizeGLScene
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow

lbl_ErrInitGL:
call KillGLWindow
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrInitGL
lea r8,szCreateGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrCreateGLWindow


lbl_ErrCreateGLWindow:
xor rax,rax ;return FALSE


lbl_EndCreateGLWindow:
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
CreateGLWindow endp

