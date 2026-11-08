;------------------------------------------------------
;GetFaceMaterial - return the material index for a face
;Input:  ebx = face index
;Output: eax = material index (0 if not found)
;---------------------------------------------

GetFaceMaterial proc
PROLOG 100h

xor rax,rax ;Default material 0
cmp gnCurrent_usemtl,0
je lbl_Done

xor r8,r8 ;usemtl index
xor r9,r9 ;smoothing index
lbl_UsemtlLoop:
cmp r8d,gnCurrent_usemtl
jge lbl_Done

;usemtl record
mov r10,r8
imul r10,r10,SIZE_USEMTL_METADATA
add r10,gpBuffer_usemtl
mov r9d,dword ptr[r10 + OFFSET_USEMTL_FIRST_SMOOTHING_INDEX]
mov r11d,dword ptr[r10 + OFFSET_USEMTL_LAST_SMOOTHING_INDEX]

lbl_SmoothingLoop:
cmp r9d,r11d
jg  lbl_NextUsemtl

;smoothing record
mov r12,r9
imul r12,r12,SIZE_SMOOTHING_METADATA
add r12,gpBuffer_s
mov r13d,dword ptr[r12 + OFFSET_SMOOTHING_FIRST_FACE_INDEX]
mov r10d,dword ptr[r12 + OFFSET_SMOOTHING_LAST_FACE_INDEX]

cmp gnCurrentFaceIndex,r13d
jl lbl_NextSmoothing ;face < FIRST
cmp gnCurrentFaceIndex,r10d
jg lbl_NextSmoothing ;face > LAST

;found: material index = gpUsemtlToMaterial[r8]
mov rax,gpUsemtlToMaterial
test rax,rax
jz lbl_Done
mov eax,dword ptr[rax + r8*4]
jmp lbl_Done

lbl_NextSmoothing:
inc r9d
jmp lbl_SmoothingLoop

lbl_NextUsemtl:
inc r8 ;usemtl index
jmp lbl_UsemtlLoop

lbl_Done:
EPILOG
GetFaceMaterial endp


