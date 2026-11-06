;----------------------
;BuildMaterialMap
;Maps each UseMtl record to its corresponding Material index
;Input:
;gpBuffer_usemtl,gnCurrent_usemtl,
;gpBuffer_newmtl,gnCount_newmtl
;Output:
;gUsemtlToMaterial (allocated array of DWORDs)
;Each entry is the index into gpBuffer_newmtl
;--------------------------------------------

BuildMaterialMap proc
PROLOG 100h

;1. Allocate the mapping array
mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnCurrent_usemtl
test r8d,r8d
jz lbl_Done
shl r8,2 ;4 bytes per index
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpUsemtlToMaterial,rax

;2. Loop over every usemtl record
xor rbx,rbx ;ebx = usemtl index (outer loop)

lbl_UsemtlLoop:
cmp ebx,gnCurrent_usemtl
jge lbl_Done

;rsi = pointer to this usemtl's name
mov rax,rbx
imul rax,rax,SIZE_USEMTL_METADATA
mov rsi,gpBuffer_usemtl
add rsi,rax

;3. Inner loop: compare against every newmtl record
xor rdi,rdi ;rdi = material index

lbl_MaterialLoop:
cmp edi,gnCount_newmtl
jge lbl_NotFound

;rdx = pointer to this material's name
mov rax,rdi
imul eax,eax,SIZE_NEWMTL_METADATA
mov rdx,gpBuffer_newmtl
add rdx,rax

;4. Compare strings (rsi = usemtl name,edx = material name)
;CompareStrings preserves rsi and rdi,but we must move edx to rdi
;so the comparison works,then restore the material index
mov rdi,rdx ;rdi = material name for CompareStrings
call compareStrings ;returns eax = 1 if equal,0 if different
test eax,eax
jnz lbl_Match

inc rdi
jmp lbl_MaterialLoop

lbl_Match:
;5. Found a match: store the index
mov rax,gpUsemtlToMaterial
mov [rax + rbx*4],rdi
jmp lbl_NextUsemtl

lbl_NotFound:
;6. Default to material 0 if no match
mov rax,gpUsemtlToMaterial
mov dword ptr [rax + rbx*4],0

lbl_NextUsemtl:
inc rbx
jmp lbl_UsemtlLoop

lbl_Done:
mov rax,1
jmp lbl_End

lbl_Error:
call SpellError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
BuildMaterialMap endp


