LoadOBJ proc
PROLOG 100h

LOG_TEXT szLogObjLoad

;1. Open the file
call openObj
cmp rax,1
jne lbl_LoadOBJ_End
LOG_TEXT szLogObjOpened
xor rcx,rcx
mov ecx,gnObjFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2. Get the Required RAM size
call getReqObjRAM
cmp rax,1
jne lbl_LoadOBJ_End
LOG_TEXT szLogObjSizeOK

;3. Allocate the memory
call allocObjRAM
cmp rax,1
jne lbl_LoadOBJ_End
LOG_TEXT szLogObjAllocOK

;4. Parse subElements
;call parseObject

;5. Initialize counters
mov gnCurrentVertexCount,0
mov gnCurrentNormalCount,0
mov gnCurrentCombinedCount,0
mov gnCurrentIndexCount,0

;6. Parse loop
mov rsi,gpObjDataStart
mov rdi,gpObjDataEnd

lbl_NextLine:
cmp rsi,gpObjDataEnd
jge lbl_EndOfFile

;Skip whitespace and comments
movzx eax,byte ptr[rsi]
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
cmp byte ptr[rsi],66h ;"f"
je lbl_TokenFace
jmp lbl_SkipToEndOfLine

;Parse vertex: v x y z
lbl_TokenVertex:
call parseVertex
jmp lbl_SkipToEndOfLine

;Parse normal: vn x y z
lbl_TokenNormal:
call parseNormal
jmp lbl_SkipToEndOfLine

;Parse face: f v/vt/vn v/vt/vn v/vt/vn
lbl_TokenFace:
call parseFace
jmp lbl_SkipToEndOfLine

lbl_SkipToEndOfLine:
cmp rsi,gpObjDataEnd
jge lbl_EndOfFile
mov al, byte ptr[rsi]
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
inc rsi
jmp lbl_SkipToEndOfLine

lbl_SkipCR:
inc rsi
cmp byte ptr[rsi],0Ah ;10
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc rsi
jmp lbl_NextLine

lbl_EndOfFile:
;Log results
LOG_TEXT szLogOBJVertices
mov ecx,gnCurrentVertexCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJNormals
mov ecx,gnCurrentNormalCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJCombined
mov ecx,gnCurrentCombinedCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogOBJIndices
mov ecx,gnCurrentIndexCount
call WriteDecimalToLog
LOG_TEXT szCRLF

;8. Cleanup

mov rcx,gpObjDataStart
call UnmapViewOfFile
mov rcx,ghObjMapping
call CloseHandle
mov rcx,ghObjFile
call CloseHandle

LOG_TEXT szLogOBJSuccess
jmp lbl_LoadOBJ_End

;Errors
;All error handlers are in certain subProcedures


lbl_LoadOBJ_End:
EPILOG
LoadOBJ endp
