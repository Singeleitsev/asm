SetVBO proc
PROLOG 100h

;1. Generate vertex buffer
lea rcx,szGlGenBuffers
call WriteLog

mov rcx,1 ;count
lea rdx,VboVerticesID
call qword ptr[gpGlGenBuffers]

lea rcx,szOK
call WriteLog

;2. Upload vertices
lea rcx,szGlBindBuffer
call WriteLog

mov rcx,8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]

lea rcx,szOK
call WriteLog

lea rcx,szGlBufferData
call WriteLog

mov rcx,8892h ;GL_ARRAY_BUFFER
mov rdx,RBMK_VERTEX_ARRAY_SIZE
mov r8,gpVertices
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

lea rcx,szOK
call WriteLog

;3. Generate index buffer
lea rcx,szGlGenBuffers
call WriteLog

mov rcx,1 ;count
lea rdx,VboIndicesID
call qword ptr[gpGlGenBuffers]

lea rcx,szOK
call WriteLog

;4. Upload indices
lea rcx,szGlBindBuffer
call WriteLog

mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesID
call qword ptr[gpGlBindBuffer]

lea rcx,szOK
call WriteLog

;5. Create and initialize a buffer object's data store
lea rcx,szGlBufferData
call WriteLog

mov rcx,8893h
mov rdx,RBMK_INDEX_ARRAY_SIZE
mov r8,gpIndices
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

lea rcx,szOK
call WriteLog

;6. Unbind (so subsequent state changes don't accidentally touch the VBO)
lea rcx,szGlBindBuffer
call WriteLog
xor rcx,rcx ;GL_ARRAY_BUFFER = 0
call qword ptr[gpGlBindBuffer]
lea rcx,szOK
call WriteLog

;7. Success
lea rcx,szVboSuccess
call WriteLog

jmp SetVBO_End

;SetVBO_Error:
;lea rcx,szErrSetVBO
;call WriteLog

SetVBO_End:
EPILOG
SetVBO endp


