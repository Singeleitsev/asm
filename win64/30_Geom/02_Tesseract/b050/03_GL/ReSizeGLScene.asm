;======================================================
ReSizeGLScene proc ;SceneWidth:QWORD, SceneHeight:QWORD
;======================================================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Reset The Current Viewport
xor rcx,rcx
xor rdx,rdx
mov r8,nWidth
mov r9,nHeight
call glViewport

;Select The Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
;Reset The Projection Matrix
call glLoadIdentity

;Calculate The Aspect Ratio Of The Window
;gluPerspective(45.0f, (GLfloat)width / (GLfloat)height, 0.1f, 100.0f);
movsd xmm0,dbl_45 ;45.0f
movsd xmm1,nWidth ;Use Scalar Double Instruction to load the Qword
cvtdq2pd xmm1,xmm1 ;Convert the Qword Integer to Packed Double
movsd xmm2,nHeight ;Use Scalar Double Instruction to load the Qword
cvtdq2pd xmm2,xmm2 ;Convert the Qword Integer to Packed Double
divsd xmm1,xmm2
movsd xmm2,dbl_TENTH ;0.1f
movsd xmm3,dbl_100 ;100.0f
call gluPerspective

;Select The ModelView Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode
;Reset The ModelView Matrix
call glLoadIdentity

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
ReSizeGLScene endp

