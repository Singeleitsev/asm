wmChNPPDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpChNPPData,rax

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpChNPPData

xor rax,rax
jmp endChNPPWndProc