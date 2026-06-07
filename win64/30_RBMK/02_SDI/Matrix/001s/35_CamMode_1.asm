;CAMERA_MODE_SPATIAL
lbl_CameraMode_1:

mov rcx,GL_MODELVIEW_MATRIX
lea rdx,mtxModelViewBuffer
call glGetFloatv
lea rdx,mtxModelViewBuffer

;lbl_KeyMoveForward:
cmp key[26h],0 ;Up Arrow
je @f
movss xmm0,dword ptr[rdx+2*4] ;Vector Z, Component X
mulss xmm0,dStep
movss xmm1,dword ptr[rdx+6*4] ;Vector Z, Component Y
mulss xmm1,dStep
movss xmm2,dword ptr[rdx+0Ah*4] ;Vector Z, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0

@@:
;lbl_KeyMoveBack:
cmp key[28h],0 ;Down Arrow
je @f
xorps xmm0,xmm0
subss xmm0,dword ptr[rdx+2*4] ;Vector -Z, Component X
mulss xmm0,dStep
xorps xmm1,xmm1
movss xmm1,dword ptr[rdx+6*4] ;Vector -Z, Component Y
mulss xmm1,dStep
xorps xmm2,xmm2
movss xmm2,dword ptr[rdx+0Ah*4] ;Vector -Z, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0

@@:
;lbl_KeyMoveLeft:
cmp key[25h],0 ;Left Arrow
je @f
movss xmm0,dword ptr[rdx+0*4] ;Vector X, Component X
mulss xmm0,dStep
movss xmm1,dword ptr[rdx+4*4] ;Vector X, Component Y
mulss xmm1,dStep
movss xmm2,dword ptr[rdx+8*4] ;Vector X, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0

@@:
;lbl_KeyMoveRight:
cmp key[27h],0 ;Right Arrow
je @f
xorps xmm0,xmm0
movss xmm0,dword ptr[rdx+0*4] ;Vector -X, Component X
mulss xmm0,dStep
xorps xmm1,xmm1
movss xmm1,dword ptr[rdx+4*4] ;Vector -X, Component Y
mulss xmm1,dStep
xorps xmm2,xmm2
movss xmm2,dword ptr[rdx+8*4] ;Vector -X, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0

@@:
;lbl_KeyMoveUp:
cmp key[21h],0 ;Page Up
je @f
xorps xmm0,xmm0
movss xmm0,dword ptr[rdx+1*4] ;Vector -Y, Component X
mulss xmm0,dStep
xorps xmm1,xmm1
movss xmm1,dword ptr[rdx+5*4] ;Vector -Y, Component Y
mulss xmm1,dStep
xorps xmm2,xmm2
movss xmm2,dword ptr[rdx+9*4] ;Vector -Y, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0

@@:
;lbl_KeyMoveDown:
cmp key[22h],0 ;Page Down
je @f
movss xmm0,dword ptr[rdx+1*4] ;Vector Y, Component X
mulss xmm0,dStep
movss xmm1,dword ptr[rdx+5*4] ;Vector Y, Component Y
mulss xmm1,dStep
movss xmm2,dword ptr[rdx+9*4] ;Vector Y, Component Z
mulss xmm2,dStep
call glTranslatef
mov isRefreshed,0
 
@@:
jmp lbl_DrawGLScene_Refresh

