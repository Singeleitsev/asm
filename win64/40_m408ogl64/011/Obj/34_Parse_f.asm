parse_f proc uses rbx
PROLOG 100h

add rsi,2 ;skip "f "

;rdi = gpBuffer_f + gnCurrent_f * 36
xor rax,rax
mov eax,gnCurrent_f
imul eax,eax,SIZE_FACE
mov rdi,gpBuffer_f
add rdi,rax
xor rbx,rbx ;group index 0,1,2

lbl_GroupLoop:

;parse v index
call parseSignedInt ;eax = v index (signed)
test eax,eax
jns lbl_Pos_v
add eax,gnCurrent_v
jmp lbl_Store_v
lbl_Pos_v:
dec eax ;1-based -> 0-based
lbl_Store_v:
mov dword ptr[rdi+rbx+0],eax
inc rsi ;skip '/'

;parse vt index
call parseSignedInt
test eax,eax
jns lbl_Pos_vt
add eax,gnCurrent_vt
jmp lbl_Store_vt
lbl_Pos_vt:
dec eax ;1-based -> 0-based
lbl_Store_vt:
mov dword ptr[rdi+rbx+4],eax
inc rsi ;skip '/'

;parse vn index
call parseSignedInt
test eax,eax
jns lbl_Pos_vn
add eax,gnCurrent_vn
jmp lbl_Store_vn
lbl_Pos_vn:
dec eax ;1-based -> 0-based
lbl_Store_vn:
mov dword ptr[rdi+rbx+8],eax

;skip space before next group
inc rsi
add rbx,12 ;sizeof(vec3)
cmp rbx,SIZE_FACE
jl lbl_GroupLoop

;lbl_End:
inc gnCurrent_f
EPILOG
parse_f endp


