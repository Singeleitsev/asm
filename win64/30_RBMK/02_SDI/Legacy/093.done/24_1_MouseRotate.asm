lbl_MouseRotate:

;Extract CurPos.X
mov xCurPos,r9d
and xCurPos,0FFFFh
;Extract CurPos.Y
mov yCurPos,r9d
shr yCurPos,16

;dxMouse = PrevPos.X - CurPos.X
fild xPrevPos
fisub xCurPos
;aXY_Cam = CheckAngle(aXY_Cam + dxMouse / 20)
fdiv f32_20 ;20 is an Empirical Multiplier
fadd aXY_Cam
fstp aXY_Cam
lea rcx,aXY_Cam
Call CheckAngle

;dyMouse = PrevPos.Y - CurPos.Y
fild yPrevPos
fisub yCurPos
;aYZ_Cam = CheckAngle(aYZ_Cam + dyMouse / 20)
fdiv f32_20 ;20 is an Empirical Multiplier
fadd aYZ_Cam
fstp aYZ_Cam
lea rcx,aYZ_Cam
Call CheckAngle

;PrevPos.X = CurPos.X
mov eax,xCurPos
mov xPrevPos,eax
;PrevPos.Y = CurPos.Y
mov ebx,yCurPos
mov yPrevPos,ebx

;lbl_MouseRotate_End:
jmp lbl_WndProc_Return0

