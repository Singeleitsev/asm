lbl_MousePan:

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

;dxCam = CheckDistance(PrevPos.X - CurPos.X) * 16
fild xPrevPos
fisub xCurPos
fmul f32_16 ;16 is an Empirical Multiplier
fchs
fstp dxCam

;dyCam = CheckDistance(PrevPos.Y - CurPos.Y) * 16
fild yPrevPos
fisub yCurPos
fmul f32_16 ;16 is an Empirical Multiplier
fstp dyCam

;dzCam = 0
mov dzCam,0
Call CameraMove3D
Call CheckDistance

;PrevPos.X = CurPos.X
mov eax,xCurPos
mov xPrevPos,eax
;PrevPos.Y = CurPos.Y
mov ebx,yCurPos
mov yPrevPos,ebx

;lbl_MousePan_End:
jmp lbl_WndProc_Return0

