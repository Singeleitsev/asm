;Rotates the OBJECT about axes that pass through
;the object's own local origin,
;but whose DIRECTIONS are taken from the CAMERA's local frame:
;Turn axis is Object's up
;Tilt axis is parallel to Camera's right
;The object stays anchored at its own local origin.
;Composition: R_world * M_object -> M_object

;Comment style: little-endian

ObjectRotate proc lParam:DWORD
LOCAL angleX:DWORD,sinX:DWORD,cosX:DWORD
LOCAL angleZ:DWORD,sinZ:DWORD,cosZ:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;1. Process horizontal mouse delta - Rotate about Objects's +z axis.

;1.1. Check for Consistency
cmp dxMouse,0
je ObjRx

;1.2. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dxMouse

;1.3. Compute the Angle
mulss xmm0,ObjRotateSpeedHor ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss angleZ,xmm0 ;Store to memory so x87 can load it
fld angleZ ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp cosZ
fstp sinZ

;1.4. Load Sines and Cosines
movss xmm0,sinZ
shufps xmm0,xmm0,0 ;Broadcast SinA
movss xmm1,cosZ
shufps xmm1,xmm1,0 ;Broadcast CosA

;1.5. Compute the Matrix
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

;2. Process vertical mouse delta - Rotate about Camera's +x axis.
ObjRx:

;2.1. Check for Consistency
cmp dyMouse,0
je ObjectRotate_End

;2.2. Get the Object's Local Position
mov eax,dword ptr[mtxObjectVolatile+12*4]
mov ebx,dword ptr[mtxObjectVolatile+13*4]
mov ecx,dword ptr[mtxObjectVolatile+14*4]

;2.3. Save the Object's Local Position
mov dword ptr[vecObjPos+0],eax
mov dword ptr[vecObjPos+4],ebx
mov dword ptr[vecObjPos+8],ecx

;2.4. Translate the Object to the World Origin
mov dword ptr[mtxObjectVolatile+12*4],0
mov dword ptr[mtxObjectVolatile+13*4],0
mov dword ptr[mtxObjectVolatile+14*4],0

;2.5. Load the Mouse Delta (signed)
cvtsi2ss xmm0,dyMouse

;2.6. Compute the Angle
mulss xmm0,ObjRotateSpeedVer ;Degrees by Pixel
mulss xmm0,f32_PiOver180 ;xmm0 = angle in radians (in SSE)
movss angleX,xmm0 ;Store to memory so x87 can load it
fld angleX ; ST(0) = angle
fsincos ; ST(0) = cos, ST(1) = sin
fstp cosX
fstp sinX

;2.7. Load Sines and Cosines
movss xmm3,sinX
shufps xmm3,xmm3,0 ;Broadcast SinA
movss xmm4,cosX
shufps xmm4,xmm4,0 ;Broadcast CosA

;2.8. Grab the Camera's basis vector (world space)

;Tilt axis (camera right)
;ux = mtxCameraVolatile(0)
;uy = mtxCameraVolatile(4)
;uz = mtxCameraVolatile(8)
movss xmm0,dword ptr[mtxCameraVolatile+00*4]
movss xmm1,dword ptr[mtxCameraVolatile+04*4]
movss xmm2,dword ptr[mtxCameraVolatile+08*4]

;2.9. Normalize vector (ux,uy,uz)
movss xmm5,xmm0 ;x
movss xmm6,xmm1 ;y
movss xmm7,xmm2 ;z
mulss xmm0,xmm0 ;x*x
mulss xmm1,xmm1 ;y*y
mulss xmm2,xmm2 ;z*z
addss xmm0,xmm1 ;x*x + y*y
addss xmm0,xmm2 ;xmm0[0] = len*len
rsqrtss xmm0,xmm0 ;xmm0 = [1/len]
mulss xmm5,xmm0 ;xmm5 = nx
mulss xmm6,xmm0 ;xmm6 = ny
mulss xmm7,xmm0 ;xmm7 = nz
shufps xmm5,xmm5,0 ;xmm5 = [nx,nx,nx,nx]
shufps xmm6,xmm6,0 ;xmm6 = [ny,ny,ny,ny]
shufps xmm7,xmm7,0 ;xmm7 = [nz,nz,nz,nz]

;2.10. Build the Rodrigues 3x3 rotation matrix (world space)
;t = 1 - cosA
movss xmm2,f32_posOne
shufps xmm2,xmm2,0 ;broadcast posOne
subss xmm2,xmm4
shufps xmm2,xmm2,0 ;xmm2 = [t,t,t,t]

;Initial state:
;xmm0 = 0,z,y,x 
;xmm1 = free (junk)
;xmm2 = t,t,t,t
;xmm3 = sinA,sinA,sinA,sinA
;xmm4 = cosA,cosA,cosA,cosA
;xmm5 = x,x,x,x
;xmm6 = y,y,y,y
;xmm7 = z,z,z,z

