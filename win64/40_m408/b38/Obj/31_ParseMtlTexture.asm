;-----------------------------------------
; parseMtlTexture - Parse texture filename
; Input:  gpMtlDataCurrent points to first character of filename
; Output: gpMtlDataCurrent advanced, string stored in current material
;---------------------------------------------------------------------
parseMtlTexture proc
PROLOG 100h

mov rsi,gpMtlDataCurrent

; Skip spaces and options (like -bm 0.0200)
lbl_SkipOpt:
cmp byte ptr[rsi],20h ;Space
je @f
cmp byte ptr[rsi],9 ;Tab
jne lbl_CheckOption

@@:
inc rsi
jmp lbl_SkipOpt

lbl_CheckOption:
cmp byte ptr[rsi],2Fh ;Minus Sign
jne lbl_ParseTexture

;skip option name and value
lbl_SkipOptionName:
mov al, byte ptr[rsi]
cmp al,20h ;Space
je lbl_SkipOptionValue
cmp al,9 ;Tab
je lbl_SkipOptionValue
inc rsi
jmp lbl_SkipOptionName

lbl_SkipOptionValue:
inc rsi

;skip until next space or end
lbl_SkipValue:
mov al, byte ptr[rsi]
cmp al,20h ;Space
je lbl_AfterOption
cmp al,9 ;Tab
je lbl_AfterOption
inc rsi
jmp lbl_SkipValue

lbl_AfterOption:
inc rsi
jmp lbl_SkipOpt
lbl_ParseTexture:

;Copy filename to material
mov rdi,pCurrentMat
add rdi,96 ;texture filename offset
mov rcx,0

lbl_CopyTex:
mov al, byte ptr[rsi]
cmp al,20h ;Space
je lbl_CopyTexDone
cmp al,9 ;Tab
je lbl_CopyTexDone
cmp al,0Ah ;CR
je lbl_CopyTexDone
cmp al,0Dh ;LF
je lbl_CopyTexDone
cmp al,0 ;EOF
je lbl_CopyTexDone
cmp rcx, 63
jge lbl_CopyTexDone
mov byte ptr [rdi + rcx], al
inc rcx
inc rsi
jmp lbl_CopyTex

lbl_CopyTexDone:
mov byte ptr [rdi + rcx],0
mov gpMtlDataCurrent,rsi

EPILOG
parseMtlTexture endp
