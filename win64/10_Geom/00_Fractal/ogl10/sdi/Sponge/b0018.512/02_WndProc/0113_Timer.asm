lbl_wmtimer:

;xor rcx,rcx
;xor rdx,rdx
;xor r8,r8
;xor r9,r9

include CameraRotate.asm

;GL_COLOR_BUFFER_BIT = 4000h
;GL_DEPTH_BUFFER_BIT = 100h
mov rcx,4100h 
call glClear

include TesseractDraw.asm

mov rcx,hdc
xor rdx,rdx
xor r8,r8
xor r9,r9
call SwapBuffers

xor eax,eax
jmp lbl_finish

