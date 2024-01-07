lbl_wmsize:

;ReSizeGLScene(LOWORD(lParam), HIWORD(lParam));
;LoWord = Width, HiWord = Height

xor rax,rax
mov ax,r9w

cmp ax,200h
jnl @f
mov ax,200h
@@:
;cmp ax,500h
;jng @f
;mov ax,500h
;@@:
mov nWidth,rax

mov rax,r9
shr rax,10h ;Shift Right 16 bits

cmp ax,200h
jnl @f
mov ax,200h
@@:
;cmp ax,400h
;jng @f
;mov ax,400h
;@@:
mov nHeight,rax


call ReSizeGLScene


mov rcx,hWnd
xor rdx,rdx
xor r8,r8
call InvalidateRect

xor eax,eax
jmp lbl_finwndproc

