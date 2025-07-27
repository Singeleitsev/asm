GLResize proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,RectWidth
xor r9,r9
mov r9d,RectHeight
Call glViewport ;(0, 0, RectWidth, RectHeight)

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
GLResize endp
