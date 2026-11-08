;--------------------------------------
;parse_newmtl - parse the material name
;Input: esi = cursor at "newmtl <name>"
;Output:
;esi = cursor at the next "newmtl" (or EOF)
;edi = pointer to the current NEWMTL_METADATA
;gnCurrent_newmtl incremented
;gpBuffer_newmtl[gnCurrent_newmtl] filled
;----------------------------------------
parse_newmtl proc

;1. Advance the cursor
add esi,7 ;skip "newmtl "
call skipSpace

;2. Sanity Check
mov eax,gnCount_newmtl
test eax,eax
jz lbl_End ;Error - No materials in the Source

;3. Get the addresses
;esi = position in the source file
;edi = pointer to the first NEWMTL_METADATA
mov edi,gpBuffer_newmtl
mov ecx,gnCurrent_newmtl
;Cycle instead of multiplication
lbl_NextSlot:
test ecx,ecx
jz lbl_WriteName
add edi,SIZE_NEWMTL_METADATA
dec ecx
jmp lbl_NextSlot

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

mov byte ptr[edx],al
inc esi
inc edx
dec ecx
jnz lbl_CopyByte

;5. Terminate the string
lbl_Done:
mov byte ptr[edx],0 ;null-terminate

;6. Parse the properties
call parseMtlProperties

;7. Advance the Counter
inc gnCurrent_newmtl

lbl_End:
ret
parse_newmtl endp


