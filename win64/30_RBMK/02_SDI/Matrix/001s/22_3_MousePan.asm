lbl_MousePan:

;xCurPos = GET_X_LPARAM(lParam)
mov eax,r9d
and rax,0FFFFh
mov xCurPos,eax
;yCurPos = GET_Y_LPARAM(lParam)
mov ebx,r9d
shr ebx,16
and rbx,0FFFFh
mov yCurPos,ebx

mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode

;dStep = float(xPrevPos - xCurPos) / SpeedMousePan
fild xPrevPos
fisub xCurPos
fmul SpeedMousePan
fstp dStep

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv

lea rdx,mtxModelViewBuffer
movss xmm0,dword ptr[rdx+0*4] ;Vector X, Component X
mulss xmm0,dStep
movss xmm1,dword ptr[rdx+4*4] ;Vector X, Component Y
mulss xmm1,dStep
movss xmm2,dword ptr[rdx+8*4] ;Vector X, Component Z
mulss xmm2,dStep
call glTranslatef

;dAngle = float(yPrevPos - yCurPos) / SpeedMousePan
fild yPrevPos
fisub yCurPos
fmul SpeedMousePan
fstp dAngle

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv

lea rdx,mtxModelViewBuffer
movss xmm0,dword ptr[rdx+1*4] ;Vector Y, Component X
mulss xmm0,dStep
movss xmm1,dword ptr[rdx+5*4] ;Vector Y, Component Y
mulss xmm1,dStep
movss xmm2,dword ptr[rdx+9*4] ;Vector Y, Component Z
mulss xmm2,dStep
call glTranslatef

;xPrevPos = xCurPos
mov eax,xCurPos
mov xPrevPos,eax
;yPrevPos = yCurPos
mov ebx,yCurPos
mov yPrevPos,ebx

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

;lbl_MousePan_End:
jmp lbl_WndProc_Return0

