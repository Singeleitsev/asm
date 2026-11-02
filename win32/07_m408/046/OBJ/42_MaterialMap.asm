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

BuildMaterialMap proc uses ebx esi edi

;1. Allocate the mapping array
mov eax,gnCurrent_usemtl
test eax,eax
jz lbl_Done
shl eax,2 ;4 bytes per index
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gUsemtlToMaterial,eax

;2. Loop over every usemtl record
xor ebx,ebx ;ebx = usemtl index (outer loop)

lbl_UsemtlLoop:
cmp ebx,gnCurrent_usemtl
jge lbl_Done

;esi = pointer to this usemtl's name
mov eax,ebx
imul eax,eax,SIZE_USEMTL_METADATA
mov esi,gpBuffer_usemtl
add esi,eax

;3. Inner loop: compare against every newmtl record
xor edi,edi ;edi = material index

lbl_MaterialLoop:
cmp edi,gnCount_newmtl
jge lbl_NotFound

;edx = pointer to this material's name
mov eax,edi
imul eax,eax,SIZE_NEWMTL_METADATA
mov edx,gpBuffer_newmtl
add edx,eax

;4. Compare strings (esi = usemtl name,edx = material name)
;CompareStrings preserves esi and edi,but we must move edx to edi
;so the comparison works,then restore the material index
push edi
mov edi,edx ;edi = material name for CompareStrings
call CompareStrings ;returns eax = 1 if equal,0 if different
pop edi ;restore material index

test eax,eax
jnz lbl_Match

inc edi
jmp lbl_MaterialLoop

lbl_Match:
;5. Found a match: store the index
mov eax,gUsemtlToMaterial
mov [eax + ebx*4],edi
jmp lbl_NextUsemtl

lbl_NotFound:
;6. Default to material 0 if no match
mov eax,gUsemtlToMaterial
mov dword ptr [eax + ebx*4],0

lbl_NextUsemtl:
inc ebx
jmp lbl_UsemtlLoop

lbl_Done:
mov eax,1
ret

lbl_Error:
call SpellError
xor eax,eax
ret

BuildMaterialMap endp


