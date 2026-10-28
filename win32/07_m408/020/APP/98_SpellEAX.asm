SpellEAX proc uses eax ebx ecx edx edi

lea edi,szEAX
add edi,18h ;Shift to Last Digit
mov ecx,4 ;Set Counter

lbl_NextGroup:
mov edx,4 ;Set Counter

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
mov byte ptr[edi],bl
ror eax,4
dec edi
dec dl
cmp dl,0
jg lbl_NextHexDigit

dec edi ;Skip Period
dec cl
cmp cl,0
jg lbl_NextGroup

push 0 ;MB_OK
push offset szAboutMsgTitle
push offset szEAX
push ghWnd
call MessageBoxA

ret
SpellEAX endp


