lbl_wmdestroy:
 mov rcx,0
 mov rdx,0
 call wglMakeCurrent
 
 mov rcx,hrc
 call wglDeleteContext
 
 mov rcx,hwnd
 mov rdx,hdc
 call ReleaseDC
 
 mov rcx,0
 call PostQuitMessage
 xor eax,eax

