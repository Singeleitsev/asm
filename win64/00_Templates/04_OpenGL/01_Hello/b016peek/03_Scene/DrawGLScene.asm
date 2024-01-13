DrawGLScene proc

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,4000h ;GL_COLOR_BUFFER_BIT
call glClear

include Square.asm
;include Pyramid.asm

mov rcx,hdc
call SwapBuffers

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

mov rax,1
ret
DrawGLScene endp

