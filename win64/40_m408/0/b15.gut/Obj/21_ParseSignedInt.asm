;-----------------------------------------------------------------------------
; ParseSignedInt - parse a signed integer (decimal) at RSI
; Input:  RSI -> string pointer (at least one digit after optional sign)
; Output: EAX = signed integer value
; Modifies: RAX, RBX, RCX, RDX, RSI
;-----------------------------------------------------------------------------
ParseSignedInt proc
    xor eax, eax
    xor edx, edx
    mov dl, byte ptr [rsi]
    cmp dl, 2Dh                 ; '-'
    jne @f
    inc rsi
    ; negative flag
    mov edx, 1                  ; flag negative
    jmp ParseUnsigned
@@:
    xor edx, edx                ; positive
ParseUnsigned:
    xor ecx, ecx                ; result = 0
lbl_DigitLoop:
    movzx eax, byte ptr [rsi]
    cmp al, 30h
    jb  lbl_DigitDone
    cmp al, 39h
    ja  lbl_DigitDone
    sub al, 30h
    imul ecx, 10
    add ecx, eax
    inc rsi
    jmp lbl_DigitLoop
lbl_DigitDone:
    test edx, edx
    jz  @f
    neg ecx
@@:
    mov eax, ecx
    ret
ParseSignedInt endp
