wmSieveDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpSieveData,rax

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpSieveData

Call2 KillTimer,hwnd,1


;------
;OpenGL
;------


 mov rcx,0
 mov rdx,0
 call wglMakeCurrent
 
 mov rcx,hrc
 call wglDeleteContext
 
 mov rcx,hwnd
 mov rdx,hdc
 call ReleaseDC


xor rax,rax
jmp endSieveWndProc