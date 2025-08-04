lbl_wmdestroy:

xor rcx,rcx
xor rdx,rcx
call wglMakeCurrent

mov rcx,hrc
call wglDeleteContext

mov rcx,hwnd
mov rdx,hdc
call ReleaseDC

xor rcx,rcx
call PostQuitMessage

xor eax,eax

