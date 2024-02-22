
;==============
SetupWorld proc
;==============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov eax,f32_45 
mov aYZ,eax
mov aXY,eax

mov xTrans,0
mov yTrans,0
mov zTrans,0
;mov eax,f32_neg_50000
;mov zTrans,eax


;include 04_Object\RBMKInit.asm


;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
SetupWorld endp


