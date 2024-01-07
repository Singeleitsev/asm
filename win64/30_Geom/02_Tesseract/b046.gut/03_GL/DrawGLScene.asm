;===============
DrawGLScene proc
;===============

;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;and rsp,-16 ;Align the Stack
sub rsp,108h ;Create the Buffer

;Clear Screen And Depth Buffer
mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
call glClear

;Describe Geometry Here
;======================

include 04_Object\Pyramid.asm
include 04_Object\Quad.asm

;======================

;Normal Exit

mov rax,1
add rsp,108h
;Assembler will add this epilogue automatically:
;leave
ret

DrawGLScene endp
