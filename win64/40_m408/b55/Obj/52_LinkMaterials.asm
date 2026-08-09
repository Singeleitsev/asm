;--------------------------------------------------------
; linkMaterials - Match OBJ material names to MTL material definitions
; Input: gpDataSubGroups (material names from OBJ)
;        gpDataMaterials (material definitions from MTL)
;        gnUniqueSubGroups, gnUniqueMaterials
; Output: gpDataSubGroups filled with material indices
;         gpMtlGroups filled with draw groups (firstIndex, indexCount, materialIndex)
;         gnMtlGroupCount = number of material groups
;--------------------------------------------------------
linkMaterials proc
LOCAL hHeap:QWORD
LOCAL subGroupIndex:DWORD, materialIndex:DWORD
LOCAL pSubGroupName:QWORD, pMaterialName:QWORD
LOCAL pCurrentMtlGroup:QWORD
LOCAL currentFirstIndex:DWORD, currentIndexCount:DWORD
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

;Log start
LOG_TEXT szLogLinkingMaterials

;Check if we have data
cmp gnUniqueSubGroups,0
jle lbl_NoSubGroups
cmp gnUniqueMaterials,0
jle lbl_NoMaterials

; STEP 1: Allocate MaterialGroup array
; Each MaterialGroup = 16 bytes (3 DWORDs: firstIndex, indexCount, materialIndex)

mov eax,gnUniqueSubGroups
mov gnMtlGroupCount,eax

; Allocate gpMtlGroups
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnUniqueSubGroups
imul r8,r8,MTL_GROUP_STRUCT_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpMtlGroups,rax
LOG_TEXT szOK

; STEP 2: Initialize material groups
; For each subgroup, store firstIndex, indexCount, materialIndex
mov rsi,gpMtlGroups
mov pCurrentMtlGroup,rsi

; Initialize counters for tracking indices
xor r8,r8
mov currentFirstIndex,r8d
mov currentIndexCount,r8d

; Loop through each subgroup
xor r11,r11
mov subGroupIndex,r11d

lbl_NextSubGroup:
; Get the subgroup name
mov eax,subGroupIndex
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups
mov pSubGroupName,rax

; Search for matching material in MTL
xor r11,r11
mov materialIndex,r11d
mov r9d,-1 ;Default material index (-1 = not found)

lbl_NextMaterial:
mov eax,materialIndex
imul eax,eax,MATERIAL_METADATA_SIZE
add rax,gpDataMaterials
mov pMaterialName,rax

; Compare names
mov rcx,pSubGroupName
mov rdx,pMaterialName
call CompareStrings
test eax,eax
jz lbl_NoMatch

; Found a match! Store material index
mov r9d,materialIndex
jmp lbl_StoreMaterialIndex

lbl_NoMatch:
inc materialIndex
mov r11d,materialIndex
cmp r11d,gnUniqueMaterials
jl lbl_NextMaterial

; If no match found, use default material (0)
mov r9d,0

lbl_StoreMaterialIndex:
; Store material index in subgroup metadata
mov eax,subGroupIndex
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups
add rax,OFFSET_SUBGROUP_MATERIALS_POINTER
mov dword ptr[rax],r9d

; Also store the material count (1 per subgroup)
add rax,4
mov dword ptr[rax],1

; Add to MaterialGroup array
; Get the vertex/index counts for this subgroup
mov eax,subGroupIndex
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups

; Get vertices count (each face contributes 3 indices)
add rax,OFFSET_SUBGROUP_FACES_COUNT
mov ebx,dword ptr[rax]  ; number of faces
imul ebx,ebx,3          ; each face = 3 indices

; Store currentFirstIndex (start of this group in global index buffer)
mov rsi,pCurrentMtlGroup
mov eax,currentFirstIndex
mov dword ptr[rsi],eax               ; firstIndex

; Store indexCount (number of indices in this group)
mov dword ptr[rsi+4],ebx             ; indexCount

; Store materialIndex
mov dword ptr[rsi+8],r9d             ; materialIndex

; Advance to next MaterialGroup
add pCurrentMtlGroup,MTL_GROUP_STRUCT_SIZE

; Update currentFirstIndex for next group
add currentFirstIndex,ebx

; Log the link
LOG_TEXT szLogLinkingMaterial
mov rcx,pSubGroupName
call WriteLog
LOG_TEXT szLogTo
mov rcx,pMaterialName
call WriteLog
LOG_TEXT szCRLF

inc subGroupIndex
mov r11d,subGroupIndex
cmp r11d,gnUniqueSubGroups
jl lbl_NextSubGroup

; Report success
LOG_TEXT szLogLinkingSuccess
mov rcx,subGroupIndex
call WriteDecimalToLog
LOG_TEXT szLogMaterialsLinked
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoSubGroups:
LOG_TEXT szErrNoSubGroups
mov rax,1
jmp lbl_End

lbl_NoMaterials:
LOG_TEXT szErrNoMaterials
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
linkMaterials endp