;2.11. Compute Rodrigues and store Store in mtxRodrigues (column-major)
;|m00 m04 m08| <- |r00 r01 r02|
;|m01 m05 m09| <- |r10 r11 r12|
;|m02 m06 m10| <- |r20 r21 r22|

;So memory layout is:
;mtxRodrigues(00) = t*x*x+cosA
;mtxRodrigues(01) = t*x*y+sinA*z
;mtxRodrigues(02) = t*x*z-sinA*y
;mtxRodrigues(03) = 0
;mtxRodrigues(04) = t*y*x-sinA*z
;mtxRodrigues(05) = t*y*y+cosA
;mtxRodrigues(06) = t*y*z+sinA*x
;mtxRodrigues(07) = 0
;mtxRodrigues(08) = t*z*x+sinA*y
;mtxRodrigues(09) = t*z*y-sinA*x
;mtxRodrigues(10) = t*z*z+cosA
;mtxRodrigues(11) = 0
;mtxRodrigues(12) = 0
;mtxRodrigues(13) = 0
;mtxRodrigues(14) = 0
;mtxRodrigues(15) = 1

lea ecx,mtxRodrigues

mulps xmm0,xmm2 ;0,t*z,t*y,t*x
movaps xmm1,xmm0 ;0,t*z,t*y,t*x
movaps xmm2,xmm0 ;0,t*z,t*y,t*x

mulps xmm0,xmm5 ;0,t*z*x,t*y*x,t*x*x
mulps xmm1,xmm6 ;0,t*z*y,t*y*y,t*x*y
mulps xmm2,xmm7 ;0,t*z*z,t*y*z,t*x*z

mulss xmm5,xmm3 ;?,?,?,sinA*x
mulss xmm6,xmm3 ;?,?,?,sinA*y
mulss xmm7,xmm3 ;?,?,?,sinA*z

addss xmm0,xmm4 ;0,t*z*x,t*y*x,t*x*x+cosA
movss dword ptr[ecx+00*4],xmm0
shufps xmm0,xmm0,00111001b ;a00,0,t*z*x,t*y*x
subss xmm0,xmm7 ;a00,0,t*z*x,t*y*x-sinA*z
movss dword ptr[ecx+04*4],xmm0
shufps xmm0,xmm0,00111001b ;a04,a00,0,t*z*x
addss xmm0,xmm6 ;a04,a00,0,t*z*x+sinA*y
movss dword ptr[ecx+08*4],xmm0

addss xmm1,xmm7 ;0,t*z*y,t*y*y,t*x*y+sinA*z
movss dword ptr[ecx+01*4],xmm1
shufps xmm1,xmm1,00111001b ;a01,0,t*z*y,t*y*y
addss xmm1,xmm4 ;a01,0,t*z*y,t*y*y+cosA
movss dword ptr[ecx+05*4],xmm1
shufps xmm1,xmm1,00111001b ;a05,a01,t*z*y
subss xmm1,xmm5 ;a05,a01,t*z*y-sinA*x
movss dword ptr[ecx+09*4],xmm1

subss xmm2,xmm6 ;0,t*z*z,t*y*z,t*x*z-sinA*y
movss dword ptr[ecx+02*4],xmm2
shufps xmm2,xmm2,00111001b ;a02,0,t*z*z,t*y*z
addss xmm2,xmm5 ;a02,0,t*z*z,t*y*z+sinA*x
movss dword ptr[ecx+06*4],xmm2
shufps xmm2,xmm2,00111001b ;a06,a02,0,t*z*z
addss xmm2,xmm4 ;a06,a02,0,t*z*z+cosA
movss dword ptr[ecx+10*4],xmm2

xorps xmm0,xmm0
movss dword ptr[ecx+03*4],xmm0
movss dword ptr[ecx+07*4],xmm0
movss dword ptr[ecx+11*4],xmm0
movss xmm0,f32_posOne
movss dword ptr[ecx+15*4],xmm0

;2.12. R * M_object -> M_object (pre-multiply, world-space rotation)

;Copy mtxObjectVolatile to the buffer
cld
mov ecx,16
lea esi,mtxObjectVolatile
lea edi,mtxBuffer
rep movsd

;mtxObjectVolatile = Mat4Mul(R, mtxObjectVolatile)
push offset mtxObjectVolatile
push offset mtxBuffer
push offset mtxRodrigues
call MulMat4Mat4

;3. Restore the Object's Local Position
RestoreObjPos:

;3.1. Get the Object's LocalPosition
mov eax,dword ptr[vecObjPos+0]
mov ebx,dword ptr[vecObjPos+4]
mov ecx,dword ptr[vecObjPos+8]

;3.2. Set the Object's Local Position
mov dword ptr[mtxObjectVolatile+12*4],eax
mov dword ptr[mtxObjectVolatile+13*4],ebx
mov dword ptr[mtxObjectVolatile+14*4],ecx

ObjectRotate_End:
;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
ObjectRotate endp


