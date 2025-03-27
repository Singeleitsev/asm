lbl_wmsize:

;ReSizeGLScene(LOWORD(lParam), HIWORD(lParam));
;LoWord = Width, HiWord = Height

xor rax,rax
mov ax,r9w ;LOWORD(lParam)

cmp ax,100h ;Width > 256 pixels
jnl @f
mov ax,100h
@@:
;cmp ax,500h
;jng @f
;mov ax,500h
;@@:
mov nWidth,eax

xor rax,rax
mov rax,r9
shr rax,10h ;HIWORD(lParam)

cmp ax,50h ;Height > 80 pixels
jnl @f
mov ax,50h
@@:
;cmp ax,400h
;jng @f
;mov ax,400h
;@@:
mov nHeight,eax


call ReSizeGLScene


xor eax,eax
jmp lbl_finwndproc

