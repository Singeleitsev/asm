parse_s proc
PROLOG 100h

add rsi,2 ;"s" + delimiter

mov edi,gnCurrent_s
imul edi,edi,SIZE_SMOOTHING_METADATA

;Close previous s's LAST_FACE
test rdi,rdi
jz lbl_NoPrev_s ;first smoothing group, nothing to close
mov rcx,rdi
sub rcx,SIZE_SMOOTHING_METADATA
add rcx,gpBuffer_s ;rcx = previous smoothing group record
mov eax,gnCurrent_f
dec eax ;LAST = count - 1
mov dword ptr[rcx + OFFSET_SMOOTHING_LAST_FACE_INDEX],eax

lbl_NoPrev_s:
add rdi,gpBuffer_s ;rdi = current smoothing group record
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

mov eax,gnCurrent_usemtl
dec eax
mov [rdi + OFFSET_SMOOTHING_HOST_USEMTL_INDEX],eax

mov eax,gnCurrent_f
mov dword ptr[rdi + OFFSET_SMOOTHING_FIRST_FACE_INDEX],eax

;lbl_End:
inc gnCurrent_s
EPILOG
parse_s endp


