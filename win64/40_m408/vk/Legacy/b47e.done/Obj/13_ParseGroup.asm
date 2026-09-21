;---------------------------------------------------------------------
; parseGroupName - Parse "g name" and advance gpObjDataCurrent
; Input:  gpObjDataCurrent points to the 'g' character
; Output: gpObjDataCurrent updated to after the name
;---------------------------------------------------------------------
parseGroupName proc
PROLOG 100h

;Skip "g "
add gpObjDataCurrent,2

;Skip spaces/tabs before the name
mov rcx,gpObjDataCurrent
call skipSpace
mov gpObjDataCurrent,rax

;Skip the name (ignore it)
mov rsi, gpObjDataCurrent
lbl_SkipGroupName:
mov al,byte ptr[rsi]
cmp al,20h ;space
je lbl_EndGroupName
cmp al,9 ;tab
je lbl_EndGroupName
cmp al,0Ah ;LF
je lbl_EndGroupName
cmp al,0Dh ;CR
je lbl_EndGroupName
cmp al,0 ;EOF
je lbl_EndGroupName
inc rsi
jmp lbl_SkipGroupName

lbl_EndGroupName:
mov gpObjDataCurrent, rsi

EPILOG
parseGroupName endp


