wmHelloDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpHelloData,rax

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpHelloData

xor rax,rax
jmp endHelloWndProc