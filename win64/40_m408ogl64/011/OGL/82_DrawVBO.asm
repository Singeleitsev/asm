;inlined by ogl\80_DrawScene.asm

;1. Bind the VAO that owns the attribute layout
mov rcx,VaoID
call qword ptr[gpGlBindVertexArray]

;2. Pass 1 - Opaque
mov rcx,0BE2h ;GL_BLEND
call glDisable
mov rcx,1 ;GL_TRUE
call glDepthMask

;2.1. Bind the index buffer (this becomes part of the VAO's element binding)
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesOpaqueID
call qword ptr[gpGlBindBuffer]

;2.2. Draw
mov rcx,4 ;GL_TRIANGLES
xor rdx,rdx
mov edx,gnIndexCountOpaque
mov r8,1405h ;GL_UNSIGNED_INT
xor r9,r9 ;offset 0
call glDrawElements

;3. Pass 2 - Transparent
mov rcx,0BE2h
call glEnable

mov rcx,302h ;GL_SRC_ALPHA
mov rdx,303h ;GL_ONE_MINUS_SRC_ALPHA
call glBlendFunc

mov rcx,0 ;GL_FALSE
call glDepthMask

;3.1. Bind the index buffer (this becomes part of the VAO's element binding)
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesTransparentID
call qword ptr[gpGlBindBuffer]

;3.2. Draw
mov rcx,4 ;GL_TRIANGLES
xor rdx,rdx
mov edx,gnIndexCountTransparent
mov r8,1405h ;GL_UNSIGNED_INT
xor r9,r9 ;offset 0
call glDrawElements

;4. Restore
mov rcx,1
call glDepthMask

mov rcx,0BE2h
call glDisable

;4.1. Unbind the VAO first
xor rcx,rcx
call qword ptr[gpGlBindVertexArray]

;4.2. Unbind the element array buffer
mov rcx,8893h ;unbind GL_ELEMENT_ARRAY_BUFFER
xor rdx,rdx
call qword ptr[gpGlBindBuffer]


