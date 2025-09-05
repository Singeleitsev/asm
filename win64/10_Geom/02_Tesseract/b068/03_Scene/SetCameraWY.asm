;===============
SetCameraWY proc
;===============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov eax,f32_45
mov a_R3_YZ,eax ;Camera Pitch
mov a_R3_XZ,0 ;Camera Roll - Need to Correct WSAD Camera Control
mov a_R3_XY,eax ;Camera Yaw

mov x3D_Trans,0
mov y3D_Trans,0
mov z3D_Trans,0 ;For glOrtho Mode
;mov eax,f32_neg_1 ;For glFrustum Mode
;mov z3D_Trans,eax

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
SetCameraWY endp

