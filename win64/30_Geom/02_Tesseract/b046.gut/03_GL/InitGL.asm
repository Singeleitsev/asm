;==========
InitGL proc
;==========

;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;and rsp,-16 ;Align the Stack
sub rsp,108h ;Create the Buffer

;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szStart
;lea r8,szInitGL
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

;glShadeModel(GL_SMOOTH); // Enable Smooth Shading
mov rcx,1D01h ;GL_SMOOTH
call glShadeModel

;glClearColor(0.0f, 0.0f, 0.0f, 0.5f); // Black Background
xor eax,eax ;0.0f
movd xmm0,eax
movd xmm1,eax
movd xmm2,eax
mov eax,3f000000h ;0.5f
movd xmm3,eax
call glClearColor

;glClearDepth(1.0f); // Depth Buffer Setup
mov eax,3f800000h ;1.0f
movd xmm0,eax
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

;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szEnd
;lea r8,szInitGL
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

;Normal Exit

mov rax,1
add rsp,108h
;Assembler will add this epilogue automatically:
;leave
ret

InitGL endp

