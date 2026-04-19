lbl_SetFront:

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

;Draw2DSceneFront
mov rsi,lpChildStruct
mov eax,dword ptr[rsi+20h] ;right
cvtsi2sd xmm1,eax ;xmm1 = float(iWidth)
mulsd xmm1,f64_0p5 ;xmm1 = iWidth * ZoomFront
xorpd xmm0,xmm0
subsd xmm0,xmm1 ;xmm0 = -iWidth * ZoomFront
mov ebx,dword ptr[rsi+24h] ;bottom
cvtsi2sd xmm3,ebx ;xmm3 = float(iWidth)
mulsd xmm3,f64_0p5 ;xmm3 = iWidth * ZoomFront
xorpd xmm2,xmm2
subsd xmm2,xmm3 ;xmm2 = -iWidth * ZoomFront
mov rax,f64_neg2000
mov qword ptr [rsp+20h],rax
mov rbx,f64_2000
mov qword ptr [rsp+28h],rbx
Call glOrtho ;(-iWidth * 0.5, iWidth * 0.5, -iHeight * 0.5, iHeight * 0.5, -2000, 2000);

;Green Front
xorps xmm0,xmm0
movss xmm1,f32_1
xorps xmm2,xmm2
movss xmm3,xmm1
call glColor4f

Call Draw2DScene

jmp lbl_WinMain_Flush

