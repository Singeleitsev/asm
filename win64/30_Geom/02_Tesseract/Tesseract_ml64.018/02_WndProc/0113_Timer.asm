lbl_wmtimer:

;xor rcx,rcx
;xor rdx,rdx
;xor r8,r8
;xor r9,r9

mov eax,3F800000h ;1.0f
movd xmm0,eax ;Angle
movd xmm1,aYZ
movd xmm2,aXZ
movd xmm3,aXY
call glRotatef

;GL_COLOR_BUFFER_BIT = 4000h
;GL_DEPTH_BUFFER_BIT = 100h
mov rcx,4100h 
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

