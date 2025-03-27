;======================================================
ReSizeGLScene proc ;SceneWidth:QWORD, SceneHeight:QWORD
;======================================================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Reset The Current Viewport
xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,nWidth
xor r9,r9
mov r9d,nHeight
call glViewport

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
ReSizeGLScene endp

