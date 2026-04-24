lbl_Set3D:

;Set3DProjection
xor rcx,rcx
xor rdx,rdx
mov rsi,lpChildStruct
xor r8,r8
mov r8d,dword ptr[rsi+20h] ;right
xor r9,r9
mov r9d,dword ptr[rsi+24h] ;bottom
Call glViewport ;(0, 0, iWidth, iHeight);

mov rcx,1701h ;GL_PROJECTION
Call glMatrixMode

Call glLoadIdentity

mov rsi,lpChildStruct
movsd xmm0,f64_45
cvtsi2sd xmm1,dword ptr[rsi+20h] ;right
cvtsi2sd xmm2,dword ptr[rsi+24h] ;bottom
divsd xmm1,xmm2
movsd xmm2,f64_1
movsd xmm3,f64_1000
Call gluPerspective ;(45.0,(float)iWidth/(float)iHeight, 1, 1000.0);

mov rcx,1700H ;GL_MODELVIEW
Call glMatrixMode

Call glLoadIdentity

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

