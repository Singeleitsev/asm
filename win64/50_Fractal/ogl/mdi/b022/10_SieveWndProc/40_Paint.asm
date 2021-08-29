wmR2Paint:

mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax



mov rcx,hwnd
lea rdx,ps
call EndPaint




xor rax,rax
jmp endR2WndProc



