;----------------------------------------------------------------------
; FindOrAddCombinedVertex - Find existing or add new combined vertex
; Input:  EAX = v_ref (1-based, can be negative)
;         EBX = vt_ref (1-based, 0 if none)
;         ECX = vn_ref (1-based, 0 if none)
;         R12 = base pointer to combined vertex array (48 bytes each)
;         R13 = current combined vertex count (in/out)
; Output: EAX = combined vertex index
;----------------------------------------------------------------------
FindOrAddCombinedVertex proc
    LOCAL v_ptr:QWORD, vt_ptr:QWORD, vn_ptr:QWORD
    LOCAL color_r:REAL4, color_g:REAL4, color_b:REAL4, color_a:REAL4
    PROLOG 30h

    ;--- Resolve v_ref to pointer ---
    mov v_ptr, 0
    test eax, eax
    jz lbl_NoV
    cmp eax, 0
    jg @f
    add eax, gnTotalVertices
    inc eax
    @@:
    dec eax
    mov edx, 12
    mul edx
    add rax, gpDataVertices
    mov v_ptr, rax

lbl_NoV:
    ;--- Resolve vn_ref to pointer ---
    mov vn_ptr, 0
    test ecx, ecx
    jz lbl_NoVN
    cmp ecx, 0
    jg @f
    add ecx, gnTotalNormals
    inc ecx
    @@:
    dec ecx
    mov eax, ecx
    mov edx, 12
    mul edx
    add rax, gpDataNormals
    mov vn_ptr, rax

lbl_NoVN:
    ;--- Resolve vt_ref to pointer ---
    mov vt_ptr, 0
    test ebx, ebx
    jz lbl_NoVT
    cmp ebx, 0
    jg @f
    add ebx, gnTotalTextureVectors
    inc ebx
    @@:
    dec ebx
    mov eax, ebx
    mov edx, 12
    mul edx
    add rax, gpDataTextureVectors
    mov vt_ptr, rax

lbl_NoVT:
    ;--- Linear search through existing combined vertices ---
    xor r11d, r11d           ; Index counter
    mov r14, r12             ; Combined vertex array base

lbl_Search:
    cmp r11d, r13d
    jge lbl_AddNew

    ; Calculate pointer to current combined vertex (48 bytes each)
    mov r15, r14
    imul rax, r11, VERTEX_STRIDE
    add r15, rax

    ; Compare position (12 bytes at offset 0)
    mov rsi, v_ptr
    mov rdi, r15
    mov rcx, 3
    repe cmpsd
    jne lbl_Next

    ; Compare normal (12 bytes at offset 12)
    mov rsi, vn_ptr
    test rsi, rsi
    jz lbl_CheckTexture
    mov rdi, r15
    add rdi, VERTEX_NORMAL_OFFSET
    mov rcx, 3
    repe cmpsd
    jne lbl_Next

lbl_CheckTexture:
    ; Compare texture (8 bytes at offset 24)
    mov rsi, vt_ptr
    test rsi, rsi
    jz lbl_Found
    mov rdi, r15
    add rdi, VERTEX_UV_OFFSET
    mov rcx, 2
    repe cmpsd
    jne lbl_Next

lbl_Found:
    mov eax, r11d
    jmp lbl_End

lbl_Next:
    inc r11d
    jmp lbl_Search

lbl_AddNew:
    ; Calculate write position
xor r11,r11
    mov r11d, r13d
    imul r11, r11, VERTEX_STRIDE
    add r11, r14             ; Write position
    
    ; Copy position (12 bytes at offset 0)
    mov rsi, v_ptr
    mov rdi, r11
    movsd
    movsd
    movsd
    
    ; Copy normal (12 bytes at offset 12)
    mov rsi, vn_ptr
    test rsi, rsi
    jz @f
    mov rdi, r11
    add rdi, VERTEX_NORMAL_OFFSET
    movsd
    movsd
    movsd
    jmp lbl_CopyTexture
    @@:
    ; Zero out normal
    mov rdi, r11
    add rdi, VERTEX_NORMAL_OFFSET
    xor eax, eax
    stosd
    stosd
    stosd

lbl_CopyTexture:
    ; Copy texture (8 bytes at offset 24)
    mov rsi, vt_ptr
    test rsi, rsi
    jz @f
    mov rdi, r11
    add rdi, VERTEX_UV_OFFSET
    movsd
    movsd
    jmp lbl_CopyColor
    @@:
    ; Zero out texture
    mov rdi, r11
    add rdi, VERTEX_UV_OFFSET
    xor eax, eax
    stosd
    stosd

lbl_CopyColor:
    ; Copy vertex color (16 bytes at offset 32)
    ; Default: white (1.0, 1.0, 1.0, 1.0)
    mov rdi, r11
    add rdi, VERTEX_COLOR_OFFSET
    mov eax, 3F800000h       ; 1.0f
    stosd                     ; R
    stosd                     ; G
    stosd                     ; B
    stosd                     ; A

lbl_DoneAdd:
    mov eax, r13d            ; Return current count
    inc r13d                 ; Increment global count

lbl_End:
    EPILOG
    ret
FindOrAddCombinedVertex endp