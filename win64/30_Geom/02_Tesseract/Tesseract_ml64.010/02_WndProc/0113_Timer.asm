lbl_wmtimer:

;xor rcx,rcx
;xor rdx,rdx
;xor r8,r8
;xor r9,r9

mov ecx,aYZ
mov edx,aXZ
mov r8d,aXY
mov r9d,1 ;1.0f
call glRotatef

mov rcx,4000h ;GL_COLOR_BUFFER_BIT
call glClear

include TesseractCalcVert.asm
include TesseractDraw.asm

mov rcx,hdc
xor rdx,rdx
xor r8,r8
xor r9,r9
call SwapBuffers

xor eax,eax
jmp lbl_finish