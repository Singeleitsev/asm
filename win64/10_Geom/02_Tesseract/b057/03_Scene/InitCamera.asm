;==============
InitCamera proc
;==============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov eax,f32_45
mov a_R3_YZ,eax
mov a_R3_XY,eax
mov a_R3_XZ,0

mov xTrans,0
mov yTrans,0
mov zTrans,0

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
InitCamera endp