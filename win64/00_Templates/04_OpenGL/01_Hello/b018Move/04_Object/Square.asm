
fld aXY
fadd sgl_TENTH
fstp aXY
movd xmm0,aXY
mov eax,0
movd xmm1,eax
mov eax,0
movd xmm2,eax
mov eax,3F800000h ;1.0f
movd xmm3,eax
call glRotatef


lbl_animation_ok:
mov rcx,4000h ;GL_COLOR_BUFFER_BIT
call glClear

mov rcx,7 ;GL_QUADS
call glBegin

mov eax,3F800000h ;1.0f
movd xmm0,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm1,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm2,eax
call glColor3f

mov rax,0BFF0000000000000h ;-1.0
movq xmm0,rax
mov rax,0BFF0000000000000h ;-1.0
movq xmm1,rax
mov rax,0
movq xmm2,rax
call glVertex3d

mov eax,3DCCCCCDh ;0.1f
movd xmm0,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm1,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm2,eax
call glColor3f

mov rax,3FF0000000000000h ;1.0
movq xmm0,rax
mov rax,0BFF0000000000000h ;-1.0
movq xmm1,rax
mov rax,0
movq xmm2,rax
call glVertex3d

mov eax,3DCCCCCDh ;0.1f
movd xmm0,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm1,eax
mov eax,3F800000h ;1.0f
movd xmm2,eax
call glColor3f

mov rax,3FF0000000000000h ;1.0
movq xmm0,rax
mov rax,3FF0000000000000h ;1.0
movq xmm1,rax
mov rax,0
movq xmm2,rax
call glVertex3d

mov eax,3F800000h ;1.0f
movd xmm0,eax
mov eax,3DCCCCCDh ;0.1f
movd xmm1,eax
mov eax,3F800000h ;1.0f
movd xmm2,eax
call glColor3f

mov rax,0BFF0000000000000h ;-1.0
movq xmm0,rax
mov rax,3FF0000000000000h ;1.0
movq xmm1,rax
mov rax,0
movq xmm2,rax
call glVertex3d

call glEnd
