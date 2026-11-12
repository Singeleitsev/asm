;--------------------------------------
;parse_newmtl - parse the material name
;Input: rsi = cursor at "newmtl <name>"
;Output:
;rsi = cursor at the end of the current material block (on the CR/LF before the next newmtl, or EOF)
;rdi = pointer to the current NEWMTL_METADATA
;gnCurrent_newmtl incremented
;gpBuffer_newmtl[gnCurrent_newmtl] filled
;----------------------------------------
parse_newmtl proc
PROLOG 100h

;1. Advance the cursor
add rsi,7 ;skip "newmtl "
call skipSpace

;2. Sanity Check
mov eax,gnCount_newmtl
test eax,eax
jz lbl_End ;Error - No materials in the Source

;3. Get the addresses
;rsi = position in the source file
;rdi = pointer to the first NEWMTL_METADATA
mov rdi,gpBuffer_newmtl
mov ecx,gnCurrent_newmtl
;Cycle instead of multiplication
lbl_NextSlot:
test ecx,ecx
jz lbl_WriteName
add rdi,SIZE_NEWMTL_METADATA
dec rcx
jnz lbl_NextSlot

;4.Copy name to NEWMTL_METADATA
lbl_WriteName:
;Save the destination counter
mov rdx,rdi
;Safety check – prevent buffer overflow
mov rcx,3Fh ;maximum length = 63 bytes and Delimiter

lbl_CopyByte:
mov al,byte ptr[rsi]
cmp al,21h ;Left ASCII Range Border
jl lbl_NameDone
cmp al,7Fh ;Right ASCII Range Border
jge lbl_NameDone

mov byte ptr[rdx],al
inc rsi
inc rdx
dec rcx
jnz lbl_CopyByte

;5. Terminate the string
lbl_NameDone:
mov byte ptr[rdx],0 ;null-terminate

;6. Parse the properties
call parseMtlProperties

;7. Advance the Counter
inc gnCurrent_newmtl

lbl_End:
EPILOG
parse_newmtl endp


