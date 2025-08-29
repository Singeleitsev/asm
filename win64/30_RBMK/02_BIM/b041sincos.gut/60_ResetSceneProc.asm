ResetScene proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Black Background
xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glClearColor

;Motion Speed
mov LinearBoost,41200000h ;10.0_f32
mov eax,3DCCCCCDh ;0.1_f32
mov LinearSpeed,eax
mov dStep,eax

;RotationSpeed
mov AngularBoost,41200000h ;10.0_f32
mov eax,3F800000h ;1.0_f32
mov AngularSpeed,eax
mov dAngle,eax

;Model Scale
mov eax,3A83126Fh ;0.001_f32
mov GlobalScale,eax

;Model Angle
mov eax,41a00000h ;20.0_f32
mov aXY_Model,eax

;Camera Angles
mov aYZ_Cam,43960000h ;300.0_f32
mov aXY_Cam,0
mov aXZ_Cam,0

;Camera Position
mov xCam,0 ;0.0_f32
mov yCam,41100000h ;9.0_f32
mov zCam,0c0900000h ;-4.5_f32

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
ResetScene endp
