;--------------------------------------------------------
; parseMaterials - Parse all material properties from MTL
; Input: gpMtlDataStart/End, gnUniqueMaterials
; Output: gpDataMaterials filled with Kd, Ks, Ka, Ns, d, etc.
;--------------------------------------------------------
parseMaterials proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL materialIndex:DWORD,currentMaterial:DWORD
LOCAL pTempNameBuffer:QWORD
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

cmp gnUniqueMaterials,0
jle lbl_NoMaterials

;Allocate temp buffer for material name
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,NAME_BUFFER_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov pTempNameBuffer,rax

;Initialize
mov rcx,gpMtlDataStart
mov pCurrentSource,rcx
xor r11,r11
mov materialIndex,r11d
mov currentMaterial,-1

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
jge lbl_Done

;Check for consistency
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je lbl_Done
cmp al,9 ;Tab
je lbl_SkipLine
cmp al,0Ah ;CR
je lbl_SkipLine
cmp al,0Dh ;LF
je lbl_SkipLine
cmp al,20h ;Space
je lbl_SkipLine
cmp al,23h ;# Comment
je lbl_SkipLine

;Check for "newmtl" token
cmp dword ptr[rcx],6C746D6Eh ;"newm" in reverse
je lbl_NewMaterial

;Check for property tokens if we have a current material
cmp currentMaterial,-1
je lbl_SkipLine

;Check for "Kd" (diffuse color)
cmp word ptr[rcx],644Bh ;"Kd" in reverse
je lbl_Kd

;Check for "Ks" (specular color)
cmp word ptr[rcx],734Bh ;"Ks" in reverse
je lbl_Ks

;Check for "Ka" (ambient color)
cmp word ptr[rcx],614Bh ;"Ka" in reverse
je lbl_Ka

;Check for "Ns" (shininess)
cmp word ptr[rcx],734Eh ;"Ns" in reverse
je lbl_Ns

;Check for "d" (dissolve/opacity)
cmp byte ptr[rcx],64h ;'d'
jne lbl_SkipLine
cmp byte ptr[rcx+1],20h ;space after 'd'
je lbl_d
cmp byte ptr[rcx+1],9 ;tab after 'd'
je lbl_d
jmp lbl_SkipLine

lbl_NewMaterial:
add pCurrentSource,7 ;skip "newmtl "
mov rcx,pCurrentSource
mov rdx,pTempNameBuffer
call parseString
mov pCurrentSource,rax

;Find material index by name
xor r11,r11
mov materialIndex,r11d

lbl_FindMaterial:
mov rcx,pTempNameBuffer
xor rdx,rdx
mov edx,materialIndex
imul rdx,rdx,MATERIAL_METADATA_SIZE
add rdx,gpDataMaterials
call CompareStrings
test eax,eax
jz lbl_NextMaterial

mov currentMaterial,materialIndex
jmp lbl_SkipLine

lbl_NextMaterial:
inc materialIndex
mov r11d,materialIndex
cmp r11d,gnUniqueMaterials
jl lbl_FindMaterial
mov currentMaterial,-1
jmp lbl_SkipLine

lbl_Kd:
add pCurrentSource,3 ;skip "Kd "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax
call parseFloat3 ;returns xmm0=r, xmm1=g, xmm2=b

;Store Kd in material struct
mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_KD
movss dword ptr[rax],xmm0
movss dword ptr[rax+4],xmm1
movss dword ptr[rax+8],xmm2

mov pCurrentSource,rax
jmp lbl_SkipLine

lbl_Ks:
add pCurrentSource,3 ;skip "Ks "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax
call parseFloat3

mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_KS
movss dword ptr[rax],xmm0
movss dword ptr[rax+4],xmm1
movss dword ptr[rax+8],xmm2

mov pCurrentSource,rax
jmp lbl_SkipLine

lbl_Ka:
add pCurrentSource,3 ;skip "Ka "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax
call parseFloat3

mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_KA
movss dword ptr[rax],xmm0
movss dword ptr[rax+4],xmm1
movss dword ptr[rax+8],xmm2

mov pCurrentSource,rax
jmp lbl_SkipLine

lbl_Ns:
add pCurrentSource,3 ;skip "Ns "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax
call parseFloat

mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_NS
movss dword ptr[rax],xmm0

mov pCurrentSource,rax
jmp lbl_SkipLine

lbl_d:
add pCurrentSource,2 ;skip "d "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax
call parseFloat

mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_D
movss dword ptr[rax],xmm0

;Also set Tr (1 - d)
movss xmm1,f32_1
subss xmm1,xmm0
mov eax,currentMaterial
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
add rax,OFFSET_TR
movss dword ptr[rax],xmm1

mov pCurrentSource,rax
jmp lbl_SkipLine

lbl_SkipLine:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
test al,al
jz lbl_Done
inc rcx
jmp lbl_SkipToEOL

lbl_SkipCR:
inc rcx
cmp byte ptr[rcx],0Ah
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc rcx
mov pCurrentSource,rcx
jmp lbl_NextLine

lbl_Done:
;Free temp buffer
mov rcx,hHeap
xor rdx,rdx
mov r8,pTempNameBuffer
call HeapFree

LOG_TEXT szLogMtlSuccess

call linkMaterials

;rax = value returned by linkMaterials
jmp lbl_End

;Errors

lbl_NoMaterials:
LOG_TEXT szErrNoMaterials
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseMaterials endp
