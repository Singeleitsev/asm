;--------------------------------------------------
;parse_newmtl - parse the material name if it is unique
;Input: esi = cursor at "newmtl <name>"
;Output:
;esi = cursor at the next "newmtl" (or EOF)
;edi = pointer to the current NEWMTL_METADATA
;gnCurrent_newmtl incremented if the name is unique
;gpBuffer_newmtl[gnCurrent_newmtl] filled if unique
;--------------------------------------------------
parse_newmtl proc uses ebx

;1. Advance the cursor
add esi,7 ;skip "newmtl "
call skipSpace

;2. Sanity Check
mov ecx,gnCount_newmtl
test ecx,ecx
jz lbl_End ;Error - No materials in the Source

;3. Check if the name is unique
;esi = position in the source file
;edi = pointer to the first NEWMTL_METADATA
mov edi,gpBuffer_newmtl
;ecx = newmtl counter
mov ecx,gnCurrent_newmtl
test ecx,ecx
jz lbl_WriteName ;No materials in NEWMTL_METADATA
;ebx = byte counter
xor ebx,ebx

lbl_NextByte:
mov al,byte ptr [esi+ebx]
cmp al,byte ptr [edi+ebx]
jne lbl_NextName
test al,al
jz lbl_End ;The name is not unique
inc ebx
jmp lbl_NextByte

lbl_NextName:
add edi,SIZE_NEWMTL_METADATA
dec ecx
jz lbl_WriteName
xor ebx,ebx
jmp lbl_NextByte

;4.Copy name to NEWMTL_METADATA
lbl_WriteName:
;Save the destination counter
mov edx,edi
;Safety check – prevent buffer overflow
mov ecx,3Fh ;maximum length = 63 bytes and Delimiter

lbl_CopyByte:
mov al,byte ptr[esi]
cmp al,21h ;Left ASCII Range Border
jl lbl_Done
cmp al,7Fh ;Right ASCII Range Border
jge lbl_Done

mov byte ptr[edx], al
inc esi
inc edx
dec ecx
jnz lbl_CopyByte

lbl_Done:
mov byte ptr[edx],0 ;null-terminate

;5. Increment counter (only if unique,only after block parsed)
inc gnCurrent_newmtl
jmp lbl_End

lbl_Error:
;No actions yet
;jmp lbl_End

lbl_End:
ret
parse_newmtl endp


