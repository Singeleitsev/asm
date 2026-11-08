parseMtlFile proc
LOCAL hHeap:QWORD, pMat:QWORD
LOCAL token:QWORD, value:QWORD
PROLOG 100h

LOG_TEXT szLogMtlLoad

;1. Open the file
call openMtlFile
cmp rax,1
jne lbl_parseMtlFile_End
LOG_TEXT szLogMtlOpened
mov rcx,gnMtlFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2. Get the Required RAM size
call getReqMtlRAM
cmp rax,1
jne lbl_parseMtlFile_End

;3. Allocate the memory
call allocMtlRAM
cmp rax,1
jne lbl_parseMtlFile_End

;4. Initialize counters
mov gnCurrentMaterialIndex,-1

;5. Parse loop
mov rcx,gpMtlDataStart
mov gpMtlDataCurrent,rcx
mov rdi,gpMtlDataEnd

lbl_Mtl_NextLine:
mov rcx,gpMtlDataCurrent
cmp rcx,gpMtlDataEnd
jge lbl_Mtl_EndOfFile

;Skip whitespace and comments
mov al,byte ptr[rcx]
cmp al,9 ;Tab
je lbl_Mtl_NextCharacter
cmp al,20h ;Space
je lbl_Mtl_NextCharacter
cmp al,0Ah ;Line Feed
je lbl_Mtl_SkipToEndOfLine
cmp al,0Dh ;Carriage Return
je lbl_Mtl_SkipToEndOfLine
cmp al,23h ;#
je lbl_Mtl_SkipToEndOfLine
cmp al,0
je lbl_Mtl_EndOfFile

;Token detection
cmp dword ptr[rcx],6D77656Eh ;"newm" in reverse order - part of "newmtl"
je lbl_tokenNewMtl
cmp word ptr[rcx],644Bh ;"Kd" in reverse order
je lbl_TokenDiffuse
cmp word ptr[rcx],734Bh ;"Ks" in reverse order
je lbl_TokenSpecular
cmp word ptr[rcx],614Bh ;"Ka" in reverse order
je lbl_TokenAmbient
cmp word ptr[rcx],734Eh ;"Ns" in reverse order
je lbl_TokenShininess
cmp word ptr[rcx],2064h ;"d " in reverse order
je lbl_TokenDissolve
cmp word ptr[rcx],7254h ;"Tr" in reverse order
je lbl_TokenTransparency
cmp word ptr[rcx],7250h ;"Pr" in reverse order
je lbl_TokenRoughness
cmp word ptr[rcx],6D50h ;"Pm" in reverse order
je lbl_TokenMetallic
cmp word ptr[rcx],6654h ;"Tf" in reverse order
je lbl_TokenTransmissionFilter
jmp lbl_Mtl_SkipToEndOfLine



;Parse material: "newmtl"
lbl_tokenNewMtl:
call parseMtlName
jmp lbl_Mtl_SkipToEndOfLine

;"Kd"
lbl_TokenDiffuse:
add rcx,2 ;Skip "Kd"
call parseFloat3 ;returns 3 floats in xmm0, xmm1, xmm2
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_KD],xmm0 ;r
movss dword ptr[r14+OFFSET_KD+4],xmm1 ;g
movss dword ptr[r14+OFFSET_KD+8],xmm2 ;b
jmp lbl_Mtl_SkipToEndOfLine

;"Ks"
lbl_TokenSpecular:
add rcx,2 ;Skip "Ks"
call parseFloat3
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_KS],xmm0
movss dword ptr[r14+OFFSET_KS+4],xmm1
movss dword ptr[r14+OFFSET_KS+8],xmm2
jmp lbl_Mtl_SkipToEndOfLine

;"Ka"
lbl_TokenAmbient:
add rcx,2 ;Skip "Ka"
call parseFloat3
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_KA],xmm0
movss dword ptr[r14+OFFSET_KA+4],xmm1
movss dword ptr[r14+OFFSET_KA+8],xmm2
jmp lbl_Mtl_SkipToEndOfLine

;"Ns"
lbl_TokenShininess:
add rcx,2 ;Skip "Ns"
call parseFloat
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_NS],xmm0
jmp lbl_Mtl_SkipToEndOfLine

;"d"
lbl_TokenDissolve:
inc rcx ;Skip "d"
call parseFloat
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_D],xmm0
jmp lbl_Mtl_SkipToEndOfLine

;"Tr"
lbl_TokenTransparency:
add rcx,2 ;Skip "Tr"
call parseFloat
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_TR], xmm0
jmp lbl_Mtl_SkipToEndOfLine

;"Pr"
lbl_TokenRoughness:
add rcx,2 ;Skip "Pr"
call parseFloat
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_PR],xmm0
jmp lbl_Mtl_SkipToEndOfLine

;"Pm"
lbl_TokenMetallic:
add rcx,2 ;Skip "Pm"
call parseFloat
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_PM],xmm0
jmp lbl_Mtl_SkipToEndOfLine

;"Tf"
lbl_TokenTransmissionFilter:
add rcx,2 ;Skip "Tf"
call parseFloat3
mov gpMtlDataCurrent,rax
xor r14,r14
mov r14d,gnCurrentMaterialIndex
imul r14d,r14d,MTL_STRUCT_SIZE
add r14,gpMaterials
movss dword ptr[r14+OFFSET_TF],xmm0
movss dword ptr[r14+OFFSET_TF+4],xmm1
movss dword ptr[r14+OFFSET_TF+8],xmm2
jmp lbl_Mtl_SkipToEndOfLine



;Next Byte
lbl_Mtl_NextCharacter:
inc gpMtlDataCurrent
jmp lbl_Mtl_NextLine

;EOL
lbl_Mtl_SkipToEndOfLine:
mov rcx,gpMtlDataCurrent
cmp rcx,gpMtlDataEnd
jge lbl_Mtl_EndOfFile
mov al,byte ptr[rcx]
cmp al,0Ah ;LF
je lbl_Mtl_SkipLF
cmp al,0Dh ;CR
je lbl_Mtl_SkipCR
inc rcx
mov gpMtlDataCurrent,rcx
jmp lbl_Mtl_SkipToEndOfLine

lbl_Mtl_SkipCR:
inc gpMtlDataCurrent
mov rcx,gpMtlDataCurrent
cmp byte ptr[rcx],0Ah ;LF
je lbl_Mtl_SkipLF
jmp lbl_Mtl_NextLine

lbl_Mtl_SkipLF:
inc gpMtlDataCurrent
jmp lbl_Mtl_NextLine

;EOF
lbl_Mtl_EndOfFile:
;Log materials
LOG_TEXT szLogMaterials
xor rcx,rcx
mov ecx,gnMtlCount
call WriteDecimalToLog
LOG_TEXT szCRLF

;6. Cleanup
mov rcx,gpMtlDataStart
call UnmapViewOfFile
mov rcx,ghMtlMapping
call CloseHandle
mov rcx,ghMtlFile
call CloseHandle

LOG_TEXT szLogMtlSuccess
;jmp lbl_parseMtlFile_End

lbl_parseMtlFile_End:
EPILOG
parseMtlFile endp

