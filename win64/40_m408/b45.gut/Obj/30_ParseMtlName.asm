;--------------------------------------------------------
; parseMaterialName - Read material name until whitespace
; Input:  gpMtlDataCurrent points to first character of name
; Output: EAX = material index, gpMtlDataCurrent advanced
;--------------------------------------------------------
parseMtlName proc
PROLOG 100h

;Skip "newmtl"
add gpMtlDataCurrent,6

lbl_SkipNameSpace:
mov rsi,gpMtlDataCurrent
cmp byte ptr [rsi],20h ;Space
je lbl_SkipNameSpace_Inc
cmp byte ptr [rsi],9 ;Tab
jne lbl_NameStart

lbl_SkipNameSpace_Inc:
inc gpMtlDataCurrent
jmp lbl_SkipNameSpace

lbl_NameStart:
mov rcx,gpMtlDataCurrent ;rcx = Start

;Find end of name
lbl_FindNameEnd:
mov rsi,gpMtlDataCurrent
mov al,byte ptr [rsi]
cmp al,20h ;Space
je lbl_EndOfName
cmp al,9 ;Tab
je lbl_EndOfName
cmp al,0Ah ;CR
je lbl_EndOfName
cmp al,0Dh ;LF
je lbl_EndOfName
cmp al,0 ;EOF
je lbl_EndOfName
inc gpMtlDataCurrent
jmp lbl_FindNameEnd

lbl_EndOfName:
;rcx = Start of name, rsi = delimiter

;Check capacity
mov r12d,gnMtlCount ;Yet unchanged
cmp r12d,gnMtlCapacity
jge lbl_parseMtlName_CapacityError

;Compute material base
xor r10,r10
mov r10d,gnMtlCount
imul r10,r10,MTL_STRUCT_SIZE
add r10,gpMaterials ;r10 = new material block

;Copy name (max 31 chars) into OFFSET_NAME
mov r11,r10
add r11,OFFSET_NAME ;destination
xor r8,r8 ;counter (volatile)
;length = rsi - rcx
mov rdx,gpMtlDataCurrent
sub rdx,rcx ;length

lbl_CopyName:
cmp r8,rdx
jge lbl_CopyNameDone
cmp r8,31
jge lbl_CopyNameDone ;Name was too long
mov al,byte ptr[rcx + r8]
mov byte ptr[r11 + r8],al
inc r8
jmp lbl_CopyName

lbl_CopyNameDone:
mov byte ptr [r11 + r8], 0 ;null-terminate

;Update globals
mov gnCurrentMaterialIndex,r12d ;index = old count
mov gpCurrentMtl,r10
inc gnMtlCount

;Success
mov rax, 1
jmp lbl_parseMtlName_End

lbl_parseMtlName_CapacityError:
LOG_TEXT szErrMtlCapacity
xor rax, rax
;jmp lbl_parseMtlName_End

lbl_parseMtlName_End:
EPILOG
parseMtlName endp

