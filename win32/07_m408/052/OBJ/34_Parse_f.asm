parse_f proc uses ebx

add esi,2 ;skip "f "

;edi = gpBuffer_f + gnCurrent_f * 36
mov eax,gnCurrent_f
imul eax,eax,36
mov edi,gpBuffer_f
add edi,eax
xor ebx,ebx ;group index 0,1,2

lbl_GroupLoop:

;parse v index
call ParseSignedInt ;eax = v index (signed)
test eax,eax
jns lbl_Pos_v
add eax,gnCurrent_v
jmp lbl_Store_v
lbl_Pos_v:
dec eax ;1-based -> 0-based
lbl_Store_v:
mov dword ptr[edi + ebx + 0],eax
inc esi ;skip '/'

;parse vt index
call ParseSignedInt
test eax,eax
jns lbl_Pos_vt
add eax,gnCurrent_vt
jmp lbl_Store_vt
lbl_Pos_vt:
dec eax ;1-based -> 0-based
lbl_Store_vt:
mov dword ptr[edi + ebx + 4],eax
inc esi ;skip '/'

;parse vn index
call ParseSignedInt
test eax,eax
jns lbl_Pos_vn
add eax,gnCurrent_vn
jmp lbl_Store_vn
lbl_Pos_vn:
dec eax ;1-based -> 0-based
lbl_Store_vn:
mov dword ptr[edi + ebx + 8],eax

;skip space before next group
inc esi
add ebx,12
cmp ebx,36
jl lbl_GroupLoop

;lbl_End:
inc gnCurrent_f
ret
parse_f endp


