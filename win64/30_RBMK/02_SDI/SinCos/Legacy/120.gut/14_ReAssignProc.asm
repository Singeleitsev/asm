ReAssign proc
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
mov eax,41200000h ;f32_10.0
mov dStep,eax
mov LinearSpeed,eax
mov LinearBoost,eax

;RotationSpeed
mov ebx,3F800000h ;f32_1.0
mov dAngle,ebx
mov AngularSpeed,ebx
mov AngularBoost,eax ;f32_10.0

;Model Angle
mov aYZ_Model,0
mov aXY_Model,41a00000h ;f32_20.0
mov aXZ_Model,0

;Camera Angles
mov aYZ_Cam,43960000h ;f32_300.0
mov aXY_Cam,0
mov aXZ_Cam,0

;Camera Position
mov xCam,0 ;0.0_f32
mov yCam,460ca000h ;f32_9000
mov zCam,0c58ca000h ;f32_neg4500

;Set Flags
mov isInitialPosition, 1
mov isRefreshed,0

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
ReAssign endp
