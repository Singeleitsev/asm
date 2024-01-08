CreateGLWindow proc

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
call LoadIconA
mov wc.hIcon,rax
mov wc.hIconSm,rax
;Load Cursor
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
call LoadCursorA
mov wc.hCursor,rax
mov wc.hbrBackground,0
mov wc.lpszMenuName,0
lea rax,szClass
mov wc.lpszClassName,rax

;Now call the Function
lea rcx,wc
call RegisterClassExA

;Create the Window
mov rcx,40100h ;dwExStyle = WS_EX_APPWINDOW + WS_EX_WINDOWEDGE
lea rdx,szClass
lea r8,szTitle
mov r9,16CF0000h ;dwStyle = WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS = 16CF.0000h
xor rax,rax
mov eax,rc.left
mov qword ptr [rsp+20h],10h ;x = 16
mov eax,rc.top
mov qword ptr [rsp+28h],10h ;y = 16
mov qword ptr [rsp+30h],1B0h ;nWidth = 432
mov qword ptr [rsp+38h],1B0h ;nHeight = 432
mov qword ptr [rsp+40h],0 ;hWndParent
mov qword ptr [rsp+48h],0 ;hMenu
mov rax,g_hInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
mov g_hWnd,rax

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

mov rcx, g_hWnd
call GetDC
mov hdc,rax

mov rcx,hdc
lea rdx,pfd
call ChoosePixelFormat

mov rcx,hdc
mov edx,eax
lea r8,pfd
call SetPixelFormat

mov rcx,hdc
call wglCreateContext
mov hrc,rax

mov rcx,hdc
mov rdx,hrc
call wglMakeCurrent

;mov rcx,g_hWnd
;lea rdx,rc
;call GetClientRect

;mov rcx,0
;mov rdx,0
;mov r8d,rc.right
;mov r9d,rc.bottom
;call glViewport

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

mov rax,1
ret
CreateGLWindow endp

