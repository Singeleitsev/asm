;CheckKeys:

;Return to Normal Speed
;dStep = LinearSpeed
movss xmm0,LinearSpeed
;dAngle = AngularSpeed
movss xmm1,AngularSpeed

;Boost
cmp byte ptr[key+10h],0 ;Shift
je @f
;dStep = dStep * LinearBoost
mulss xmm0,LinearBoost
;dAngle = dAngle * AngularBoost
mulss xmm1,AngularBoost

@@:
;Store Positives
movss posStep,xmm0
movss posAngle,xmm1

;Compute Negatives
xorps xmm2,xmm2
subss xmm2,xmm0
movss negStep,xmm2
xorps xmm3,xmm3
subss xmm3,xmm1
movss negAngle,xmm3

;Model Movement
;------------------------------------------------------------
;Camera convention for this project:
;- Camera looks along world +y (not the OpenGL default -z)
;- Camera is tilted down slightly (~ -z component)
;- "Forward" in the code = the camera's own forward axis,
;  which corresponds to matrix column indices 2,6,10 here.
;- Pressing Up walks the camera forward; on screen the
;  world appears to move backward. That is intended.
;------------------------------------------------------------
;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

@@:
;Up Arrow | Camera moves Backward | OpenGL +z axis
cmp byte ptr[key+26h],0
je @f
;dx = posStep * mtxCameraVolatile(2) ;2 is for z axis
;dy = posStep * mtxCameraVolatile(6)
;dz = posStep * mtxCameraVolatile(10)
invoke CameraWalk,posStep,2 ;2 is for z axis

@@:
;Down Arrow | World moves Forward | OpenGL -z axis
cmp byte ptr[key+28h],0
je @f
;dx = negStep * mtxCameraVolatile(2) ;2 is for z axis
;dy = negStep * mtxCameraVolatile(6)
;dz = negStep * mtxCameraVolatile(10)
invoke CameraWalk,negStep,2 ;2 is for z axis

@@:
;Left Arrow | World moves Right | OpenGL +x axis
cmp byte ptr[key+25h],0
je @f
;dx = posStep * mtxCameraVolatile(0) ;0 is for x axis
;dy = posStep * mtxCameraVolatile(4)
;dz = posStep * mtxCameraVolatile(8)
invoke CameraWalk,posStep,0 ;0 is for x axis

@@:
;Right Arrow | World moves Left | OpenGL -x axis
cmp byte ptr[key+27h],0
je @f
;dx = negStep * mtxCameraVolatile(0) ;0 is for x axis
;dy = negStep * mtxCameraVolatile(4)
;dz = negStep * mtxCameraVolatile(8)
invoke CameraWalk,negStep,0 ;0 is for x axis

@@:
;Page Up | World moves Down | OpenGL -y axis
cmp byte ptr[key+21h],0
je @f
;dx = negStep * mtxCameraVolatile(1) ;1 is for y axis
;dy = negStep * mtxCameraVolatile(5)
;dz = negStep * mtxCameraVolatile(9)
invoke CameraWalk,negStep,1 ;1 is for y axis

@@:
;Page Down | World moves Up | OpenGL +y axis
cmp byte ptr[key+22h],0
je @f
;dx = posStep * mtxCameraVolatile(1) ;1 is for y axis
;dy = posStep * mtxCameraVolatile(5)
;dz = posStep * mtxCameraVolatile(9)
invoke CameraWalk,posStep,1 ;1 is for y axis

;Model Rotation

@@:
;W | Rotate about OpenGL -x axis
cmp byte ptr[key+57h],0 
je @f
;Call glRotatef(negAngle,1.0f,0.0f,0.0f)
push 0
push 0
push 3f800000h
mov eax,negAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;S | Rotate about OpenGL +x axis
cmp byte ptr[key+53h],0
je @f
;Call glRotatef(posAngle,1.0f,0.0f,0.0f)
push 0
push 0
push 3f800000h
mov eax,posAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;A | Rotate about OpenGL -z axis
cmp byte ptr[key+41h],0
je @f
;Call glRotatef(negAngle,0.0f,0.0f,1.0f)
push 3f800000h
push 0
push 0
mov eax,negAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;D | Rotate about OpenGL +z axis
cmp byte ptr[key+44h],0
je @f
;Call glRotatef(posAngle,0.0f,0.0f,1.0f)
push 3f800000h
push 0
push 0
mov eax,posAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;Q | Rotate about OpenGL +y axis
cmp byte ptr[key+51h],0 
je @f
;Call glRotatef(posAngle,0.0f,1.0f,0.0f)
push 0
push 3f800000h
push 0
mov eax,posAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;E | Rotate about OpenGL -y axis
cmp byte ptr[key+45h],0
je @f
;Call glRotatef(negAngle,0.0f,1.0f,0.0f)
push 0
push 3f800000h
push 0
mov eax,negAngle
push eax
call glRotatef
mov isInitialPosition,0
mov isRefreshed,0

@@:
;CheckKeys_End:


