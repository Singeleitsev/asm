;-----------------------------------------------------------------
; parseIndices - Build combined vertex indices from face data
; Input: gpDataFaces (raw face data), gpDataVertices, gpDataNormals, gpDataTextureVectors
; Output: gpObjCombined, gpObjIndices, gnCurrentCombinedCount, gnCurrentIndexCount
;-----------------------------------------------------------------
parseIndices proc
PROLOG 100h

;--- Get heap for allocations ---
call GetProcessHeap
test rax, rax
jz lbl_Error
push rax                    ; Save heap handle

;--- Initialize counters ---
mov gnCurrentCombinedCount, 0
mov gnCurrentIndexCount, 0

;--- Calculate max vertices (faces * 3 triangles) ---
mov eax, gnTotalFaces
imul eax, eax, 3            ; Max 3 vertices per triangle
mov gnCurrentIndexCount, eax

;--- Allocate combined vertex array (worst case: all vertices unique) ---
; Each vertex = 3 floats pos + 3 floats normal + 2 floats texcoord = 32 bytes
; For simplicity, use the total vertices count as max
mov eax, gnTotalVertices
imul eax, eax, 32           ; 8 floats * 4 bytes = 32 bytes per combined vertex
mov rcx, [rsp]              ; Heap handle
mov rdx, 8                  ; HEAP_ZERO_MEMORY
mov r8, rax                 ; Size
call HeapAlloc
test rax, rax
jz lbl_Error
mov gpObjCombined, rax

;--- Allocate index array ---
mov eax, gnCurrentIndexCount
imul eax, eax, 4            ; DWORD indices
mov rcx, [rsp]              ; Heap handle
mov rdx, 8                  ; HEAP_ZERO_MEMORY
mov r8, rax                 ; Size
call HeapAlloc
test rax, rax
jz lbl_Error_FreeCombined
mov gpObjIndices, rax

;--- Iterate through all faces ---
mov rsi, gpDataFaces         ; RSI = current face pointer
mov rdi, gpObjIndices        ; RDI = current index write position
mov r12, gpObjCombined       ; R12 = combined vertex array base
xor r13d, r13d               ; Current combined vertex count

lbl_FaceLoop:
    ; Check if we've processed all faces
mov rcx, rsi
sub rcx, gpDataFaces      ; RCX = bytes processed

; Convert bytes to face count (36 bytes per face)
mov rax, rcx
xor rdx, rdx
mov rbx, 36
div rbx                   ; RAX = face count

cmp eax, gnTotalFaces
jge lbl_Done

    ; Read face (3 vertices, 12 bytes each = 36 bytes total)
    ; Each vertex: v_ref, vt_ref, vn_ref (DWORDs)
    
    ; Process vertex 0
    mov eax, [rsi + 0]       ; v_ref
    mov ebx, [rsi + 4]       ; vt_ref
    mov ecx, [rsi + 8]       ; vn_ref
    call FindOrAddCombinedVertex
    mov [rdi], eax           ; Store index
    add rdi, 4
    
    ; Process vertex 1
    mov eax, [rsi + 12]      ; v_ref
    mov ebx, [rsi + 16]      ; vt_ref
    mov ecx, [rsi + 20]      ; vn_ref
    call FindOrAddCombinedVertex
    mov [rdi], eax
    add rdi, 4
    
    ; Process vertex 2
    mov eax, [rsi + 24]      ; v_ref
    mov ebx, [rsi + 28]      ; vt_ref
    mov ecx, [rsi + 32]      ; vn_ref
    call FindOrAddCombinedVertex
    mov [rdi], eax
    add rdi, 4
    
    ; Move to next face
    add rsi, 36              ; 3 vertices * 12 bytes
    jmp lbl_FaceLoop

lbl_Done:
    ; Store final counts
    mov gnCurrentCombinedCount, r13d
    
    ; Log results
    LOG_TEXT szLogIndicesCount
xor rcx,rcx
    mov ecx, gnCurrentIndexCount
    call WriteDecimalToLog
    LOG_TEXT szCRLF
    
    ; Free heap handle
    pop rcx
    mov rax, 1
    jmp lbl_End

lbl_Error_FreeCombined:
    mov rcx, [rsp]           ; Heap handle
    xor rdx, rdx
    mov r8, gpObjCombined
    call HeapFree
    jmp lbl_Error

lbl_Error:
    pop rcx                  ; Clean up heap handle
    xor rax, rax
    jmp lbl_End

lbl_End:
    EPILOG
parseIndices endp
