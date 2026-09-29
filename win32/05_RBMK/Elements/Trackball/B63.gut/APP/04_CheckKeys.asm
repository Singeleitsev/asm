;CheckKeys:

;Model operates its own Local coordinate system
;and its own Object Matrices
;Model +x = OpenGL +x
;Model +y = OpenGL -z
;Model +z = OpenGL +y

;x|00|04|08|12|
;y|01|05|09|13|
;z|02|06|10|14|
;w|03|07|11|15|

;Model Movement

@@:
;Up Arrow | World moves Backward | Local +z axis
cmp byte ptr[key+26h],0
je @f
invoke ComputeWalkMagnitude,posOne
invoke CameraMove,WalkMagnitude,2 ;2 is for Local z axis

@@:
;Down Arrow | World moves Forward | Local -z axis
cmp byte ptr[key+28h],0
je @f
invoke ComputeWalkMagnitude,negOne
invoke CameraMove,WalkMagnitude,2 ;2 is for Local z axis

@@:
;Left Arrow | World moves Right | Local +x axis
cmp byte ptr[key+25h],0
je @f
invoke ComputeWalkMagnitude,posOne
invoke CameraMove,WalkMagnitude,0 ;0 is for Local x axis

@@:
;Right Arrow | World moves Left | Local -x axis
cmp byte ptr[key+27h],0
je @f
invoke ComputeWalkMagnitude,negOne
invoke CameraMove,WalkMagnitude,0 ;0 is for Local x axis

@@:
;Page Up | World moves Down | Local -y axis
cmp byte ptr[key+21h],0
je @f
invoke ComputeWalkMagnitude,negOne
invoke CameraMove,WalkMagnitude,1 ;1 is for Local y axis

@@:
;Page Down | World moves Up | Local +y axis
cmp byte ptr[key+22h],0
je @f
invoke ComputeWalkMagnitude,posOne
invoke CameraMove,WalkMagnitude,1 ;1 is for Local y axis

;Model Rotation

@@:
;W | Rotate about Local -x axis
cmp byte ptr[key+57h],0 
je @f
invoke ModelRotate,negOne,0 ;0 is for Local x axis

@@:
;S | Rotate about Local +x axis
cmp byte ptr[key+53h],0
je @f
invoke ModelRotate,posOne,0 ;0 is for Local x axis

@@:
;A | Rotate about Local +z axis
cmp byte ptr[key+41h],0
je @f
invoke ModelRotate,posOne,2 ;2 is for Local z axis

@@:
;D | Rotate about Local -z axis
cmp byte ptr[key+44h],0
je @f
invoke ModelRotate,negOne,2 ;2 is for Local z axis

@@:
;Q | Rotate about Local -y axis
cmp byte ptr[key+51h],0 
je @f
invoke ModelRotate,negOne,1 ;1 is for Local y axis

@@:
;E | Rotate about Local +y axis
cmp byte ptr[key+45h],0
je @f
invoke ModelRotate,posOne,1 ;1 is for Local y axis

@@:
;CheckKeys_End:


