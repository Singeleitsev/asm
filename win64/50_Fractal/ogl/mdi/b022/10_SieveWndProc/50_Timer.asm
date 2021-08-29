wmR2Timer:

Call2 GetWindowLongPtrA,hwnd,0
mov lpR2Data,rax

;hdc = GetDC(hwnd);
	Call1 GetDC, hwnd
	mov hdc, rax

;------
;OpenGL
;------

 movd xmm0,theta
 xor eax,eax
 movd xmm1,eax
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
 ;mov eax,3DCCCCCDh ;0.1f
 movd xmm2,eax
 call glColor3f
 
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm0,rax
 ;mov rax,0BFE3333333333333h ;-0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3DCCCCCDh ;0.1f
 movd xmm0,eax
 ;mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 ;mov eax,3DCCCCCDh ;0.1f
 movd xmm2,eax
 call glColor3f
 
 mov rax,3FE3333333333333h ;0.6f
 movq xmm0,rax
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm1,rax
 xor rax,rax
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3DCCCCCDh ;0.1f
 movd xmm0,eax
 ;mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3F800000h ;1.0f
 movd xmm2,eax
 call glColor3f
 
 mov rax,3FE3333333333333h ;0.6f
 movq xmm0,rax
 ;mov rax,3FE3333333333333h ;0.6f
 movq xmm1,rax
 xor rax,rax
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3F800000h ;1.0f
 movd xmm0,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3F800000h ;1.0f
 movd xmm2,eax
 call glColor3f
 
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm0,rax
 mov rax,3FE3333333333333h ;0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 call glEnd
 
 mov rcx,hdc
 call SwapBuffers

;return 0;
	xor rax, rax
	jmp endR2WndProc

