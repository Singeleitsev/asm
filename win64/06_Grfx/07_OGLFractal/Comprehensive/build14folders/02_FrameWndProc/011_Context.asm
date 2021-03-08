
call GetDC
mov hDC,rax

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

mov rcx,hDC
lea rdx,pfd
call ChoosePixelFormat

mov rcx,hDC
mov edx,eax
lea r8,pfd
call SetPixelFormat

mov rcx,hDC
call wglCreateContext
mov hRC,rax

mov rcx,hDC
mov rdx,hRC
call wglMakeCurrent

;mov rcx,hwnd
mov rcx,hWndClient
lea rdx,rc
call GetClientRect

mov rcx,0
mov rdx,0
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

call GetTickCount
mov clock,eax

