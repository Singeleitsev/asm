;---------------------------------------------------------------------
; parseObjectName - Parse "o name" and advance gpObjDataCurrent
; Input:  gpObjDataCurrent points to the 'o' character
; Output: gpObjDataCurrent updated to after the name
;---------------------------------------------------------------------
parseObjectName proc
PROLOG 100h

;Skip "o "
add gpObjDataCurrent,2

;Skip any spaces/tabs before the name
mov rcx,gpObjDataCurrent
call skipSpace ;returns updated pointer in RAX
mov gpObjDataCurrent,rax

;Now skip the actual name (ignore it)
mov rsi,gpObjDataCurrent
lbl_SkipObjectName:
mov al,byte ptr[rsi]
cmp al,20h ;space
je lbl_EndObjectName
cmp al,9 ;tab
je lbl_EndObjectName
cmp al,0Ah ;LF
je lbl_EndObjectName
cmp al,0Dh ;CR
je lbl_EndObjectName
cmp al,0 ;EOF
je lbl_EndObjectName
inc rsi
jmp lbl_SkipObjectName

lbl_EndObjectName:
mov gpObjDataCurrent, rsi

EPILOG
parseObjectName endp


