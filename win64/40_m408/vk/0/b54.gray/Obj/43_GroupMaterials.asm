;-----------------------------------------------------------------
; GroupMaterials - Group faces by material and sort index buffer
; Input:  gpObjIndices, gnCurrentIndexCount, gpMtlFace
; Output: gpMtlGroups, gnMtlGroupCount, gpObjIndices (reordered)
;-----------------------------------------------
GroupMaterials proc
    LOCAL hHeap:QWORD, tempArray:QWORD, faceOrder:QWORD, newIndices:QWORD
    PROLOG 100h

    LOG_TEXT szLogGroupingMaterials

    ; ---- Checks ----
    cmp gnCurrentIndexCount, 0
    je lbl_GroupMaterials_End
    cmp gnMtlCount, 0
    je lbl_GroupMaterials_End

    ; ---- Get heap ----
    call GetProcessHeap
    test rax, rax
    jz lbl_GroupMaterials_End
    mov hHeap, rax

    ; ---- Compute face count ----
    xor rax, rax
    mov eax, gnCurrentIndexCount
    xor rdx, rdx
    mov ebx, 3
    div ebx                    ; EAX = number of faces
    mov r12d, eax              ; store faceCount in r12d (preserved)

    ; ---- Allocate tempArray (face counts per material) ----
    mov rcx, hHeap
    mov rdx, 8                     ; HEAP_ZERO_MEMORY
    xor r8, r8
    mov r8d, gnMtlCount
    shl r8, 2                      ; *4 bytes
    call HeapAlloc
    test rax, rax
    jz lbl_GroupMaterials_End
    mov tempArray, rax

    ; ---- Count faces per material ----
    mov rsi, gpMtlFace
    mov ecx, r12d                  ; faceCount
    mov rdi, tempArray
lbl_CountLoop:
    mov eax, dword ptr [rsi]
    add dword ptr [rdi + rax*4], 1
    add rsi, 4
    dec ecx
    jnz lbl_CountLoop

    ; ---- Allocate faceOrder array (size = faceCount * 4) ----
    mov rcx, hHeap
    mov rdx, 8
    xor r8, r8
    mov eax, r12d
    shl rax, 2                     ; *4
    mov r8, rax
    call HeapAlloc
    test rax, rax
    jz lbl_GroupMaterials_End
    mov faceOrder, rax

    ; ---- Allocate new index buffer (size = gnCurrentIndexCount * 4) ----
    mov rcx, hHeap
    mov rdx, 8
    xor r8, r8
    mov eax, gnCurrentIndexCount
    shl rax, 2
    mov r8, rax
    call HeapAlloc
    test rax, rax
    jz lbl_GroupMaterials_End
    mov newIndices, rax

    ; ---- Sort faces by material (fill faceOrder) ----
    xor r10, r10                  ; position in faceOrder
    xor r11, r11                  ; current material index (0..gnMtlCount-1)
    mov rdi, faceOrder            ; <<<<<<<<<<<<<<<< CRITICAL FIX: set RDI to faceOrder

lbl_SortByMaterial:
    ; For each material, scan all faces
    mov rsi, gpMtlFace            ; reset to start
    xor rcx, rcx                  ; face index counter

lbl_ScanFaces:
    cmp ecx, r12d                 ; compare against faceCount
    jge lbl_NextMaterial
    mov eax, dword ptr [rsi]      ; material of this face
    cmp eax, r11d
    jne lbl_SkipFace
    ; Store this face's original index (rcx) in faceOrder at position r10
    mov dword ptr [rdi + r10*4], ecx
    inc r10
lbl_SkipFace:
    add rsi, 4
    inc rcx
    jmp lbl_ScanFaces

lbl_NextMaterial:
    inc r11
    cmp r11d, gnMtlCount
    jl lbl_SortByMaterial

    ; ---- Build sorted index buffer ----
    xor r10, r10                  ; current write position in newIndices (in DWORDs)
    mov rdi, newIndices
    mov rsi, faceOrder
    mov ecx, r12d                 ; faceCount

lbl_CopyIndices:
    mov eax, dword ptr [rsi]      ; original face index
    ; copy three indices from original gpObjIndices at position face*3
    mov rbx, rax
    imul rbx, 3                   ; face index * 3
    shl rbx, 2                    ; *4 (byte offset)
    add rbx, gpObjIndices         ; pointer to first index of this face

    ; copy 3 DWORDs
    mov eax, dword ptr [rbx]
    mov dword ptr [rdi + r10*4], eax
    mov eax, dword ptr [rbx+4]
    mov dword ptr [rdi + r10*4 + 4], eax
    mov eax, dword ptr [rbx+8]
    mov dword ptr [rdi + r10*4 + 8], eax

    add r10, 3
    add rsi, 4
    dec ecx
    jnz lbl_CopyIndices

    ; ---- Free old index buffer and replace with sorted one ----
    mov rcx, hHeap
    xor rdx, rdx                  ; <<<<<< FIX: flags = 0
    mov r8, gpObjIndices          ; <<<<<< FIX: pointer in R8
    call HeapFree
    mov rax, newIndices
    mov gpObjIndices, rax

    ; ---- Free faceOrder (no longer needed) ----
    mov rcx, hHeap
    xor rdx, rdx                  ; flags = 0
    mov r8, faceOrder
    call HeapFree

    ; ---- Rebuild groups (now contiguous) ----
    mov rcx, hHeap
    mov rdx, 8
    xor r8, r8
    mov r8d, gnMtlCount
    imul r8, r8, MTL_GROUP_STRUCT_SIZE
    call HeapAlloc
    test rax, rax
    jz lbl_GroupMaterials_End
    mov gpMtlGroups, rax

    ; Build groups using the sorted index buffer
    xor r10, r10                  ; current offset in index buffer (in DWORDs)
    xor r11, r11                  ; material index
    xor r13, r13                  ; group count (use r13d to avoid overwriting faceCount)
    mov rsi, gpMtlGroups
    mov rdi, tempArray

lbl_BuildGroups:
    mov eax, [rdi + r11*4]        ; face count for this material
    test eax, eax
    jz lbl_SkipGroup
    ; Write group
    mov [rsi], r10d               ; firstIndex (in DWORDs)
    mov ebx, eax
    imul ebx, 3
    mov [rsi+OFFSET_MTL_GROUP_INDEX_COUNT], ebx
    mov [rsi+OFFSET_MTL_GROUP_MATERIAL_INDEX], r11d
    add r10d, ebx
    add rsi, MTL_GROUP_STRUCT_SIZE
    inc r13
lbl_SkipGroup:
    inc r11
    cmp r11d, gnMtlCount
    jl lbl_BuildGroups

    mov gnMtlGroupCount, r13d

    ; ---- Log groups ----
    LOG_TEXT szLogMaterialGroups
    mov ecx, gnMtlGroupCount
    call WriteDecimalToLog
    LOG_TEXT szCRLF

    ; ---- Cleanup tempArray ----
    mov rcx, hHeap
    xor rdx, rdx
    mov r8, tempArray
    call HeapFree

lbl_GroupMaterials_End:
    EPILOG
GroupMaterials endp