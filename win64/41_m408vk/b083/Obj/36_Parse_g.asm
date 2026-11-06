parse_g proc
PROLOG 100h

add rsi,2 ;"g" + delimiter

mov edi,gnCurrent_g
imul edi,edi,SIZE_GROUP_METADATA

;Close previous group's LAST_USEMTL
test rdi,rdi
jz lbl_NoPrev_g ;first group, nothing to close
mov rcx,rdi
sub rcx,SIZE_GROUP_METADATA
add rcx,gpBuffer_g ;rcx = previous group record
mov eax,gnCurrent_usemtl
dec eax ;LAST = count - 1
mov dword ptr[rcx + OFFSET_GROUP_LAST_USEMTL_INDEX],eax

lbl_NoPrev_g:
add rdi,gpBuffer_g ;rdi = current group record
mov rdx,rdi ;rdx = copy pointer
mov rcx,3Fh

lbl_Copy:
mov al,byte ptr[rsi]
cmp al,21h ;ASCII left range border
jl lbl_Done
cmp al,7Fh ;ASCII right range border
jge lbl_Done

mov byte ptr[rdx],al
inc rsi
inc rdx
dec rcx
jnz lbl_Copy

lbl_Done:
mov byte ptr[rdx],0 ;Null-terminator

mov eax,gnCurrent_o
dec eax
mov [rdi + OFFSET_GROUP_HOST_OBJECT_INDEX],eax

mov eax,gnCurrent_usemtl
mov dword ptr[rdi + OFFSET_GROUP_FIRST_USEMTL_INDEX],eax

;lbl_End:
inc gnCurrent_g
EPILOG
parse_g endp


