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

;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szStart
;lea r8,szInitGL
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

;glShadeModel(GL_SMOOTH); // Enable Smooth Shading
mov rcx,1D01h ;GL_SMOOTH
call glShadeModel

;glClearColor(0.0f,0.0f,0.0f,0.5f); // Black Background
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1
xorps xmm2,xmm2
movd xmm3,f32_HALF ;Single
call glClearColor

;glClearDepth(1.0f); // Depth Buffer Setup
movsd xmm0,f64_1 ;Double
call glClearDepth

;glEnable(GL_DEPTH_TEST); // Enables Depth Testing
mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable

;glDepthFunc(GL_LEQUAL); // The Type Of Depth Testing To Do
mov rcx,0203h ;GL_LEQUAL
call glDepthFunc

;glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST); // Really Nice Perspective Calculations
mov rcx,0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
mov rdx,1102h ;GL_NICEST
call glHint


include 04_Object\TesseractInit.asm


;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szEnd
;lea r8,szInitGL
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
InitGL endp

