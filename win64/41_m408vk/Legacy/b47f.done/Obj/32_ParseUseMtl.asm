parseUseMtl proc
LOCAL savedByte:BYTE
PROLOG 100h

;skip "usemtl"
add gpObjDataCurrent,6

;Skip spaces/tabs
lbl_SkipSpace:
mov rsi,gpObjDataCurrent
cmp byte ptr[rsi],20h
je lbl_SkipSpace_Inc
cmp byte ptr [rsi],9
jne lbl_ReadSourceName

lbl_SkipSpace_Inc:
inc gpObjDataCurrent
jmp lbl_SkipSpace

lbl_ReadSourceName:
;rsi now points to first character of material name
mov rsi,gpObjDataCurrent ;save start

;Find end of name (delimiter)
lbl_FindSourceEnd:
mov rdi,gpObjDataCurrent
mov al,byte ptr [rdi]
cmp al,20h ;Space
je lbl_GotSourceName
cmp al,9 ;Tab
je lbl_GotSourceName
cmp al,0Ah ;CR
je lbl_GotSourceName
cmp al,0Dh ;LF
je lbl_GotSourceName
test al,al ;EOF
jz lbl_GotSourceName
inc gpObjDataCurrent
jmp lbl_FindSourceEnd

lbl_GotSourceName:
;rsi = start, rdi = delimiter (or end)
mov r8,rdi
sub r8,rsi ;r8 = Length

mov gnCurrentMaterialIndex, -1
cmp gnMtlCount,0
je lbl_UseMtlNotFound

mov r9,gpMaterials ;base of material array
xor rcx,rcx ;gnCurrentMaterialIndex

lbl_Search:
mov rbx,rsi ;rbx = source start (preserve)
mov rdx,r9 ;r9 points to current material block
add rdx,OFFSET_NAME ;rdx = material name pointer
mov r10,r8 ;copy length for comparison

lbl_Compare:
;Compare source byte (at rbx) with material byte (at rdx)
mov al,byte ptr[rbx]
cmp al,byte ptr[rdx]
jne lbl_Next
inc rbx
inc rdx
dec r10
cmp r10d,0
jg lbl_Compare

;Ensure material name ends here
cmp byte ptr[rdx],0
jne lbl_Next

;Found!
mov gnCurrentMaterialIndex,ecx
jmp lbl_UseMtl_Success

lbl_Next:
add r9,MTL_STRUCT_SIZE
inc ecx
cmp ecx,gnMtlCount
jl lbl_Search

;Not found
jmp lbl_UseMtlNotFound

lbl_UseMtl_Success:
;LOG_TEXT szLogFoundMtlIndex
;xor rcx,rcx
;mov ecx,gnCurrentMaterialIndex
;call WriteDecimalToLog
;LOG_TEXT szCRLF
mov rax,1
jmp lbl_UseMtl_End

lbl_UseMtlNotFound:
;LOG_TEXT szErrMtlNotFound
;mov rcx,rsi
;call WriteLog
;LOG_TEXT szCRLF
mov gnCurrentMaterialIndex,2 ;Blue by default
xor rax,rax
;jmp lbl_UseMtl_End

lbl_UseMtl_End:
EPILOG
parseUseMtl endp

