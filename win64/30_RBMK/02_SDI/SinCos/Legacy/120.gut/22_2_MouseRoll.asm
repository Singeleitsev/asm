lbl_MouseRoll:

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
;aXZ_Cam = CheckAngle(aXZ_Cam + dxMouse / 20)
fdiv f32_20 ;20 is an Empirical Multiplier
fadd aXZ_Cam
fstp aXZ_Cam
movss xmm0,aXZ_Cam
Call CheckAngle
movss aXZ_Cam,xmm0

;dyMouse = PrevPos.Y - CurPos.Y
fild yPrevPos
fisub yCurPos
;aYZ_Cam = CheckAngle(aYZ_Cam + dyMouse / 20)
fdiv f32_20 ;20 is an Empirical Multiplier
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

;lbl_MouseRoll_End:
jmp lbl_WndProc_Return0
