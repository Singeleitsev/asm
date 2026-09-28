CameraDrag proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;Load Mouse Delta
cvtsi2ss xmm0,dxMouse

;Scale
mulss xmm0,CamDragSpeed
movss CamDragMagnitude,xmm0

;Move Camera along its Local +x Coordinate
invoke CameraMove,CamDragMagnitude,0 ;0 is for Local x axis

;Load Mouse Delta
mov eax,dyMouse
neg eax
cvtsi2ss xmm1,eax

;Scale
mulss xmm1,CamDragSpeed
movss CamDragMagnitude,xmm1

;Move Camera along its Local +y Coordinate
invoke CameraMove,CamDragMagnitude,1 ;1 is for Local y axis

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
CameraDrag endp


