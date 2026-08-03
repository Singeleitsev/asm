countEntities proc
LOCAL pCurrentPosition:QWORD,hHeap:QWORD
LOCAL nObjectIndex:DWORD,nMaterialIndex:DWORD

PROLOG 100h

;Set the Local Pointer
mov rcx,gpObjDataStart
mov pCurrentPosition,rcx

;Initialize Counters
mov gnTotalObjects,0
mov gnTotalGroups,0
mov gnTotalSubGroups,0
mov gnTotalVertices,0
mov gnTotalNormals,0
mov gnTotalFaces,0
mov gnTotalMtlLibs,0
mov gnTotalIndices,0

;Initialize Indices
mov nObjectIndex,0

lbl_NextLine:

mov rcx,pCurrentPosition
cmp rcx,gpObjDataEnd
jge lbl_EndOfFile

;Check for consistency
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je  lbl_EndOfFile
cmp al,9 ;Tab
je  lbl_SkipByte
cmp al,0Ah ;CR
je  lbl_SkipByte
cmp al,0Dh ;LF
je  lbl_SkipByte
cmp al,20h ;Space
je  lbl_SkipByte
cmp al,23h ;# OBJ Format Comment
je  lbl_SkipByte

;Token detection. Arranged by Probability
;mov rcx,pCurrentPosition
cmp byte ptr[rcx],76h ;"v"
je lbl_TokenStartsWithV
cmp byte ptr[rcx],66h ;"f"
je lbl_TokenFace
cmp dword ptr[rcx],6D657375h ;"usem" in reverse order - part of "usemtl"
je lbl_TokenUseMtl
cmp byte ptr[rcx],6Fh ;"o"
je lbl_TokenObject
cmp byte ptr[rcx],67h ;"g"
je lbl_TokenGroup
cmp dword ptr[rcx],6C6C746Dh; "mtll" in reverse order - part of "mtllib"
je lbl_TokenMtlLib
jmp lbl_SkipByte

;Count object name: o name
lbl_TokenObject:
add pCurrentPosition,2 ;skip "o "
inc gnTotalObjects
jmp lbl_SkipByte

;Count object name: g name
lbl_TokenGroup:
add pCurrentPosition,2 ;skip "g "
inc gnTotalGroups
jmp lbl_SkipByte

;Count material: "usemtl"
lbl_TokenUseMtl:
add pCurrentPosition,7 ;skip "usemtl "
inc gnTotalSubGroups
jmp lbl_SkipByte

;Branch V
lbl_TokenStartsWithV:
inc pCurrentPosition
cmp byte ptr[rcx],6Eh ;"n"
je lbl_TokenNormal
cmp byte ptr[rcx],74h ;"t"
je lbl_TokenTextureCoordinate
;jmp lbl_TokenVertex ;By default

;Count vertex: v x y z
lbl_TokenVertex:
inc pCurrentPosition ;skip "v "
inc gnTotalVertices
jmp lbl_SkipByte

;Count normal: vn x y z
lbl_TokenNormal:
add pCurrentPosition,2 ;skip "vn "
inc gnTotalNormals
jmp lbl_SkipByte

;Count texture: vt u v w
lbl_TokenTextureCoordinate:
add pCurrentPosition,2 ;skip "vt "
inc gnTotalTextureCoords
jmp lbl_SkipByte

;Count face: f v/vt/vn v/vt/vn v/vt/vn
lbl_TokenFace:
inc pCurrentPosition ;skip "f "
inc gnTotalFaces
jmp lbl_SkipByte

;Count material: "mtllib"
lbl_TokenMtlLib:
add pCurrentPosition,7 ;skip "mtllib "
inc gnTotalMtlLibs
jmp lbl_SkipByte

lbl_SkipByte:
mov rcx,pCurrentPosition
cmp rcx,gpObjDataEnd
jge lbl_EndOfFile
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je lbl_EndOfFile
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
inc pCurrentPosition
jmp lbl_SkipByte

lbl_SkipCR:
inc pCurrentPosition
mov rcx,pCurrentPosition
cmp byte ptr[rcx],0Ah ;LF
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc pCurrentPosition
jmp lbl_NextLine

lbl_EndOfFile:
cmp gnTotalObjects,0
jne @f
LOG_TEXT szErrNoObjects
@@:
cmp gnTotalGroups,0
jne @f
LOG_TEXT szErrNoGroups
@@:
cmp gnTotalSubGroups,0
jne @f
LOG_TEXT szErrNoSubGroups
@@:
cmp gnTotalMtlLibs,0
jne @f
LOG_TEXT szErrNoMtlLibs
@@:
cmp gnTotalVertices,0
jne @f
LOG_TEXT szErrNoVertices
@@:
cmp gnTotalNormals,0
jne @f
LOG_TEXT szErrNoNormals
@@:
cmp gnTotalTextureCoords,0
jne @f
LOG_TEXT szErrNoTextureCoords
@@:
cmp gnTotalFaces,0
jne @f
LOG_TEXT szErrNoFaces
@@:

;Success
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
countEntities endp


