;-----------------------------------------------------------------------------
; ParseFace - Parse a face line with vertex/triplets (v/vt/vn) with negative indices
; Input:  RSI points after "f " (first digit of first vertex index)
; Output: Fills gpIndices, increments dwIndexCount
;-----------------------------------------------------------------------------
parseFace proc
LOCAL counter:DWORD,index:DWORD

PROLOG 100h

;Initialize Counter
;mov dwFaceCount,0

;Skip "f "
add rsi,2

;Three vertices per face
mov counter,3

lbl_ParseVertexGroup:
;Parse vertex index (signed)
call ParseSignedInt ;returns EAX = signed value, RSI advanced
test eax,eax
jz  lbl_SkipGroup ;if zero (shouldn't happen) skip line
mov index,eax ;save vertex index (signed)

;Check for slash
cmp byte ptr[rsi],2Fh
jne lbl_NoNormals ;no normals -> not handled (but your file has them)

;Skip first slash
inc rsi

; Check for double slash (v//n format)
cmp byte ptr[rsi],2Fh
je lbl_DoubleSlash

;Parse texture index (we just skip the digits, but need to handle sign)
call ParseSignedInt ;returns value in EAX, ignored

;Now RSI points to the slash after the texture index
cmp byte ptr[rsi], 2Fh
jne lbl_SkipGroup ;malformed
inc rsi ;skip slash
jmp lbl_ParseNormal

lbl_DoubleSlash:
inc rsi

lbl_ParseNormal:
;Now parse normal index (signed)
call ParseSignedInt ;returns EAX = signed normal index
test eax,eax
jz lbl_SkipGroup ;safety

;Convert negative indices to absolute
cmp index,0
jg lbl_PosVtx

;negative: absolute = dwPosCount + index (index is negative)
xor rcx,rcx
mov ecx,gnCurrentVertexCount
add index,ecx
jmp lbl_ParseNorm

lbl_PosVtx:
dec index ;1-based -> 0-based

lbl_ParseNorm:
;Normal index conversion
cmp eax,0 ;normal index from ParseSignedInt (signed)
jg lbl_PosNorm

;negative: absolute = dwNormCount + ecx
add eax,gnCurrentNormalCount
jmp lbl_NormDone

lbl_PosNorm:
dec eax ;1-based -> 0-based

lbl_NormDone:
mov edx,eax ;normal index (0-based)

;Add combined vertex
mov ecx,index
call FindOrAddCombinedVertex   ;returns EAX = combined index

; Store in index array
mov rdi,gpObjIndices
xor rcx,rcx
mov ecx,gnCurrentIndexCount
mov dword ptr [rdi + rcx*4], eax
inc gnCurrentIndexCount

;Skip spaces between vertex groups
lbl_SkipGroupSpace:
cmp byte ptr [rsi],20h
je  lbl_SkipGroupSpace_Inc
cmp byte ptr [rsi],9h
jne lbl_SkipGroupSpace_Done

lbl_SkipGroupSpace_Inc:
inc rsi
jmp lbl_SkipGroupSpace

lbl_SkipGroupSpace_Done:
dec counter
cmp counter,0
jne lbl_ParseVertexGroup

;All three groups parsed – skip rest of line (if any)
jmp lbl_ParseFace_End

lbl_NoNormals:
jmp lbl_SkipGroup

lbl_SkipGroup:
;On error, skip the entire line
jmp lbl_ParseFace_End

lbl_ParseFace_End:
EPILOG
parseFace endp
