;-----------------------------------------------------------------
; buildMtlGroups - Full implementation with material grouping
;-----------------------------------------------------------------
buildMtlGroups proc
LOCAL hHeap:QWORD
LOCAL pCurrentFace:QWORD
LOCAL currentGroupIndex:DWORD
LOCAL currentFaceIndex:DWORD
LOCAL previousMaterialIndex:DWORD
LOCAL totalGroups:DWORD
PROLOG 100h

;1. Get heap
call GetProcessHeap
test rax, rax
jz lbl_Error
mov hHeap, rax

;2. Sanity checks
cmp gnTotalFaces, 0
jle lbl_DefaultGroup
cmp gnCurrentIndexCount, 0
jle lbl_DefaultGroup
cmp gpDataFaces, 0
je lbl_DefaultGroup
cmp gpDataSubGroups, 0
je lbl_DefaultGroup

;3. First pass: Count contiguous material groups
; Each face belongs to a subgroup (usemtl)
; We'll scan faces and count how many material changes occur

xor rbx, rbx
mov totalGroups, ebx
mov previousMaterialIndex, -1
mov rsi, gpDataFaces
mov pCurrentFace, rsi
xor rcx, rcx
mov currentFaceIndex, ecx

LOG_TEXT szLogLinkingMaterials

; For each face, determine its material
; Faces are 36 bytes each (3 vertices * 12 bytes)

lbl_CountGroups:
    ; Check if done
    mov eax, currentFaceIndex
    cmp eax, gnTotalFaces
    jge lbl_AllocateGroups

    ; Get material for this face
    ; For now, use the face index modulo number of subgroups as demo
    ; TODO: Replace with actual subgroup-to-material mapping
    mov eax, currentFaceIndex
    mov ecx, gnUniqueSubGroups
    cmp ecx, 0
    jle @f
    xor edx, edx
    div ecx
    mov eax, edx            ; EAX = subgroup index
    jmp lbl_GotMaterial
    @@:
    xor eax, eax            ; Default material
    lbl_GotMaterial:

    ; Check if material changed
    cmp eax, previousMaterialIndex
    je lbl_NextFace

    ; New material group found
    inc totalGroups
    mov previousMaterialIndex, eax

lbl_NextFace:
    inc currentFaceIndex
    add pCurrentFace, 36
    jmp lbl_CountGroups

lbl_AllocateGroups:
    ; Ensure at least one group
    cmp totalGroups, 0
    jg @f
    mov totalGroups, 1
    @@:

    mov gnMtlGroupCount, totalGroups

    ;4. Allocate MaterialGroup array
    mov rcx, hHeap
    mov rdx, 8                  ; HEAP_ZERO_MEMORY
    xor r8, r8
    mov r8d, totalGroups
    imul r8, r8, MTL_GROUP_STRUCT_SIZE
    call HeapAlloc
    test rax, rax
    jz lbl_Error
    mov gpMtlGroups, rax

    ;5. Second pass: Fill groups with face ranges
    ; Reset counters
    xor rbx, rbx
    mov currentGroupIndex, ebx
    mov previousMaterialIndex, -1
    mov rsi, gpDataFaces
    mov pCurrentFace, rsi
    xor rcx, rcx
    mov currentFaceIndex, ecx
    mov rdi, gpMtlGroups
    mov groupFirstIndex, 0

lbl_FillGroups:
    ; Check if done
    mov eax, currentFaceIndex
    cmp eax, gnTotalFaces
    jge lbl_CloseLastGroup

    ; Get material for this face (same as above)
    mov eax, currentFaceIndex
    mov ecx, gnUniqueSubGroups
    cmp ecx, 0
    jle @f
    xor edx, edx
    div ecx
    mov eax, edx
    jmp lbl_GotMaterial2
    @@:
    xor eax, eax
    lbl_GotMaterial2:

    ; Check if material changed
    cmp eax, previousMaterialIndex
    je lbl_NextFace2

    ; Close previous group (if any)
    cmp currentGroupIndex, 0
    jle @f
    ; Calculate index count for previous group
    mov ebx, currentFaceIndex
    sub ebx, groupFirstIndex
    mov [rdi + 4], ebx      ; indexCount
    add rdi, MTL_GROUP_STRUCT_SIZE
    @@:

    ; Start new group
    mov groupFirstIndex, currentFaceIndex
    mov previousMaterialIndex, eax
    mov [rdi], eax          ; materialIndex
    mov [rdi + 0], currentFaceIndex ; firstIndex (will be filled later)
    inc currentGroupIndex

