;==========
InitGL proc
;==========

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Enable Smooth Shading
mov rcx,1D01h ;GL_SMOOTH
call glShadeModel

;Black Background
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1
xorps xmm2,xmm2
xorps xmm3,xmm3 ;From NeHe Lesson 10
call glClearColor

;Depth Buffer Setup
movsd xmm0,f64_1 ;Double
call glClearDepth

;glEnable(GL_DEPTH_TEST); // Enables Depth Testing
mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable

;The Type Of Depth Testing To Do
mov rcx,0201h ;GL_LESS - From NeHe Lesson 10
call glDepthFunc

;Konstantin Vladimirov
;perform some rendering with near and far planes clipping off
mov rcx,864Fh ;GL_DEPTH_CLAMP = 34383
call glEnable
mov rcx,0B44h ;GL_CULL_FACE
call glEnable

;Really Nice Perspective Calculations
mov rcx,0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
mov rdx,1102h ;GL_NICEST
call glHint

call SetupWorld ;From NeHe Lesson 10

;Normal Exit
mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
InitGL endp

