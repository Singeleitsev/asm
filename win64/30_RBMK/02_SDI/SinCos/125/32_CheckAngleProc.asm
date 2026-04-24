;xmm0 = Angle

CheckAngle proc

;Prologue:
push rbp
mov rbp,rsp

;Stack Alignment Are Not Necessaty because
;There are no further Calls in this Procedure
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;Load Common Values
movss xmm14,f32_360 ;xmm14 = 360 Degrees
xorps xmm15,xmm15 ;xmm15 = 0

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
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

;Epilogue:
leave
ret
CheckAngle endp

;OUTPUT:
;xmm0 = Angle After Correction
