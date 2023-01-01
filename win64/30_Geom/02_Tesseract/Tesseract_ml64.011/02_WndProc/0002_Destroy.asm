lbl_wmdestroy:

xor rcx,rcx
xor rdx,rcx
call wglMakeCurrent

mov rcx,hrc
call wglDeleteContext

mov rcx,hwnd
mov rdx,hdc
call ReleaseDC

mov rcx,hwnd
mov rdx,1
call KillTimer

xor rcx,rcx
call PostQuitMessage

xor eax,eax

