lbl_SetTop:

;Set2DProjection
xor rcx,rcx
xor rdx,rdx
mov rsi,lpChildStruct
xor r8,r8
mov r8d,dword ptr[rsi+20h] ;right
xor r9,r9
mov r9d,dword ptr[rsi+24h] ;bottom
Call glViewport

mov rcx,1701h ;GL_PROJECTION
Call glMatrixMode

Call glLoadIdentity

;Draw2DSceneTop
mov rsi,lpChildStruct
mov eax,dword ptr[rsi+20h] ;right
shr eax,1 ;eax = iWidth * 0.5
xorpd xmm1,xmm1
cvtsi2sd xmm1,eax ;xmm1 = iWidth * 0.5
xorpd xmm0,xmm0
subsd xmm0,xmm1 ;xmm0 = -iWidth * 0.5
mov ebx,dword ptr[rsi+24h] ;bottom
shr ebx,1 ;ebx = iHeight * 0.5
xorpd xmm3,xmm3
cvtsi2sd xmm3,ebx ;xmm3 = iHeight * 0.5
xorpd xmm2,xmm2
subsd xmm2,xmm3 ;xmm2 = -iHeight * 0.5
mov rax,f64_neg2000
mov qword ptr [rsp+20h],rax
mov rbx,f64_2000
mov qword ptr [rsp+28h],rbx
Call glOrtho ;(-iWidth * 0.5, iWidth * 0.5, -iHeight * 0.5, iHeight * 0.5, -2000, 2000);

movss xmm0,f32_90
movss xmm1,f32_1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glRotatef

;Red Top
movss xmm0,f32_1
xorps xmm1,xmm0
xorps xmm2,xmm2
movss xmm3,xmm2
call glColor4f

Call Draw2DScene

jmp lbl_WinMain_Flush

