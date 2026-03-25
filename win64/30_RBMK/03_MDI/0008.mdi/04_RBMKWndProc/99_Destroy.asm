wmRBMKDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpRBMKData,rax

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpRBMKData

Call2 KillTimer,hwnd,1



;OpenGL
Call2 wglMakeCurrent,0,0
Call1 wglDeleteContext,hrc
Call2 ReleaseDC,hwnd,hdc

;return 0;
xor rax,rax
jmp endRBMKWndProc ;mdidemo401CE5

