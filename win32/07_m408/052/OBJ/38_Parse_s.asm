parse_s proc

add esi,2 ;"s" + delimiter

mov edi,gnCurrent_s
imul edi,edi,SIZE_SMOOTHING_METADATA

;Close previous s's LAST_FACE
test edi,edi
jz lbl_NoPrev_s ;first smoothing group, nothing to close
mov ecx,edi
sub ecx,SIZE_SMOOTHING_METADATA
add ecx,gpBuffer_s ;ecx = previous smoothing group record
mov edx,gnCurrent_f
dec edx ;LAST = count - 1
mov dword ptr[ecx + OFFSET_SMOOTHING_LAST_FACE_INDEX],edx

lbl_NoPrev_s:
add edi,gpBuffer_s ;edi = current smoothing group record
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

mov eax,gnCurrent_usemtl
dec eax
mov [edi + OFFSET_SMOOTHING_HOST_USEMTL_INDEX],eax

mov eax,gnCurrent_f
mov dword ptr[edi + OFFSET_SMOOTHING_FIRST_FACE_INDEX],eax

;lbl_End:
inc gnCurrent_s
ret
parse_s endp


