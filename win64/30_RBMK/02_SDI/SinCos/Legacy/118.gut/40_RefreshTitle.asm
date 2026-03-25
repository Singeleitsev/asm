;lbl_RefreshTitle:

inc nFrame
mov eax,nFrame

lea rdi,szMainWndTitleFrame
add rdi,10h ;Shift to Last Digit
mov rcx,8 ;Set Counter

lbl_NextFrameHexDigit:
mov bl,al ;Use bl as Buffer
and bl,0Fh ;Last Hex Digit Remains

;Convert Hex to ASCII
or bl,30h ;add bl,30h 
cmp bl,3Ah
jl lbl_StoreFrameHexDigit

;If more than 9 then skip to ASCII Letters
add bl,7h ;3Ah + 7 = 41h

lbl_StoreFrameHexDigit:
mov byte ptr [rdi],bl
shr rax,4
dec rdi
dec cl
cmp cl,0
jg lbl_NextFrameHexDigit

mov rcx,ghWnd
lea rdx,szMainWndTitle
Call SetWindowTextA

;lbl_RefreshTitle_End:
