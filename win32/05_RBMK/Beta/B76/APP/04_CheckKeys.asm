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
invoke CameraWalkMagnitude,posOne
invoke CameraMove,CamWalkMagnitude,2 ;2 is for Local z axis

@@:
;Down Arrow | World moves Forward | Local -z axis
cmp byte ptr[key+28h],0
je @f
invoke CameraWalkMagnitude,negOne
invoke CameraMove,CamWalkMagnitude,2 ;2 is for Local z axis

@@:
;Left Arrow | World moves Right | Local +x axis
cmp byte ptr[key+25h],0
je @f
invoke CameraWalkMagnitude,posOne
invoke CameraMove,CamWalkMagnitude,0 ;0 is for Local x axis

@@:
;Right Arrow | World moves Left | Local -x axis
cmp byte ptr[key+27h],0
je @f
invoke CameraWalkMagnitude,negOne
invoke CameraMove,CamWalkMagnitude,0 ;0 is for Local x axis

@@:
;Page Up | World moves Down | Local -y axis
cmp byte ptr[key+21h],0
je @f
invoke CameraWalkMagnitude,negOne
invoke CameraMove,CamWalkMagnitude,1 ;1 is for Local y axis

@@:
;Page Down | World moves Up | Local +y axis
cmp byte ptr[key+22h],0
je @f
invoke CameraWalkMagnitude,posOne
invoke CameraMove,CamWalkMagnitude,1 ;1 is for Local y axis

;Object Movement

@@:
;W | Object moves Forward | Local +y axis
cmp byte ptr[key+57h],0 
je @f
invoke ObjectMoveMagnitude,posOne
invoke ObjectMove,ObjMoveMagnitude,1 ;1 is for Local y axis

@@:
;S | Object moves Backward | Local -y axis
cmp byte ptr[key+53h],0
je @f
invoke ObjectMoveMagnitude,negOne
invoke ObjectMove,ObjMoveMagnitude,1 ;1 is for Local y axis

@@:
;A | Object moves Left | Local -x axis
cmp byte ptr[key+41h],0
je @f
invoke ObjectMoveMagnitude,negOne
invoke ObjectMove,ObjMoveMagnitude,0 ;0 is for Local x axis

@@:
;D | Object moves Right | Local +x axis
cmp byte ptr[key+44h],0
je @f
invoke ObjectMoveMagnitude,posOne
invoke ObjectMove,ObjMoveMagnitude,0 ;0 is for Local x axis

@@:
;Q | Object moves Down | Local -z axis
cmp byte ptr[key+51h],0 
je @f
invoke ObjectMoveMagnitude,negOne
invoke ObjectMove,ObjMoveMagnitude,2 ;2 is for Local z axis

@@:
;E | Object moves Up | Local +z axis
cmp byte ptr[key+45h],0
je @f
invoke ObjectMoveMagnitude,posOne
invoke ObjectMove,ObjMoveMagnitude,2 ;2 is for Local z axis

@@:
;CheckKeys_End:


