wmSievePaint:

mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax



mov rcx,hwnd
lea rdx,ps
call EndPaint




xor rax,rax
jmp endSieveWndProc



