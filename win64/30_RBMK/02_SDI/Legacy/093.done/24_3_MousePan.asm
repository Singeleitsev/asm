lbl_MousePan:

;Extract CurPos.X
mov xCurPos,r9d
and xCurPos,0FFFFh
;Extract CurPos.Y
mov yCurPos,r9d
shr yCurPos,16

;dxMouse = PrevPos.X - CurPos.X
fild xPrevPos
fisub xCurPos
;dxCam0 = CheckDistance(dxMouse / 20)
fdiv f32_20 ;1/20 is an Empirical Multiplier
fchs
fstp dxCam0

;dyMouse = PrevPos.Y - CurPos.Y
fild yPrevPos
fisub yCurPos
;dyCam0 = CheckDistance(dyMouse / 20)
fdiv f32_20 ;1/20 is an Empirical Multiplier
fstp dyCam0

;dxCam0 = CheckDistance(PrevPos.X - CurPos.X) / 20
;dyCam0 = CheckDistance(PrevPos.Y - CurPos.Y) / 20
mov dzCam0,0
Call CameraMove

;PrevPos.X = CurPos.X
mov eax,xCurPos
mov xPrevPos,eax
;PrevPos.Y = CurPos.Y
mov ebx,yCurPos
mov yPrevPos,ebx

;lbl_MousePan_End:
jmp lbl_WndProc_Return0

