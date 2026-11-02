parse_usemtl proc

add esi,7 ;"usemtl" + delimiter

mov edi,gnCurrent_usemtl
imul edi,edi,SIZE_USEMTL_METADATA

;Close previous usemtl's LAST_SMOOTHING
test edi,edi
jz lbl_NoPrev_usemtl ;first usemtl, nothing to close
mov ecx,edi
sub ecx,SIZE_USEMTL_METADATA
add ecx,gpBuffer_usemtl ;ecx = previous usemtl record
mov edx,gnCurrent_s
dec edx ;LAST = count - 1
mov dword ptr[ecx + OFFSET_USEMTL_LAST_SMOOTHING_INDEX],edx

lbl_NoPrev_usemtl:
add edi,gpBuffer_usemtl ;edi = current usemtl record
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

mov eax,gnCurrent_g
dec eax
mov [edi + OFFSET_USEMTL_HOST_GROUP_INDEX],eax

mov eax,gnCurrent_s
mov dword ptr[edi + OFFSET_USEMTL_FIRST_SMOOTHING_INDEX],eax

;lbl_End:
inc gnCurrent_usemtl
ret
parse_usemtl endp


