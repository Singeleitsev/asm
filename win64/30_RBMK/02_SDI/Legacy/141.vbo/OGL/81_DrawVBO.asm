;inlined by ogl\80_DrawScene.asm

mov rcx,8074h ;GL_VERTEX_ARRAY
call glEnableClientState

mov rcx,8075h ;GL_NORMAL_ARRAY
call glEnableClientState

mov rcx,8076h ;GL_COLOR_ARRAY
call glEnableClientState

;Bind vertex buffer
mov rcx, 8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]

;Vertex pointers — offset 0,12,24 instead of heap addresses
mov rcx,3
mov rdx,1406h ;GL_FLOAT
mov r8,STRIDE
xor r9,r9 ;offset 0
call glVertexPointer

mov rcx,1406h
mov rdx,STRIDE
mov r8,12 ;offset 12
call glNormalPointer

mov rcx,3
mov rdx,1406h
mov r8,STRIDE
mov r9,24 ;offset 24
call glColorPointer

;Bind index buffer
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesID
call qword ptr[gpGlBindBuffer]

;Draw — indices pointer is offset 0
mov rcx,7 ;GL_QUADS (or 4 for GL_TRIANGLES)
mov rdx,RBMK_TOTAL_INDICES
mov r8,1403h ;GL_UNSIGNED_SHORT
xor r9,r9 ;offset 0
call glDrawElements

;Unbind
xor rcx,rcx ;unbind GL_ARRAY_BUFFER
xor rdx,rdx
call qword ptr[gpGlBindBuffer]

mov rcx,8893h ;unbind GL_ELEMENT_ARRAY_BUFFER
xor rdx,rdx
call qword ptr[gpGlBindBuffer]

mov rcx,8076h ;GL_COLOR_ARRAY
call glDisableClientState

mov rcx,8075h ;GL_NORMAL_ARRAY
call glDisableClientState

mov rcx,8074h ;GL_VERTEX_ARRAY
call glDisableClientState


