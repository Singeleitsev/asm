;================
KillGLWindow proc
;================

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
;lea r8,szKillGLWindow
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

xor rcx,rcx
xor rdx,rdx
call wglMakeCurrent
cmp rax,0
je lbl_ErrReMakeCurrent

mov rcx,hRC
call wglDeleteContext
cmp rax,0
je lbl_ErrDeleteContext

mov rcx,hWnd
mov rdx,hDC
call ReleaseDC
cmp rax,0
je lbl_ErrReleaseDC

mov rcx,hWnd
call DestroyWindow
cmp rax,0
je lbl_ErrDestroyWindow

lea rcx,szClass
mov rdx,g_hInst
call UnregisterClassA
cmp rax,0
je lbl_ErrUnregisterClass

;Normal Exit

;Debug Marker
;xor rcx,rcx ;hWnd = HWND_DESKTOP
;lea rdx,szEnd
;lea r8,szKillGLWindow
;xor r9,r9 ;uType = MB_OK
;call MessageBoxA

mov rax,1
jmp lbl_EndKillGLWindow

;Error Markers

lbl_ErrReMakeCurrent:
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrReMakeCurrent
lea r8,szKillGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrKillGLWindow

lbl_ErrDeleteContext:
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrDeleteContext
lea r8,szKillGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrKillGLWindow

lbl_ErrReleaseDC:
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrReleaseDC
lea r8,szKillGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrKillGLWindow

lbl_ErrDestroyWindow:
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrDestroyWindow
lea r8,szKillGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrKillGLWindow

lbl_ErrUnregisterClass:
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szErrUnregisterClass
lea r8,szKillGLWindow
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
jmp lbl_ErrKillGLWindow

lbl_ErrKillGLWindow:
xor rax,rax


lbl_EndKillGLWindow:
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
KillGLWindow endp
