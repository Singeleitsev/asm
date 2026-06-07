lbl_MouseTurn:

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

;dAngle = float(xPrevPos - xCurPos) / SpeedMouseRotate
fild xPrevPos
fisub xCurPos
fmul SpeedMouseRotate
fstp dAngle

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv

lea rdx,mtxModelViewBuffer
movss xmm0,dAngle
movss xmm1,dword ptr[rdx+1*4] ;Vector Y, Component X
movss xmm2,dword ptr[rdx+5*4] ;Vector Y, Component Y
movss xmm3,dword ptr[rdx+9*4] ;Vector Y, Component Z
call glRotatef

;dAngle = float(yPrevPos - yCurPos) / SpeedMouseRotate
fild yPrevPos
fisub yCurPos
fmul SpeedMouseRotate
fstp dAngle

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv

lea rdx,mtxModelViewBuffer
movss xmm0,dAngle
movss xmm1,dword ptr[rdx+0*4] ;Vector X, Component X
movss xmm2,dword ptr[rdx+4*4] ;Vector X, Component Y
movss xmm3,dword ptr[rdx+8*4] ;Vector X, Component Z
call glRotatef

;xPrevPos = xCurPos
mov eax,xCurPos
mov xPrevPos,eax
;yPrevPos = yCurPos
mov ebx,yCurPos
mov yPrevPos,ebx

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

;lbl_MouseTurn_End:
jmp lbl_WndProc_Return0

