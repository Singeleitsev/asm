lbl_MouseRoll:

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

;dAngle = -float(xPrevPos - xCurPos) / SpeedMouseRotate
fild xPrevPos
fisub xCurPos
fmul SpeedMouseRotate
fchs
fstp dAngle

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv

lea rdx,mtxModelViewBuffer
movss xmm0,dAngle
movss xmm1,dword ptr[rdx+2*4] ;Vector Z, Component X
movss xmm2,dword ptr[rdx+6*4] ;Vector Z, Component Y
movss xmm3,dword ptr[rdx+0Ah*4] ;Vector Z, Component Z
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
movss xmm1,dword ptr[rdx+2*4] ;Vector Z, Component X
movss xmm2,dword ptr[rdx+6*4] ;Vector Z, Component Y
movss xmm3,dword ptr[rdx+0Ah*4] ;Vector Z, Component Z
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

;lbl_MouseRoll_End:
jmp lbl_WndProc_Return0

