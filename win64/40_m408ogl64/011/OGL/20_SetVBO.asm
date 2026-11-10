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
xor rdx,rdx
mov edx,gnTotalIndices
imul rdx,rdx,STRIDE
mov r8,gpInterleavedVNC
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

lea rcx,szOK
call WriteLog

;3.1. Generate Opaque index buffer
lea rcx,szGlGenBuffers
call WriteLog

mov rcx,1 ;count
lea rdx,VboIndicesOpaqueID
call qword ptr[gpGlGenBuffers]

lea rcx,szOK
call WriteLog

;3.2. Upload Opaque indices
lea rcx,szGlBindBuffer
call WriteLog

mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesOpaqueID
call qword ptr[gpGlBindBuffer]

lea rcx,szOK
call WriteLog

;3.3. Create and initialize a buffer object's data store
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
xor rdx,rdx
mov edx,gnIndexCountOpaque
shl edx,2 ;* 4 bytes
mov r8,gpIndicesOpaque
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

;4.1. Generate Transparent index buffer
lea rcx,szGlGenBuffers
call WriteLog

mov rcx,1
lea rdx,VboIndicesTransparentID
call qword ptr[gpGlGenBuffers]

lea rcx,szOK
call WriteLog

;4.2. Generate Transparent index buffer
lea rcx,szGlBindBuffer
call WriteLog

mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesTransparentID
call qword ptr[gpGlBindBuffer]

lea rcx,szOK
call WriteLog

;4.3. Create and initialize a buffer object's data store

mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
xor rdx,rdx
mov edx,gnIndexCountTransparent
shl edx,2 ;* 4 bytes
mov r8,gpIndicesTransparent
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

;5. Unbind (so subsequent state changes don't accidentally touch the VBO)
lea rcx,szGlBindBuffer
call WriteLog

xor rcx,rcx ;GL_ARRAY_BUFFER = 0
call qword ptr[gpGlBindBuffer]

lea rcx,szOK
call WriteLog

;6. Success
lea rcx,szVboSuccess
call WriteLog

jmp SetVBO_End

;SetVBO_Error:
;lea rcx,szErrSetVBO
;call WriteLog

SetVBO_End:
EPILOG
SetVBO endp


