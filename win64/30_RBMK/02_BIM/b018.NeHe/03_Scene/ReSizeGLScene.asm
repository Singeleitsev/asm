
;=================
ReSizeGLScene proc
;=================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,g_hWnd
lea rdx,rc
call GetClientRect

xor rcx,rcx
mov ecx,rc.left
xor rdx,rdx
mov edx,rc.top
xor r8,r8
mov r8d,rc.right
xor r9,r9
mov r9d,rc.bottom
call glViewport ;Reset The Current Viewport

;;Select The Projection Matrix
;mov rcx,1701h ;GL_PROJECTION
;call glMatrixMode
;;Reset The Projection Matrix
;call glLoadIdentity
;
;movsd xmm0,f64_neg12000 ;GLdouble left = -12000.0
;movsd xmm1,f64_12000 ;GLdouble right = 12000.0
;movsd xmm2,f64_neg12000 ;GLdouble bottom = -12000.0
;movsd xmm3,f64_12000 ;GLdouble top = 12000.0
;movsd xmm8,f64_40000 ;GLdouble zNear = 40000.0f
;movsd qword ptr [rsp+20h],xmm8
;movsd xmm9,f64_60000 ;GLdouble zFar = 60000.0f
;movsd qword ptr [rsp+28h],xmm9
;call glFrustum ;GL_PROJECTION
;
;;Select The Modelview Matrix
;mov rcx,1700h ;GL_MODELVIEW
;call glMatrixMode
;;Reset The Modelview Matrix
;call glLoadIdentity

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
ReSizeGLScene endp

