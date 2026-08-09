parseObjFile proc
PROLOG 100h

LOG_TEXT szLogObjLoad

;1. Open the file
call openObjFile
cmp rax,1
jne lbl_parseObjFile_End
LOG_TEXT szLogObjOpened
mov rcx,gnObjFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2. Get the Required RAM size
call getReqObjRAM
cmp rax,1
jne lbl_parseObjFile_End
LOG_TEXT szLogObjSizeOK

;3. Allocate the memory
call allocObjRAM
cmp rax,1
jne lbl_parseObjFile_End
LOG_TEXT szLogObjAllocOK

;4. Initialize counters
mov gnCurrentVertexCount,0
mov gnCurrentNormalCount,0
mov gnCurrentCombinedCount,0
mov gnCurrentIndexCount,0

;5. Parse loop
mov rsi,gpObjDataStart
mov gpObjDataCurrent,rsi

lbl_NextLine:
mov rsi,gpObjDataCurrent
cmp rsi,gpObjDataEnd
jge lbl_EndOfFile

;Skip whitespace and comments
mov al,byte ptr[rsi]
cmp al,0
je lbl_EndOfFile
cmp al,9 ;Tab
je lbl_SkipToEndOfLine
cmp al,0Ah ;Line Feed
je lbl_SkipToEndOfLine
cmp al,0Dh ;Carriage Return
je lbl_SkipToEndOfLine
cmp al,20h ;Space
je lbl_SkipToEndOfLine
cmp al,23h ;#
je lbl_SkipToEndOfLine

;Token detection
cmp word ptr[rsi],2076h ;"v " in reverse order
je lbl_TokenVertex
cmp word ptr[rsi],6E76h ;"vn" in reverse order
je lbl_TokenNormal
cmp word ptr[rsi],206Fh ;"o " in reverse order
je lbl_TokenObject
cmp word ptr[rsi],2067h ;"g " in reverse order
je lbl_TokenGroup
cmp byte ptr[rsi],66h ;"f"
je lbl_TokenFace
cmp dword ptr[rsi],6C6C746Dh; "mtll" in reverse order - part of "mtllib"
je lbl_TokenMtlLib
cmp dword ptr[rsi],6D657375h ;"usem" in reverse order - part of "usemtl"
je lbl_TokenUseMtl
jmp lbl_SkipToEndOfLine

;Parse vertex: v x y z
lbl_TokenVertex:
call parseVertex
jmp lbl_SkipToEndOfLine

;Parse normal: vn x y z
lbl_TokenNormal:
call parseNormal
jmp lbl_SkipToEndOfLine

;Parse object name: o name
lbl_TokenObject:
call parseObjectName
jmp lbl_SkipToEndOfLine

;Parse group name: g name
lbl_TokenGroup:
call parseGroupName
jmp lbl_SkipToEndOfLine

;Parse face: f v/vt/vn v/vt/vn v/vt/vn
lbl_TokenFace:
call parseFace
jmp lbl_SkipToEndOfLine

;Parse material: "mtllib"
lbl_TokenMtlLib:
call parseMtlFile
jmp lbl_SkipToEndOfLine

;Parse material: "usemtl"
lbl_TokenUseMtl:
call parseUseMtl
;jmp lbl_SkipToEndOfLine

lbl_SkipToEndOfLine:
mov rsi,gpObjDataCurrent
cmp rsi,gpObjDataEnd
jge lbl_EndOfFile
mov al,byte ptr[rsi]
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
inc gpObjDataCurrent
jmp lbl_SkipToEndOfLine

lbl_SkipCR:
inc gpObjDataCurrent
mov rsi,gpObjDataCurrent
cmp byte ptr[rsi],0Ah ;LF
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc gpObjDataCurrent
jmp lbl_NextLine

lbl_EndOfFile:
;Log results
LOG_TEXT szLogOBJVertices
xor rcx,rcx
mov ecx,gnCurrentVertexCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJNormals
xor rcx,rcx
mov ecx,gnCurrentNormalCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJCombined
xor rcx,rcx
mov ecx,gnCurrentCombinedCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJIndices
xor rcx,rcx
mov ecx,gnCurrentIndexCount
call WriteDecimalToLog
LOG_TEXT szCRLF

;6. Group faces by material
call GroupMaterials

;7. Cleanup
mov rcx,gpObjDataStart
call UnmapViewOfFile
mov rcx,ghObjMapping
call CloseHandle
mov rcx,ghObjFile
call CloseHandle

LOG_TEXT szLogOBJSuccess
jmp lbl_parseObjFile_End

;Errors
;All error handlers are in certain subProcedures


lbl_parseObjFile_End:
EPILOG
parseObjFile endp

