;INPUT:
;xmm0 = Angle
;xmm14 = 360 Degrees
;xmm15 = 0

CheckAngle proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
;push rbp
;mov rbp,rsp

;Stack Alignment Are Not Necessaty because
;There are no further Calls in this Procedure
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;Is Negative?
comiss xmm0,xmm15 ;Compare xmm0 to Zero
jc lbl_CheckAngleNegative

;Exceeds 360 Dergees?
comiss xmm0,xmm14
jc lbl_CheckAngle_End

;lbl_CheckAnglePositive:
subss xmm0,xmm14 ;Angle = Angle-360
jmp lbl_CheckAngle_End

lbl_CheckAngleNegative:
addss xmm0,xmm14 ;Angle = Angle+360

lbl_CheckAngle_End:

;add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave
ret
CheckAngle endp

;OUTPUT:
;xmm0 = Angle After Correction
