lbl_MouseTurn:

;Extract CurPos.X
xor rax,rax
mov eax,r9d
and eax,0FFFFh
mov xCurPos,eax
;Extract CurPos.Y
xor rbx,rbx
mov ebx,r9d
shr ebx,16
mov yCurPos,ebx

;dxMouse = PrevPos.X - CurPos.X
fild xPrevPos
fisub xCurPos
;aXY_Cam = CheckAngle(aXY_Cam + dxMouse / 16)
fdiv f32_16 ;16 is an Empirical Multiplier
fadd aXY_Cam
fstp aXY_Cam
movss xmm0,aXY_Cam
Call CheckAngle
movss aXY_Cam,xmm0

;dyMouse = PrevPos.Y - CurPos.Y
fild yPrevPos
fisub yCurPos
;aYZ_Cam = CheckAngle(aYZ_Cam + dyMouse / 16)
fdiv f32_16 ;16 is an Empirical Multiplier
fadd aYZ_Cam
fstp aYZ_Cam
movss xmm0,aYZ_Cam
Call CheckAngle
movss aYZ_Cam,xmm0

;PrevPos.X = CurPos.X
mov eax,xCurPos
mov xPrevPos,eax
;PrevPos.Y = CurPos.Y
mov ebx,yCurPos
mov yPrevPos,ebx

;lbl_MouseRotate_End:
jmp lbl_WndProc_Return0

