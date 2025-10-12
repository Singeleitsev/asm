wmRBMKTimer:

Call2 GetWindowLongPtrA,hwnd,0
mov lpRBMKData,rax

;hdc = GetDC(hwnd);
Call1 GetDC, hwnd
mov hdc, rax



;OpenGL
movd xmm0,aXY
movd xmm1,aXZ
movd xmm2,aYZ
movd xmm3,one
call glRotatef

mov rcx,4000h ;GL_COLOR_BUFFER_BIT
call glClear

include 41_DrawCap.asm 

mov rcx,hdc
call SwapBuffers


;return 0;
xor rax, rax
jmp endRBMKWndProc

