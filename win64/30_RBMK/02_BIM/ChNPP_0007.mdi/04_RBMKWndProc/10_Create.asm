wmRBMKCreate:

;Allocate memory for window private data
sub rsp,20h
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof RBMKDATA
call HeapAlloc
add rsp,20h
mov lpRBMKData,rax

Call3 SetWindowLongPtrA,hwnd,0,lpRBMKData

;Start the timer going
Call4 SetTimer,hwnd,1,0FAh,0 ;250 ms = 0FAh

;Save some window handles
Call1 GetParent,hwnd
mov s_hwndClientRBMK,rax

Call1 GetParent,s_hwndClientRBMK
mov s_hwndFrameRBMK,rax

;OpenGL
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
mov rdx,rax
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

;return 0;
xor rax,rax
jmp endRBMKWndProc

