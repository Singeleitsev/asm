wmR2Destroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpR2Data,rax

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpR2Data

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
jmp endR2WndProc