BuildDrawList proc
PROLOG 100h

;Allocate gnCurrent_s items (one per smoothing group = one draw)
xor r8,r8
mov r8d,gnCurrent_s
test r8d,r8d
jz lbl_Done
imul r8,r8,DRAWITEM_SIZE
mov rcx,ghProcessHeap
mov rdx,8
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpDrawItems,rax

xor rbx,rbx ;draw item index
xor r10,r10 ;usemtl index

lbl_UsemtlLoop:
cmp r10d,gnCurrent_usemtl
jge lbl_Done

;Resolve material
mov rax,gpUsemtlToMaterial
mov ecx,r10d
mov eax,[rax + rcx*4]
mov r11d,eax ;r11 = materialIndex

;r12 = material record for pass check
mov rax,r11
imul rax,rax,SIZE_NEWMTL_METADATA
mov rdi,gpBuffer_newmtl
add rdi,rax
movss xmm0,dword ptr[rdi + OFFSET_D]
comiss xmm0,f32_posOne
setae al
xor ah,ah
movzx eax,al
xor eax,1 ;0 = opaque,1 = transparent
mov r12d,eax

;rdi = usemtl record
mov rax,r10
imul rax,rax,SIZE_USEMTL_METADATA
mov rdi,gpBuffer_usemtl
add rdi,rax
mov r13d,[rdi + OFFSET_USEMTL_FIRST_SMOOTHING_INDEX]
mov r14d,[rdi + OFFSET_USEMTL_LAST_SMOOTHING_INDEX]

lbl_SmoothingLoop:
cmp r13d,r14d
jg lbl_NextUsemtl

;rdi = smoothing record
mov rax,r13
imul rax,rax,SIZE_SMOOTHING_METADATA
mov rdi,gpBuffer_s
add rdi,rax
mov eax,[rdi + OFFSET_SMOOTHING_FIRST_FACE_INDEX]
mov edx,[rdi + OFFSET_SMOOTHING_LAST_FACE_INDEX]
sub edx,eax
inc edx
imul edx,edx,3 ;indexCount = faces * 3
imul eax,eax,3 ;firstIndex = firstFace * 3

;write DrawItem
mov rdi,gpDrawItems
mov ecx,ebx
shl rcx,4
add rdi,rcx
mov [rdi+0],eax ;firstIndex
mov [rdi+4],edx ;indexCount
mov [rdi+8],r11d ;materialIndex
mov [rdi+12],r12d ;pass

inc rbx
inc r13d
jmp lbl_SmoothingLoop

lbl_NextUsemtl:
inc r10d
jmp lbl_UsemtlLoop

lbl_Done:
mov gnDrawItemCount,ebx
mov rax,1
jmp lbl_End

lbl_Error:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
BuildDrawList endp


