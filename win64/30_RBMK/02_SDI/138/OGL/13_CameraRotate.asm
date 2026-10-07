;Camera and Object operate their own Local coordinate systems
;and their own Camera and Object Matrices
;Local +x = OpenGL +x
;Local +y = OpenGL -z
;Local +z = OpenGL +y

CameraRotate proc lParam:QWORD
PROLOG 100h

;mov lParam,r9

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;1.1. Save the Camera's World Position
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin

;1.2. Load Camera Matrix Address
lea rcx,mtxCameraVolatile

;1.3. Translate the Camera to the Origin
mov dword ptr[rcx+12*4],0
mov dword ptr[rcx+13*4],0
mov dword ptr[rcx+14*4],0

;2.1. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dxMouse

;2.2. Check for Consistency
movss xmm1,xmm0
mulss xmm1,xmm1
comiss xmm1,f32_epsilon ;is dxMouse^2 < epsilon?
jb CamRx

;2.3. Compute the Angle
mulss xmm0,CamRotateSpeedHor ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss CamAngleHor,xmm0 ;Store to memory so x87 can load it
fld CamAngleHor ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp CamCosHor
fstp CamSinHor
fstp st(0) ;Stack balance

;2.4. Load Sines and Cosines
movss xmm0,CamSinHor
shufps xmm0,xmm0,0 ;Broadcast SinA
movss xmm1,CamCosHor
shufps xmm1,xmm1,0 ;Broadcast CosA

;3. Compute the Matrix
lea rcx,mtxCameraVolatile

;x|00|04|08|12| |x|cos|-sin|0|0|
;y|01|05|09|13| |y|sin| cos|0|0|
;z|02|06|10|14| |z| 0 |  0 |1|0|
;w|03|07|11|15| |w| 0 |  0 |0|1|
movaps xmm2,oword ptr[rcx+0*4] ;old[00..03]
movaps xmm3,oword ptr[rcx+4*4] ;old[04..07]
movaps xmm4,xmm2 ;old[00..03]
movaps xmm5,xmm3 ;old[04..07]

;new[00] = cos*old[00] + sin*old[04]
;new[01] = cos*old[01] + sin*old[05]
;new[02] = cos*old[02] + sin*old[06]
;new[03] = cos*old[03] + sin*old[07]
mulps xmm2,xmm1 ;old[00..03]*cos
mulps xmm3,xmm0 ;old[04..07]*sin
addps xmm2,xmm3
movaps oword ptr[rcx+0*4],xmm2 ;new[00..03]

;new[04] = cos*old[04] - sin*old[00]
;new[05] = cos*old[05] - sin*old[01]
;new[06] = cos*old[06] - sin*old[02]
;new[07] = cos*old[07] - sin*old[03]
mulps xmm4,xmm0 ;old[00..03]*sin
mulps xmm5,xmm1 ;old[04..07]*cos
subps xmm5,xmm4
movaps oword ptr[rcx+4*4],xmm5 ;new[04..07]

CamRx:
;4.1. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dyMouse

;4.2. Check for Consistency
movss xmm1,xmm0
mulss xmm1,xmm1
comiss xmm1,f32_epsilon ;is dyMouse^2 < epsilon?
jb RestoreCamPos

;4.3. Compute the Angle
mulss xmm0,CamRotateSpeedVer ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss CamAngleVer,xmm0 ;Store to memory so x87 can load it
fld CamAngleVer ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp CamCosVer
fstp CamSinVer
fstp st(0) ;Stack balance

;4.4. Load Sines and Cosines
movss xmm0,CamSinVer
shufps xmm0,xmm0,0 ;Broadcast SinA
movss xmm1,CamCosVer
shufps xmm1,xmm1,0 ;Broadcast CosA

;5. Compute the Matrix
;lea rcx,mtxCameraVolatile

;x|00|04|08|12| |x|1| 0 |  0 |0|
;y|01|05|09|13| |y|0|cos|-sin|0|
;z|02|06|10|14| |z|0|sin| cos|0|
;w|03|07|11|15| |w|0| 0 |  0 |1|

;Load Values
movaps xmm2,oword ptr[rcx+4*4] ;old[04..07]
movaps xmm3,oword ptr[rcx+8*4] ;old[08..11]
movaps xmm4,xmm2 ;old[04..07]
movaps xmm5,xmm3 ;old[08..11]

;new[04] = cos*old[04] + sin*old[08]
;new[05] = cos*old[05] + sin*old[09]
;new[06] = cos*old[06] + sin*old[10]
;new[07] = cos*old[07] + sin*old[11]
mulps xmm2,xmm1 ;old[04..07]*cos
mulps xmm3,xmm0 ;old[08..11]*sin
addps xmm2,xmm3
movaps oword ptr[rcx+4*4],xmm2 ;new[04..07]

;new[08] = cos*old[08] - sin*old[04]
;new[09] = cos*old[09] - sin*old[05]
;new[10] = cos*old[10] - sin*old[06]
;new[11] = cos*old[11] - sin*old[07]
mulps xmm5,xmm1 ;old[08..11]*cos
mulps xmm4,xmm0 ;old[04..07]*sin
subps xmm5,xmm4
movaps oword ptr[rcx+8*4],xmm5 ;new[08..11]

;6. Restore the Camera's World Position
RestoreCamPos:
lea rcx,mtxCameraVolatile 
lea rdx,vecCamPos
call SetGlobalOrigin

CameraRotate_End:
;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

EPILOG
CameraRotate endp


