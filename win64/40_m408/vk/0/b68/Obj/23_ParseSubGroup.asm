;-----------------------------------------------------------------
; parseSubGroup - Parse a usemtl block, storing faces with subgroup index
; Input:  RCX = source pointer (after "usemtl name")
; Output: RAX = updated source pointer
; Side effects: Stores faces with subgroup index in gpDataFaces
;-----------------------------------------------------------------
parseSubGroup proc
    LOCAL pCurrentSubGroup:QWORD
    LOCAL subGroupIndex:DWORD
    LOCAL pCurrentFace:QWORD
    PROLOG 100h

LOG_TEXT szParsingSubGroup

    ;--- Get current subgroup pointer and index ---
    mov rsi, rcx                ; Source pointer after "usemtl"
    mov rdi, pCurrentSubGroup   ; Pointer to current subgroup metadata
    
    ;--- Store subgroup name from source ---
    mov rcx, rsi
    mov rdx, rdi                ; Destination = subgroup name field
    add rdx, OFFSET_SUBGROUP_NAME
    call parseString            ; RAX = updated pointer after name
    mov rsi, rax

    ;--- Get subgroup index (from pCurrentSubGroup) ---
    mov rax, pCurrentSubGroup
    sub rax, gpDataSubGroups    ; Offset from base
    mov edx, SUBGROUP_METADATA_SIZE
    xor rdx, rdx                ; Clear high bits
    div edx                     ; EAX = subgroup index
    mov subGroupIndex, eax

    ;--- Store parent index in subgroup metadata ---
    ; We need to know which group this subgroup belongs to
    ; For now, store -1 (will be set later)
    mov rdi, pCurrentSubGroup
    mov dword ptr [rdi + OFFSET_SUBGROUP_PARENT_INDEX], -1

    ;--- Now parse all faces until next usemtl or end of file ---
    mov pCurrentFace, rsi

lbl_ParseFaces:

    ; Skip whitespace
    ;SKIP_WHITESPACES_SSE ;<---

    mov rsi, rcx

    ; Check for end of file
    cmp rsi, gpObjDataEnd
    jge lbl_Done

    ; Check for another usemtl (we're done with this subgroup)
    cmp dword ptr [rsi], 6D657375h  ; "usem" in little-endian
    je lbl_Done

    ; Check for 'f' token (face)
    cmp byte ptr [rsi], 66h          ; 'f'
    jne lbl_SkipLine

    ; Check for space after 'f'
    mov al, byte ptr [rsi + 1]
    cmp al, 20h                      ; space
    jne lbl_SkipLine
    cmp al, 09h                      ; tab
    jne lbl_SkipLine

    ;--- Parse face ---
    add rsi, 2                       ; Skip "f "

;-->    call parseFaceWithSubGroup       ; Parse face with subgroup index

    mov rcx, rax                     ; Continue from updated pointer
    jmp lbl_ParseFaces

lbl_SkipLine:
    ; Find end of line
    mov rcx, rsi
lbl_FindLF:
    cmp byte ptr [rcx], 0Ah          ; LF
    je lbl_NextLine
    cmp byte ptr [rcx], 0Dh          ; CR
    je lbl_NextLine
    cmp rcx, gpObjDataEnd
    jge lbl_Done
    inc rcx
    jmp lbl_FindLF

lbl_NextLine:
    inc rcx
    jmp lbl_ParseFaces

lbl_Done:
    ; Advance to next subgroup
    add pCurrentSubGroup, SUBGROUP_METADATA_SIZE

    mov rax, rsi
    jmp lbl_End

lbl_End:
    EPILOG
    ret
parseSubGroup endp
