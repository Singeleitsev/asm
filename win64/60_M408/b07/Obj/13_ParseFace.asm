;-----------------------------------------------------------------------------
; ParseFace - Parse a face line with vertex/triplets (v/vt/vn) with negative indices
; Input:  RSI points after "f " (first digit of first vertex index)
; Output: Fills gpIndices, increments dwIndexCount
;-----------------------------------------------------------------------------
parseFace proc
PROLOG 100h

;Initialize Counter
;mov dwFaceCount,0

;Skip "f "
add rsi,2

;Three vertices per face
 mov ecx, 3                     

lbl_ParseVertexGroup:
    ; ---------- Parse vertex index (signed) ----------
    call ParseSignedInt            ; returns EAX = signed value, RSI advanced
    test eax, eax
    jz  lbl_SkipGroup              ; if zero (shouldn't happen) skip line
    mov ebx, eax                   ; save vertex index (signed)

    ; ---------- Check for slash ----------
    cmp byte ptr [rsi], 2Fh
    jne lbl_NoNormals              ; no normals -> not handled (but your file has them)

    ; Skip first slash
    inc rsi

    ; ---------- Parse texture index (signed, but ignored) ----------
    cmp byte ptr [rsi], 2Fh
    je  lbl_DoubleSlash            ; v//n > no texture

    ; Parse texture index (we just skip the digits, but need to handle sign)
    call ParseSignedInt            ; returns value in EAX, ignored
    ; Now RSI points to the slash after the texture index
    cmp byte ptr [rsi], 2Fh
    jne lbl_SkipGroup              ; malformed
    inc rsi                        ; skip slash

lbl_DoubleSlash:
    ; Already skipped the second slash if it was present, else after texture slash we are here
    ; Now parse normal index (signed)
    call ParseSignedInt            ; returns EAX = signed normal index
    test eax, eax
    jz  lbl_SkipGroup              ; safety

    ; ---------- Convert negative indices to absolute ----------
    ;Vertex index conversion
    xor rcx,rcx
    mov ecx,ebx
    cmp ecx,0
    jge lbl_VtxAbs
    ;negative: absolute = dwPosCount + index (index is negative)
    add ecx, gnCurrentVertexCount
lbl_VtxAbs:
    cmp ebx, 0
    jg  lbl_PosVtx
    ;negative: absolute = dwPosCount + ebx (ebx negative)
    mov eax, gnCurrentVertexCount
    add eax, ebx ;now eax is 0-based? Example: count=10, ebx=-1 -> 9 correct.
    jmp lbl_VtxDone
lbl_PosVtx:
    mov eax,ebx
    dec eax ;1-based -> 0-based
lbl_VtxDone:
    mov ebx,eax ;store final vertex index (0-based)

    ; Normal index conversion
    mov ecx,eax                   ; normal index from ParseSignedInt (signed)
    cmp ecx,0
    jg  lbl_PosNorm
    ; negative: absolute = dwNormCount + ecx
    mov eax,gnCurrentNormalCount
    add eax,ecx
    jmp lbl_NormDone
lbl_PosNorm:
    mov eax,ecx
    dec eax
lbl_NormDone:
    mov edx,eax ;normal index (0-based)

    ;Add combined vertex
    mov ecx, ebx                   ;posIdx (0-based)
    call FindOrAddCombinedVertex   ;returns EAX = combined index

    ; Store in index array
    mov rdi, gpObjIndices
    mov ecx, gnCurrentIndexCount
    mov dword ptr [rdi + rcx*4], eax
    inc gnCurrentIndexCount

    ;Skip spaces between vertex groups
lbl_SkipGroupSpace:
    cmp byte ptr [rsi], 20h
    je  lbl_SkipGroupSpace_Inc
    cmp byte ptr [rsi], 09h
    jne lbl_SkipGroupSpace_Done
lbl_SkipGroupSpace_Inc:
    inc rsi
    jmp lbl_SkipGroupSpace
lbl_SkipGroupSpace_Done:
    dec ecx
    jnz lbl_ParseVertexGroup

    ; All three groups parsed – skip rest of line (if any)
    jmp lbl_ParseFace_End

lbl_NoNormals:
    jmp lbl_SkipGroup

lbl_SkipGroup:
    ; On error, skip the entire line
    jmp lbl_ParseFace_End

lbl_ParseFace_End:
EPILOG
parseFace endp