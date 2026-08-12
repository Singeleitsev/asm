;--------------------------------
;skipSpace - Skip spaces and tabs
;--------------------------------
skipSpace proc

lbl_Check:
cmp byte ptr[rcx],20h ;Space
je lbl_NextByte
cmp byte ptr[rcx],9 ;Tab
jne lbl_Done

lbl_NextByte:
inc rcx
jmp lbl_Check

lbl_Done:
mov rax,rcx
ret
skipSpace endp

;-------------------------------------------------------
;parseString – Reads a string into a destination buffer.
;Input:
;RCX = pointer to source
;RDX = pointer to destination buffer
;Output:
;RAX = updated source pointer (after the name, at the delimiter)
;Destination buffer contains the null-terminated name
;----------------------------------------------------

parseString proc

;Skip leading spaces/tabs (safety)
mov r8,rcx

lbl_SkipSpaces:
cmp byte ptr [r8],20h ;space
je lbl_IncSpace
cmp byte ptr [r8],9 ;tab
jne lbl_NameStart

lbl_IncSpace:
inc r8
jmp lbl_SkipSpaces

;Start of name
lbl_NameStart:
mov rcx,r8 ;save start of name
xor r9,r9 ;index counter

;Copy name until delimiter
lbl_Copy:
mov al,byte ptr [r8 + r9]
cmp al,20h ;space
je lbl_Done
cmp al,9 ;tab
je lbl_Done
cmp al,0Ah ;LF
je lbl_Done
cmp al,0Dh ;CR
je lbl_Done
test al,al ;EOF
jz lbl_Done

;Copy character
mov byte ptr [rdx + r9], al
inc r9

;Safety check – prevent buffer overflow
cmp r9,3Fh ;64 bytes including Delimiter
jl lbl_Copy

;End of name
lbl_Done:
mov byte ptr [rdx + r9],0 ;null-terminate

;Advance source pointer to delimiter
;rcx = start of name, r9 = length
add rcx,r9
mov rax,rcx ;return updated pointer

ret
parseString endp



;------------------------------------------------------
;CompareStrings – compares two null-terminated strings
;Input: RCX = string 1, RDX = string 2
;Output: RAX = 1 if equal, 0 if different
;-----------------------------------------
CompareStrings proc

lbl_CmpLoop:
mov al,byte ptr [rcx]
mov bl,byte ptr [rdx]
cmp al,bl
jne lbl_Different
test al,al
jz lbl_Equal
inc rcx
inc rdx
jmp lbl_CmpLoop

lbl_Equal:
mov rax,1
jmp lbl_Done

lbl_Different:
xor rax,rax

lbl_Done:
ret
CompareStrings endp

