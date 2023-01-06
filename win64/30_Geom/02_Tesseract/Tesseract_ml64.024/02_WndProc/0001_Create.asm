lbl_wmcreate:

call GetDC
mov hdc,rax

lea rdi,pfd
mov rcx,5 ;sizeof.PIXELFORMATDESCRIPTOR shr 3

xor eax,eax
rep stosq

mov pfd.nSize,28h ;sizeof.PIXELFORMATDESCRIPTOR
mov pfd.nVersion,1
mov pfd.dwFlags,25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
mov pfd.iLayerType,0 ;PFD_MAIN_PLANE
mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
mov pfd.cColorBits,10h
mov pfd.cDepthBits,10h
mov pfd.cAccumBits,0
mov pfd.cStencilBits,0

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

mov rcx,hwnd
lea rdx,rc
call GetClientRect

xor rcx,rcx
xor rdx,rdx
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable

mov rcx,hwnd
mov rdx,1
mov r8,tick
xor r9,r9
call SetTimer
mov clock,eax

include TesseractInit.asm
include CameraInit.asm

xor eax,eax
jmp lbl_finish
