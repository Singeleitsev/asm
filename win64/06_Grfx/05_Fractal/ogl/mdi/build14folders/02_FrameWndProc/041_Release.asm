mov rcx,0
mov rdx,0
call wglMakeCurrent

mov rcx,hRC
call wglDeleteContext

;mov rcx,hwnd
mov rcx,hWndClient
mov rdx,hDC
call ReleaseDC

