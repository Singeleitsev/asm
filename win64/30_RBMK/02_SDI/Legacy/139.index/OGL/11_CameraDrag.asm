CameraDrag proc lParam:QWORD
PROLOG 100h

;mov lParam,r9

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;Load Mouse Delta
cvtsi2ss xmm0,dxMouse

;Magnitude
mulss xmm0,CamDragSpeed

;Move Camera along its Local +x Coordinate
xor rcx,rcx ;0 is for Local x axis
call CameraMove ;ecx = axis, xmm0 = magnitude

;Load Mouse Delta
mov eax,dyMouse
neg eax
cvtsi2ss xmm0,eax

;Magnitude
mulss xmm0,CamDragSpeed

;Move Camera along its Local +y Coordinate
mov rcx,1 ;1 is for Local y axis
call CameraMove ;ecx = axis, xmm0 = magnitude

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

EPILOG
CameraDrag endp


