sub rsp,20h
	call GetTickCount
add rsp,20h

sub eax,clock
cmp eax,10
jb lblAnimate

add clock,eax



sub rsp,20h

;invoke glRotatef, float dword 1.0, float dword [aXY], float dword [aXZ], float dword [aYZ]
	mov     eax, 3F800000h;1.0f
	movd    xmm0,eax
	movd    xmm1,aXY
	movd    xmm2,aXZ
	movd    xmm3,aYZ
	call    glRotatef

add rsp,20h

lblAnimate:

sub rsp,20h

;invoke glClear,GL_COLOR_BUFFER_BIT
	mov rcx, 4000h ;GL_COLOR_BUFFER_BIT
	call glClear
	
;invoke glBegin,GL_POINTS
	xor rcx,rcx ;GL_POINTS = 0
	call glBegin
	
;.v1:
;invoke glColor3f, float dword [A.r], float dword [A.g], float dword [A.b]
	movd xmm0,A.r
	movd xmm1,A.g
	movd xmm2,A.b
	call glColor3f
;invoke glVertex3f, float dword [A.x], float dword [A.y], float dword [A.z]
	movd xmm0,A.x
	movd xmm1,A.y
	movd xmm2,A.z
	call glVertex3f
	
;.v2:
;invoke glColor3f, float dword [B.r], float dword [B.g], float dword [B.b]
	movd xmm0,B.r
	movd xmm1,B.g
	movd xmm2,B.b
	call glColor3f
;invoke glVertex3f, float dword [B.x], float dword [B.y], float dword [B.z]
	movd xmm0,B.x
	movd xmm1,B.y
	movd xmm2,B.z
	call glVertex3f
	
;.v3:
;invoke glColor3f, float dword [C.r], float dword [C.g], float dword [C.b]
	movd xmm0,C.r
	movd xmm1,C.g
	movd xmm2,C.b
	call glColor3f
;invoke glVertex3f, float dword [C.x], float dword [C.y], float dword [C.z]
	movd xmm0,C.x
	movd xmm1,C.y
	movd xmm2,C.z
	call glVertex3f
	
;.v4:
;invoke glColor3f, float dword [D.r], float dword [D.g], float dword [D.b]
	movd xmm0,D.r
	movd xmm1,D.g
	movd xmm2,D.b
	call glColor3f
;invoke glVertex3f, float dword [D.x], float dword [D.y], float dword [D.z]
	movd xmm0,D.x
	movd xmm1,D.y
	movd xmm2,D.z
	call glVertex3f

add rsp,20h


;jmp lpMode


;include 31_PyramidX87.asm
;include 32_PyramidSSE.asm
include 33_PyramidAVX.asm
;include 34_PyramidFMA.asm

lblSkip:

sub rsp,20h

	call glEnd
	
;invoke SwapBuffers,[hdc]
	mov rcx,hdc
	call SwapBuffers
	
add rsp,20h


