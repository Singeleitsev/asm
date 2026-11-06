;CheckKeys:

;Camera and Object operate their own Local coordinate systems
;and their own Camera and Object Matrices
;Local +x = OpenGL +x
;Local +y = OpenGL -z
;Local +z = OpenGL +y

;Camera Movement

@@:
;Up Arrow | World moves Backward | Local +z axis
cmp byte ptr[key+26h],0
je @f
movss xmm0,f32_posOne ;xmm0 = direction (either +1.0 or -1.0)
call CameraWalkMagnitude
mov rcx,2 ;2 is for Local z axis
call CameraMove ;rcx = axis, xmm0 = magnitude

@@:
;Down Arrow | World moves Forward | Local -z axis
cmp byte ptr[key+28h],0
je @f
movss xmm0,f32_negOne
call CameraWalkMagnitude
mov rcx,2 ;2 is for Local z axis
call CameraMove

@@:
;Left Arrow | World moves Right | Local +x axis
cmp byte ptr[key+25h],0
je @f
movss xmm0,f32_posOne
call CameraWalkMagnitude
xor rcx,rcx ;0 is for Local x axis
call CameraMove

@@:
;Right Arrow | World moves Left | Local -x axis
cmp byte ptr[key+27h],0
je @f
movss xmm0,f32_negOne
call CameraWalkMagnitude
xor rcx,rcx ;0 is for Local x axis
call CameraMove

@@:
;Page Up | World moves Down | Local -y axis
cmp byte ptr[key+21h],0
je @f
movss xmm0,f32_negOne
call CameraWalkMagnitude
mov rcx,1 ;1 is for Local y axis
call CameraMove

@@:
;Page Down | World moves Up | Local +y axis
cmp byte ptr[key+22h],0
je @f
movss xmm0,f32_posOne
call CameraWalkMagnitude
mov rcx,1 ;1 is for Local y axis
call CameraMove

;Object Movement

@@:
;W | Object moves Forward | Local +y axis
cmp byte ptr[key+57h],0 
je @f
movss xmm0,f32_posOne ;xmm0 = direction (either +1.0 or -1.0)
call ObjectMoveMagnitude
mov rcx,1 ;1 is for Local y axis
call ObjectMove ;rcx = axis, xmm0 = magnitude

@@:
;S | Object moves Backward | Local -y axis
cmp byte ptr[key+53h],0
je @f
movss xmm0,f32_negOne
call ObjectMoveMagnitude
mov rcx,1 ;1 is for Local y axis
call ObjectMove

@@:
;A | Object moves Left | Local -x axis
cmp byte ptr[key+41h],0
je @f
movss xmm0,f32_negOne
call ObjectMoveMagnitude
xor rcx,rcx ;0 is for Local x axis
call ObjectMove

@@:
;D | Object moves Right | Local +x axis
cmp byte ptr[key+44h],0
je @f
movss xmm0,f32_posOne
call ObjectMoveMagnitude
xor rcx,rcx ;0 is for Local x axis
call ObjectMove

@@:
;Q | Object moves Down | Local -z axis
cmp byte ptr[key+51h],0 
je @f
movss xmm0,f32_negOne
call ObjectMoveMagnitude
mov rcx,2 ;2 is for Local z axis
call ObjectMove

@@:
;E | Object moves Up | Local +z axis
cmp byte ptr[key+45h],0
je @f
movss xmm0,f32_posOne
call ObjectMoveMagnitude
mov rcx,2 ;2 is for Local z axis
call ObjectMove

@@:
;CheckKeys_End:


