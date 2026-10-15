;Magnitude for the Camera Walk mode
;Input:
;xmm0 = direction:REAL4 (either +1.0 or -1.0)

CameraWalkMagnitude proc
PROLOG 100h

;xmm0 = direction:REAL4
mulss xmm0,CamWalkSpeed

cmp byte ptr[key+10h],0 ;Shift
jne SetBoost
EPILOG

SetBoost:
mulss xmm0,CamWalkBoost
EPILOG
CameraWalkMagnitude endp

;Camera is Moved by three Methods:
;CameraWalk - by Keyboard
;CameraDrag - by Mouse
;CameraDolly - by Mouse

;Move the Camera along one of its own axes
;with specified speed, sign of speed is direction
;affecting mtxCameraVolatile
;Input:
;xmm0 = magnitude:REAL4 (sign is direction)
;rcx = axis:DWORD
;0 = Camera +x = OpenGL +x
;1 = Camera +y = OpenGL -z
;2 = Camera +z = OpenGL +y

CameraMove proc
PROLOG 100h

;rcx = axis
;xmm0 = magnitude

;1. Load the Speed (signed)
;xmm0 = magnitude
movss xmm1,xmm0
movss xmm2,xmm0

;2. Compute the Chosen Axis offset
shl rcx,2 ;axis_index * 4 bytes

;3. Point to the Camera Matrix
lea rdx,mtxCameraVolatile

;4. Compute the Chosen Axis address
add rcx,rdx

;5. Compute the Displacement
;x|00|04|08|12|
;y|01|05|09|13|
;z|02|06|10|14|
;w|03|07|11|15|

;5.1 Local Displacement

;dx_local = dStep * m[axis+0]
;dy_local = dStep * m[axis+4]
;dz_local = dStep * m[axis+8]

mulss xmm0,dword ptr[rcx+0*4]
mulss xmm1,dword ptr[rcx+4*4]
mulss xmm2,dword ptr[rcx+8*4]

;5.2. Fill all 4 xmm lanes
shufps xmm0,xmm0,0 ;dx_local
shufps xmm1,xmm1,0 ;dy_local
shufps xmm2,xmm2,0 ;dz_local

;5.3. Accumulate world-space displacement

;dx contributes to world via column 0
;dy contributes to world via column 1
;dz contributes to world via column 2

;dx_world = dx_local*m00 + dy_local*m04 + dz_local*m08
;dy_world = dx_local*m01 + dy_local*m05 + dz_local*m09
;dz_world = dx_local*m02 + dy_local*m06 + dz_local*m10

mulps xmm0,oword ptr[rdx+0*4] ;old[00..03]
mulps xmm1,oword ptr[rdx+4*4] ;old[04..07]
mulps xmm2,oword ptr[rdx+8*4] ;old[08..11]

addps xmm0,xmm1
addps xmm0,xmm2

;5.4. Add to the Translation Column

;x_world = x_world + dx_world
;y_world = y_world + dy_world
;z_world = z_world + dz_world

addps xmm0,oword ptr[rdx+12*4] ;old[12..15]

;5.5. Store the computed values
movaps oword ptr[rdx+12*4],xmm0

;6. Set Flags
mov isInitialPosition,0
mov isRefreshed,0

EPILOG
CameraMove endp


