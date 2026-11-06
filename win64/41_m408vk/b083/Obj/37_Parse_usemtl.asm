parse_usemtl proc
PROLOG 100h

add rsi,7 ;"usemtl" + delimiter

mov edi,gnCurrent_usemtl
imul edi,edi,SIZE_USEMTL_METADATA

;Close previous usemtl's LAST_SMOOTHING
test rdi,rdi
jz lbl_NoPrev_usemtl ;first usemtl, nothing to close
mov rcx,rdi
sub rcx,SIZE_USEMTL_METADATA
add rcx,gpBuffer_usemtl ;rcx = previous usemtl record
mov eax,gnCurrent_s
dec eax ;LAST = count - 1
mov dword ptr[rcx + OFFSET_USEMTL_LAST_SMOOTHING_INDEX],eax

lbl_NoPrev_usemtl:
add rdi,gpBuffer_usemtl ;rdi = current usemtl record
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

mov eax,gnCurrent_g
dec eax
mov [rdi + OFFSET_USEMTL_HOST_GROUP_INDEX],eax

mov eax,gnCurrent_s
mov dword ptr[rdi + OFFSET_USEMTL_FIRST_SMOOTHING_INDEX],eax

;lbl_End:
inc gnCurrent_usemtl
EPILOG
parse_usemtl endp


