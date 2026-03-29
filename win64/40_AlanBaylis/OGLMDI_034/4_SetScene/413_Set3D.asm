lbl_Set3D:

;Set3DProjection
mov rsi,lpChildStruct
xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,dword ptr[rsi+2Ch] ;right
xor r9,r9
mov r9d,dword ptr[rsi+2Eh] ;bottom
Call glViewport ;(0, 0, iWidth, iHeight);

mov rcx,1701h ;GL_PROJECTION
Call glMatrixMode

Call glLoadIdentity

movsd xmm0,f64_45
mov eax,dword ptr[rsi+2Ch] ;right
cvtsi2sd xmm1,eax
mov ebx,dword ptr[rsi+2Eh] ;bottom
cvtsi2sd xmm2,ebx
subsd xmm1,xmm2
movsd xmm2,f64_1
movsd xmm3,f64_1000
Call gluPerspective ;(45.0,(float)iWidth/(float)iHeight, 1, 1000.0);

;Draw3DScene
mov rcx,4100H ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
Call glClear

mov rcx,1700H ;GL_MODELVIEW
Call glMatrixMode

Call glLoadIdentity

;If left mouse button is down
cmp g_bMouseDrag,0
je lbl_Draw3d_SetModelView

;Apply mouse deltas to cube rotation values
;g_fCubeRotationX += (float)g_iMouseDeltaY * 0.5
mov eax,g_iMouseDeltaY
shr eax,1 ;eax = g_iMouseDeltaY /2
cvtsi2ss xmm0,eax
movss xmm1,g_fCubeRotationX
addss xmm0,xmm1
movss g_fCubeRotationX,xmm0

;g_fCubeRotationY += (float)g_iMouseDeltaX * 0.5
mov ebx,g_iMouseDeltaX
shr ebx,1 ;ebx = g_iMouseDeltaX /2
cvtsi2ss xmm2,ebx
movss xmm3,g_fCubeRotationY
addss xmm2,xmm3
movss g_fCubeRotationY,xmm2

lbl_Draw3d_SetModelView:

xorps xmm0,xmm0
xorps xmm1,xmm1
movss xmm2,f32_neg500
Call glTranslatef

movss xmm0,g_fCubeRotationX
movss xmm1,f32_1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glRotatef

movss xmm0,g_fCubeRotationY
xorps xmm1,xmm1
movss xmm2,f32_1
xorps xmm3,xmm3
Call glRotatef

Call Draw3DScene

jmp lbl_WinMain_Flush

