CheckAngle proc lpAngle:QWORD
LOCAL Angle:DWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Store Values
mov lpAngle,rcx
mov edx,dword ptr[rcx]
mov Angle,edx

;Test IEEE 754 Zero Bit
bt edx,31 ;Is Negative?
jc lbl_CheckAngleNegative

cmp edx,f32_360 ;Exceeds 360 Dergees?
jl lbl_CheckAngle_End

;lbl_CheckAnglePositive:
fld Angle
fsub f32_360
jmp lbl_CheckAngleStore

lbl_CheckAngleNegative:
fld Angle
fadd f32_360

lbl_CheckAngleStore:
fstp Angle
mov edx,Angle
mov dword ptr[rcx],edx

lbl_CheckAngle_End:
mov isRefreshed,0

add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
CheckAngle endp
