;---------------------------------------------------------
; ParseSignedInt - parse a signed integer (decimal) at RSI
; Input:  RCX -> string pointer (at least one digit after optional sign)
; Output: EAX = signed integer value
; Output: RCX = updated pointer
;----------------------------------
ParseSignedInt proc
PROLOG 100h

lbl_SkipSpace:
cmp byte ptr[rcx],20h ;Space
je lbl_SkipSpace_Inc
cmp byte ptr [rcx],9 ;Tab
jne @f
lbl_SkipSpace_Inc:
inc rcx
jmp lbl_SkipSpace

@@:
xor rax,rax
xor rdx,rdx
mov dl,byte ptr[rcx]
cmp dl,2Dh ;Minus Sign
jne @f
inc rcx
; negative flag
mov rdx,1 ;flag negative
jmp ParseUnsigned

@@:
xor rdx,rdx ;positive

ParseUnsigned:
xor r8,r8 ;result = 0

lbl_DigitLoop:
mov al,byte ptr[rcx]
cmp al,30h
jb lbl_DigitDone
cmp al,39h
ja lbl_DigitDone
sub al,30h
imul r8d,10
add r8d,eax
inc rcx
jmp lbl_DigitLoop

lbl_DigitDone:
test edx,edx
jz  @f
neg r8d

@@:
mov eax,r8d

EPILOG
ParseSignedInt endp

