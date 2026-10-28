;--------------------------------------------------------------------------
; parseFace - Parse face line, store RAW references in gpDataFaces
; Input:  RCX = source pointer (points after "f ")
; Output: RAX = updated source pointer
; Side effects: Stores up to 3 or 4 vertex refs in pCurrentFace
;               Advances pCurrentFace by 36 or 48 bytes
;--------------------------------------------------------------------------
parseFace proc
LOCAL pCurrentFace:QWORD
LOCAL vertexCount:DWORD
LOCAL v_ref:DWORD
LOCAL vt_ref:DWORD
LOCAL vn_ref:DWORD

PROLOG 100h

LOG_TEXT szParsingFaces

; --- Initialize ---
mov pCurrentFace, 0
mov vertexCount, 0
mov rsi, rcx                     ; RSI = current source pointer

; --- Main Loop: Parse up to 4 vertex refs (quads) ---
lbl_ParseVertex:
    cmp rsi, gpObjDataEnd
    jge lbl_Done

    ; Parse v_ref (signed integer)
    mov rcx, rsi
    call ParseSignedInt           ; Returns EAX = v_ref, RCX = updated pointer
    mov v_ref, eax
    mov rsi, rcx

    ; --- Check for texture ---
    cmp byte ptr [rsi], 2Fh       ; '/'
    jne lbl_NoTexture

    ; --- Has texture: skip '/' ---
    inc rsi

    ; --- Check for double slash (v//n) ---
    cmp byte ptr [rsi], 2Fh       ; '/'
    je lbl_DoubleSlash

    ; --- Parse vt_ref (texture) ---
    mov rcx, rsi
    call ParseSignedInt           ; Returns EAX = vt_ref
    mov vt_ref, eax
    mov rsi, rcx

    ; --- Check for normal ---
    cmp byte ptr [rsi], 2Fh       ; '/'
    jne lbl_NoNormal

    ; --- Parse vn_ref (normal) ---
    inc rsi                       ; Skip '/'
    mov rcx, rsi
    call ParseSignedInt           ; Returns EAX = vn_ref
    mov vn_ref, eax
    mov rsi, rcx

    jmp lbl_StoreRef

lbl_DoubleSlash:
    ; --- Format: v//n ---
    inc rsi                       ; Skip second '/'
    mov vt_ref, 0                 ; No texture
    mov rcx, rsi
    call ParseSignedInt           ; Returns EAX = vn_ref
    mov vn_ref, eax
    mov rsi, rcx
    jmp lbl_StoreRef

lbl_NoTexture:
    ; --- Format: v only (no texture, no normal) ---
    mov vt_ref, 0
    mov vn_ref, 0
    jmp lbl_StoreRef

lbl_NoNormal:
    ; --- Format: v/vt only (no normal) ---
    mov vn_ref, 0

lbl_StoreRef:
    ; --- Store the three raw references ---
    mov rdx, pCurrentFace
    mov eax, v_ref
    mov dword ptr [rdx], eax      ; v_ref (raw, 1-based, can be negative)
    mov eax, vt_ref
    mov dword ptr [rdx + 4], eax  ; vt_ref (raw, 0 if none)
    mov eax, vn_ref
    mov dword ptr [rdx + 8], eax  ; vn_ref (raw, 0 if none)

    add pCurrentFace, 12          ; Next vertex ref
    inc vertexCount

    ; --- Skip spaces/tabs between vertex groups ---
lbl_SkipSpace:
    cmp byte ptr [rsi], 20h       ; Space
    je lbl_SkipSpace_Inc
    cmp byte ptr [rsi], 9         ; Tab
    je lbl_SkipSpace_Inc
    cmp byte ptr [rsi], 0Ah       ; LF (end of line)
    je lbl_Done
    cmp byte ptr [rsi], 0Dh       ; CR (end of line)
    je lbl_Done
    jmp lbl_NextVertex

lbl_SkipSpace_Inc:
    inc rsi
    jmp lbl_SkipSpace

lbl_NextVertex:
    ; --- Check if we have more vertices (max 4 for quads) ---
    cmp vertexCount, 4
    jl lbl_ParseVertex

    ; --- If we have 4 vertices, it's a quad > split into 2 triangles ---
    ; Face buffer currently has 4 refs: [0][1][2][3]
    ; Triangle 1: [0][1][2] (already stored)
    ; Triangle 2: [0][2][3] > need to copy refs[0] and refs[2] from previous face
mov rcx,pCurrentFace
    call SplitQuad
mov pCurrentFace, rax
    ;jmp lbl_Done

lbl_Done:
    ; --- Return updated source pointer ---
    mov rax, rsi
    jmp lbl_End

lbl_End:
    EPILOG
parseFace endp



;--------------------------------------------------------------------------
; SplitQuad - Convert quad (4 vertices) into 2 triangles
; Current face buffer has 4 refs at pCurrentFace - 48
; Triangle 1: refs[0], refs[1], refs[2] (already stored)
; Triangle 2: refs[0], refs[2], refs[3] (need to append)
;--------------------------------------------------------------------------
SplitQuad proc
    ; pCurrentFace points to the NEXT face slot
    ; We need to copy from the quad start (pCurrentFace - 48)
    ; to the current position (pCurrentFace)
    
    mov rdx, rcx ;pCurrentFace     ; Current write position
    mov rbx, rcx ;pCurrentFace     ; Quad start = current - 48
    sub rbx, 48
    
    ; Triangle 2: refs[0], refs[2], refs[3]
    ; Copy refs[0] (v/vt/vn)
    mov eax, [rbx + 0]        ; v_ref[0]
    mov [rdx + 0], eax
    mov eax, [rbx + 4]        ; vt_ref[0]
    mov [rdx + 4], eax
    mov eax, [rbx + 8]        ; vn_ref[0]
    mov [rdx + 8], eax
    
    ; Copy refs[2]
    mov eax, [rbx + 24]       ; v_ref[2]
    mov [rdx + 12], eax
    mov eax, [rbx + 28]       ; vt_ref[2]
    mov [rdx + 16], eax
    mov eax, [rbx + 32]       ; vn_ref[2]
    mov [rdx + 20], eax
    
    ; Copy refs[3]
    mov eax, [rbx + 36]       ; v_ref[3]
    mov [rdx + 24], eax
    mov eax, [rbx + 40]       ; vt_ref[3]
    mov [rdx + 28], eax
    mov eax, [rbx + 44]       ; vn_ref[3]
    mov [rdx + 32], eax
    
    ; Advance pCurrentFace by 36 bytes
    add rcx, 36 ;pCurrentFace
    
    ret
SplitQuad endp


