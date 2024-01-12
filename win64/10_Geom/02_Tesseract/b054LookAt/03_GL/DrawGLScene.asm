;===============
DrawGLScene proc
;===============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Clear Screen And Depth Buffer
mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
call glClear

call CameraMove

;Describe Geometry Here
;======================

include 04_Object\TesseractCalcVert.asm
;include 04_Object\CameraRotate.asm
include 04_Object\TesseractDraw.asm

;======================

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
DrawGLScene endp
