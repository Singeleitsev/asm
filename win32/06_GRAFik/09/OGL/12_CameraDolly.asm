CameraDolly proc wParam:DWORD

;Mouse Wheel sends either +120 or -120
;Depending on Wheel Rotating Direction
;Extract the Mouse Wheel Delta
mov eax,wParam
shr eax,16
movsx eax,ax

;Convert the Mouse Wheel Delta to float
cvtsi2ss xmm0,eax

;Magnitude
mulss xmm0,CamDollySpeed

mov ecx,2 ;2 is for Camera's Local z axis
call CameraMove ;ecx = axis, xmm0 = magnitude

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
CameraDolly endp


