SetVBO proc
PROLOG 100h

;Load the Functions from the vendor's driver DLL
lea rcx,szGlGenBuffers
call wglGetProcAddress
mov gpGlGenBuffers,rax
test rax,rax
jz SetVBO_Error

lea rcx,szGlBindBuffer
call wglGetProcAddress
mov gpGlBindBuffer,rax
test rax,rax
jz SetVBO_Error

lea rcx,szGlBufferData
call wglGetProcAddress
mov gpGlBufferData,rax
test rax,rax
jz SetVBO_Error

lea rcx,szGlDeleteBuffers
call wglGetProcAddress
mov gpGlDeleteBuffers,rax

;Generate vertex buffer
mov rcx,1 ;count
lea rdx,VboVerticesID
call qword ptr[gpGlGenBuffers]

;Upload vertices
mov rcx,8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]

mov rcx,8892h ;GL_ARRAY_BUFFER
mov rdx,RBMK_VERTEX_ARRAY_SIZE
mov r8,gpVertices
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

;Generate index buffer
mov rcx,1 ;count
lea rdx,VboIndicesID
call qword ptr[gpGlGenBuffers]

;Upload indices
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesID
call qword ptr[gpGlBindBuffer]

mov rcx,8893h
mov rdx,RBMK_INDEX_ARRAY_SIZE
mov r8,gpIndices
mov r9,88E4h ;GL_STATIC_DRAW
call qword ptr[gpGlBufferData]

;Unbind (so subsequent state changes don't accidentally touch the VBO)
xor rcx,rcx ;GL_ARRAY_BUFFER = 0
call qword ptr[gpGlBindBuffer]

jmp SetVBO_End

SetVBO_Error:
lea rcx,szErrVBOExt
call WriteLog

SetVBO_End:
EPILOG
SetVBO endp


