SpellRAX proc
PROLOG 100h

push rax
push rbx
push rcx
push rdx
push r8
push r9
push rsi
push rdi

lea rdi,szRAX
add rdi,18h ;Shift to Last Digit
mov rcx,4 ;Set Counter

lbl_NextGroup:
mov rdx,4 ;Set Counter

lbl_NextHexDigit:
mov bl,al ;Use bl as Buffer
and bl,0Fh ;Last Hex Digit Remains

;Convert Hex to ASCII
or bl,30h ;add bl,30h 
cmp bl,3Ah
jl lbl_StoreHexDigit

;If more than 9 then skip to ASCII Letters
add bl,7 ;3Ah + 7 = 41h

lbl_StoreHexDigit:
mov byte ptr[rdi],bl
ror rax,4
dec rdi
dec dl
cmp dl,0
jg lbl_NextHexDigit

dec rdi ;Skip Period
dec cl
cmp cl,0
jg lbl_NextGroup

mov rcx,ghWndMain
lea rdx,szRAX
lea r8,szAboutMsgTitle
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

pop rdi
pop rsi
pop r9
pop r8
pop rdx
pop rcx
pop rbx
pop rax

EPILOG
SpellRAX endp


