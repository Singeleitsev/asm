lbl_wmcreate:

call GetDC
mov hdc,rax

lea rdi,pfd
mov rcx,5 ;sizeof.PIXELFORMATDESCRIPTOR shr 3

xor eax,eax
rep stosq

mov pfd.nSize,28h
mov pfd.nVersion,1
mov pfd.dwFlags,25h
mov pfd.iLayerType,0
mov pfd.iPixelType,0
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

mov rcx,0
mov rdx,0
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

mov rcx,hwnd
mov rdx,1
mov r8,0Ah ;USER_TIMER_MINIMUM = 0Ah = 10 ms
xor r9,r9
call SetTimer
mov clock,eax

include TesseractInitVert.asm

xor eax,eax
jmp lbl_finish
