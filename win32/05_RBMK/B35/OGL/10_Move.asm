;CameraWalk

;Moves the camera along one of its own axes in the signed direction
;with mtxCameraVolatile
;Parameters (stdcall):
; direction: signed REAL4, either -1.0 or 1.0
; axis:
;  0 = Model +x = OpenGL +x
;  1 = Model +y = OpenGL -z
;  2 = Model +z = OpenGL +y

CameraWalk proc direction:REAL4, axis:DWORD

;1.1. Get the Regular Speed
;xStep = LinearSpeed
movss xmm0,LinearSpeed

;1.2. Check for Linear Boost
cmp byte ptr[key+10h],0 ;Shift
je UseDirection

;1.3. Linear Boost
;xStep = xStep * LinearBoost
mulss xmm0,LinearBoost

;1.4. Use the Direction
UseDirection:
;xStep = xStep * Direction
mulss xmm0,direction ;xmm0 = xStep (signed)

;1.5. Store the Magnitudes:
movss xmm1,xmm0 ;xmm1 = yStep (signed)
movss xmm2,xmm0 ;xmm2 = zStep (signed)

;2.1. Compute the Chosen Axis offset
mov eax,axis
shl eax,2 ;axis_index * 4 bytes

;2.2. Point to the Camera Matrix
lea ecx,mtxCameraVolatile

;2.3. Compute the Chosen Axis address
add eax,ecx

;x|00|04|08|12|
;y|01|05|09|13|
;z|02|06|10|14|
;w|03|07|11|15|

;3. world = distance * column[axis]

;dx_local = dStep * mtxCameraVolatile(0i)
;dy_local = dStep * mtxCameraVolatile(1i)
;dz_local = dStep * mtxCameraVolatile(2i)
mulss xmm0,dword ptr[eax+0*4]
mulss xmm1,dword ptr[eax+4*4]
mulss xmm2,dword ptr[eax+8*4]

;Fill all 4 xmm lanes
shufps xmm0,xmm0,0 ;dx_local
shufps xmm1,xmm1,0 ;dy_local
shufps xmm2,xmm2,0 ;dz_local

;Accumulate world-space displacement

;dx contributes to world via column 0
;dy contributes to world via column 1
;dz contributes to world via column 2

;dx_world = dx_local*m[00] + dy_local*m[04] + dz_local*m[08]
;dy_world = dx_local*m[01] + dy_local*m[05] + dz_local*m[09]
;dz_world = dx_local*m[02] + dy_local*m[06] + dz_local*m[10]

movaps xmm3,oword ptr[ecx+0*4] ;old[00..03]
movaps xmm4,oword ptr[ecx+4*4] ;old[04..07]
movaps xmm5,oword ptr[ecx+8*4] ;old[08..11]

mulps xmm0,xmm3
mulps xmm1,xmm4
mulps xmm2,xmm5

addps xmm0,xmm1
addps xmm0,xmm2

;Add to the Translation Column

;x_world = x_world + dx_world
;y_world = y_world + dy_world
;z_world = z_world + dz_world

movaps xmm6,oword ptr[ecx+12*4] ;old[12..15]
addps xmm0,xmm6

;Store the computed values
movaps oword ptr[ecx+12*4],xmm0

CameraWalk_End:
mov isInitialPosition,0
mov isRefreshed,0
ret
CameraWalk endp


