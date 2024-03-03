
;==============
R4_To_R3_Proc proc
;==============

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer



;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

R4_To_R3_Proc endp


