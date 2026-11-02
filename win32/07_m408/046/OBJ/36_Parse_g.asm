parse_g proc

add esi,2 ;"g" + delimiter

mov edi,gnCurrent_g
imul edi,edi,SIZE_GROUP_METADATA

;Close previous group's LAST_USEMTL
test edi,edi
jz lbl_NoPrev_g ;first group, nothing to close
mov ecx,edi
sub ecx,SIZE_GROUP_METADATA
add ecx,gpBuffer_g ;ecx = previous group record
mov edx,gnCurrent_usemtl
dec edx ;LAST = count - 1
mov dword ptr[ecx + OFFSET_GROUP_LAST_USEMTL_INDEX],edx

lbl_NoPrev_g:
add edi,gpBuffer_g ;edi = current group record
mov edx,edi ;edx = copy pointer
mov ecx,3Fh

lbl_Copy:
mov al,[esi]
cmp al,21h ;ASCII left range border
jl lbl_Done
cmp al,7Fh ;ASCII right range border
jge lbl_Done

mov [edx],al
inc esi
inc edx
dec ecx
jnz lbl_Copy

lbl_Done:
mov byte ptr[edx],0 ;Null-terminator

mov eax,gnCurrent_o
dec eax
mov [edi + OFFSET_GROUP_HOST_OBJECT_INDEX],eax

mov eax,gnCurrent_usemtl
mov dword ptr[edi + OFFSET_GROUP_FIRST_USEMTL_INDEX],eax

;lbl_End:
inc gnCurrent_g
ret
parse_g endp


