parse_o proc
PROLOG 100h

add rsi,2 ;skip "o" + delimiter

mov edi,gnCurrent_o
imul edi,edi,SIZE_OBJECT_METADATA

;Close previous object's LAST_GROUP
test rdi,rdi
jz lbl_NoPrev_o
mov rcx,rdi
sub rcx,SIZE_OBJECT_METADATA
add rcx,gpBuffer_o ;rcx = previous object record
mov eax,gnCurrent_g
dec eax ;LAST = count - 1
mov dword ptr[rcx+OFFSET_OBJECT_LAST_GROUP_INDEX],eax

lbl_NoPrev_o:
add rdi,gpBuffer_o ;rdi = current object record
mov rdx,rdi ;edx = copy pointer
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
mov dword ptr[rdi+OFFSET_OBJECT_FIRST_GROUP_INDEX],eax

;lbl_End:
inc gnCurrent_o
EPILOG
parse_o endp


