parse_o proc

add esi,2 ;skip "o" + delimiter

mov edi,gnCurrent_o
imul edi,edi,SIZE_OBJECT_METADATA

;Close previous object's LAST_GROUP
test edi,edi
jz lbl_NoPrev_o
mov ecx,edi
sub ecx,SIZE_OBJECT_METADATA
add ecx,gpBuffer_o ;ecx = previous object record
mov edx,gnCurrent_g
dec edx ;LAST = count - 1
mov dword ptr [ecx + OFFSET_OBJECT_LAST_GROUP_INDEX],edx

lbl_NoPrev_o:
add edi,gpBuffer_o ;edi = current object record
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
mov byte ptr [edx],0 ;Null-terminator

mov eax,gnCurrent_g
mov dword ptr[edi + OFFSET_OBJECT_FIRST_GROUP_INDEX],eax

;lbl_End:
inc gnCurrent_o
ret
parse_o endp


