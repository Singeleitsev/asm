;Camera and Object operate their own Local coordinate systems
;and their own Camera and Object Matrices
;Local +x = OpenGL +x
;Local +y = OpenGL -z
;Local +z = OpenGL +y

ObjectRotate proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;1. Load Object Matrix Address
lea ecx,mtxObjectVolatile

;2.1. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dxMouse

;2.2. Check for Consistency
movss xmm1,xmm0
mulss xmm1,xmm1
movss xmm2,f32_epsilon
comiss xmm1,xmm2 ;is dxMouse^2 < epsilon?
jb ObjRx

;2.3. Compute the Angle
mulss xmm0,ObjRotateSpeedHor ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss ObjAngleHor,xmm0 ;Store to memory so x87 can load it
fld ObjAngleHor ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp ObjCosHor
fstp ObjSinHor

;2.4. Load Sines and Cosines
movss xmm0,ObjSinHor
shufps xmm0,xmm0,0 ;Broadcast SinA
movss xmm1,ObjCosHor
shufps xmm1,xmm1,0 ;Broadcast CosA

;3. Compute the Matrix
lea ecx,mtxObjectVolatile

;x|00|04|08|12| |x|cos|-sin|0|0|
;y|01|05|09|13| |y|sin| cos|0|0|
;z|02|06|10|14| |z|  0|   0|1|0|
;w|03|07|11|15| |w|  0|   0|0|1|
movaps xmm2,oword ptr[ecx+0*4] ;old[00..03]
movaps xmm3,oword ptr[ecx+4*4] ;old[04..07]
movaps xmm4,xmm2 ;old[00..03]
movaps xmm5,xmm3 ;old[04..07]

;new[00] = cos*old[00] + sin*old[04]
;new[01] = cos*old[01] + sin*old[05]
;new[02] = cos*old[02] + sin*old[06]
;new[03] = cos*old[03] + sin*old[07]
mulps xmm2,xmm1 ;old[00..03]*cos
mulps xmm3,xmm0 ;old[04..07]*sin
addps xmm2,xmm3
movaps oword ptr[ecx+0*4],xmm2 ;new[00..03]

;new[04] = cos*old[04] - sin*old[00]
;new[05] = cos*old[05] - sin*old[01]
;new[06] = cos*old[06] - sin*old[02]
;new[07] = cos*old[07] - sin*old[03]
mulps xmm4,xmm0 ;old[00..03]*sin
mulps xmm5,xmm1 ;old[04..07]*cos
subps xmm5,xmm4
movaps oword ptr[ecx+4*4],xmm5 ;new[04..07]

ObjRx:
;4.1. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dyMouse

;4.2. Check for Consistency
movss xmm1,xmm0
mulss xmm1,xmm1
movss xmm2,f32_epsilon
comiss xmm1,xmm2 ;is dyMouse^2 < epsilon?
jb ObjectRotate_End

;4.3. Compute the Angle
mulss xmm0,ObjRotateSpeedVer ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss ObjAngleVer,xmm0 ;Store to memory so x87 can load it
fld ObjAngleVer ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp ObjCosVer
fstp ObjSinVer
fstp st(0) ;Stack balance

;4.4. Load Sines and Cosines
movss xmm0,ObjSinVer
shufps xmm0,xmm0,0 ;Broadcast SinA
movss xmm1,ObjCosVer
shufps xmm1,xmm1,0 ;Broadcast CosA

;5. Compute the Matrix
;x|00|04|08|12| |x|1|  0|   0|0|
;y|01|05|09|13| |y|0|cos|-sin|0|
;z|02|06|10|14| |z|0|sin| cos|0|
;w|03|07|11|15| |w|0|  0|   0|1|

;Load Values
movaps xmm2,oword ptr[ecx+4*4] ;old[04..07]
movaps xmm3,oword ptr[ecx+8*4] ;old[08..11]
movaps xmm4,xmm2 ;old[04..07]
movaps xmm5,xmm3 ;old[08..11]

;new[04] = cos*old[04] + sin*old[08]
;new[05] = cos*old[05] + sin*old[09]
;new[06] = cos*old[06] + sin*old[10]
;new[07] = cos*old[07] + sin*old[11]
mulps xmm2,xmm1 ;old[04..07]*cos
mulps xmm3,xmm0 ;old[08..11]*sin
addps xmm2,xmm3
movaps oword ptr[ecx+4*4],xmm2 ;new[04..07]

;new[08] = cos*old[08] - sin*old[04]
;new[09] = cos*old[09] - sin*old[05]
;new[10] = cos*old[10] - sin*old[06]
;new[11] = cos*old[11] - sin*old[07]
mulps xmm5,xmm1 ;old[08..11]*cos
mulps xmm4,xmm0 ;old[04..07]*sin
subps xmm5,xmm4
movaps oword ptr[ecx+8*4],xmm5 ;new[08..11]

ObjectRotate_End:
;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
ObjectRotate endp