lbl_NextFace2:
    inc currentFaceIndex
    add pCurrentFace, 36
    jmp lbl_FillGroups

lbl_CloseLastGroup:
    ; Close the last group
    mov ebx, gnCurrentIndexCount
    sub ebx, groupFirstIndex
    mov [rdi + 4], ebx      ; indexCount
    mov [rdi + 0], groupFirstIndex ; firstIndex

    ; Log success
    LOG_TEXT szLogMaterialsLinked
    mov rcx, totalGroups
    call WriteDecimalToLog
    LOG_TEXT szLogMaterialsLinked

    mov eax, 1
    jmp lbl_End

lbl_DefaultGroup:
    ; Create one default group with all indices
    mov gnMtlGroupCount, 1

    ; Allocate MaterialGroup array
    mov rcx, hHeap
    mov rdx, 8
    xor r8, r8
    mov r8d, 1
    imul r8, r8, MTL_GROUP_STRUCT_SIZE
    call HeapAlloc
    test rax, rax
    jz lbl_Error
    mov gpMtlGroups, rax

    ; Fill default group
    mov rsi, gpMtlGroups
    mov dword ptr [rsi], 0
    mov eax, gnCurrentIndexCount
    mov dword ptr [rsi + 4], eax
    mov dword ptr [rsi + 8], 0

    mov eax, 1
    jmp lbl_End

lbl_Error:
    xor eax, rax

lbl_End:
    EPILOG
buildMtlGroups endp




;-----------------------------------------------------------------
; FindOrAddMaterialGroup - Find or create a material group
; Input: ECX = material index
; Output: EAX = group index, or -1 if error
;-----------------------------------------------------------------
FindOrAddMaterialGroup proc
    LOCAL materialIndex:DWORD
    LOCAL groupIndex:DWORD
    PROLOG 20h

    mov materialIndex, ecx
    xor r10, r10
    mov groupIndex, r10d

    ; Search through existing groups
    mov rsi, gpMtlGroups
    mov r11d, gnMtlGroupCount

lbl_Search:
    cmp r10d, r11d
    jge lbl_AddNew

    ; Check material index in this group
    mov eax, [rsi + OFFSET_MTL_GROUP_MATERIAL_INDEX]
    cmp eax, materialIndex
    je lbl_Found

    add rsi, MTL_GROUP_STRUCT_SIZE
    inc r10d
    jmp lbl_Search

lbl_AddNew:
    ; Need to add new group
    ; For now, return -1 (will be handled by caller)
    mov eax, -1
    jmp lbl_End

lbl_Found:
    mov eax, r10d

lbl_End:
    EPILOG
    ret
FindOrAddMaterialGroup endp



;-----------------------------------------------------------------
; GetMaterialIndexForFace - Get material index for a face
; Input: RCX = face data pointer
; Output: EAX = material index, or -1 if not found
;-----------------------------------------------------------------
GetMaterialIndexForFace proc
    PROLOG 20h

    ; For now, return 0 (default material)
    ; Later: Parse subgroup name from face data
    ; Face data stores v_ref, vt_ref, vn_ref
    ; We need to map the face to its subgroup (usemtl)
    
    ; Since we don't store subgroup index per face yet,
    ; return default material for now
    
    xor eax, eax
    ret

    EPILOG
GetMaterialIndexForFace endp



;-----------------------------------------------------------------
; GetMaterialIndexFromSubGroupName - Find material by subgroup name
; Input: RCX = pointer to subgroup name
; Output: EAX = material index, or -1 if not found
;-----------------------------------------------------------------
GetMaterialIndexFromSubGroupName proc
    PROLOG 20h

    mov rsi, rcx                ; search name
    xor rax, rax
    mov r8d, gnUniqueMaterials  ; total materials

    ; Search through gpDataMaterials
    mov r9, gpDataMaterials     ; material array base
    xor r10, r10                ; index counter

lbl_Loop:
    cmp r10d, r8d
    jge lbl_NotFound

    ; Get material name from array
    mov rdi, r9
    imul r11, r10, MATERIAL_METADATA_SIZE
    add rdi, r11                ; point to material name (OFFSET_MATERIAL_NAME)

    ; Compare strings
    call CompareStrings
    test eax, eax
    jnz lbl_Found

    inc r10
    jmp lbl_Loop

lbl_Found:
    mov eax, r10
    jmp lbl_End

lbl_NotFound:
    mov eax, -1

lbl_End:
    EPILOG
GetMaterialIndexFromSubGroupName endp



