lbl_wmtimer:

;xor rcx,rcx
;xor rdx,rdx
;xor r8,r8
;xor r9,r9

movd xmm0,aYZ
movd xmm1,aXZ
movd xmm2,aXY
mov eax,3F800000h ;1.0f
movd xmm3,eax
call glRotatef

mov rcx,4000h ;GL_COLOR_BUFFER_BIT
call glClear

include TesseractCalcVert.asm
include TesseractDraw.asm
;include OGLDraw.asm

mov rcx,hdc
xor rdx,rdx
xor r8,r8
xor r9,r9
call SwapBuffers

xor eax,eax
jmp lbl_finish

