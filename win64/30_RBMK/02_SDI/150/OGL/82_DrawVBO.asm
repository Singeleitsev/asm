;inlined by ogl\80_DrawScene.asm

xor rcx,rcx ;attribute location 0 (aPos)
call qword ptr[gpGlEnableVertexAttribArray]
mov rcx,1 ;attribute location 1 (aNormal)
call qword ptr[gpGlEnableVertexAttribArray]
mov rcx,2 ;attribute location 2 (aColor)
call qword ptr[gpGlEnableVertexAttribArray]

;Bind vertex buffer
mov rcx, 8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]

;Position: location 0, size 3, offset 0
xor rcx,rcx ;attribute location 0 (aPos)
mov rdx,3 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],0 ;offset 0 in VBO
call qword ptr[gpGlVertexAttribPointer]

;Normal: location 1, size 3, offset 12
mov rcx,1 ;attribute location 1 (aNormal)
mov rdx,3 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],12 ;offset 12 in VBO
call qword ptr[gpGlVertexAttribPointer]

;Color: location 2, size 3, offset 24
mov rcx,2 ;attribute location 2 (aColor)
mov rdx,3 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],24 ;offset 24 in VBO
call qword ptr[gpGlVertexAttribPointer]

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

xor rcx,rcx ;attribute location 0 (aPos)
call qword ptr[gpGlDisableVertexAttribArray]
mov rcx,1 ;attribute location 1 (aNormal)
call qword ptr[gpGlDisableVertexAttribArray]
mov rcx,2 ;attribute location 2 (aColor)
call qword ptr[gpGlDisableVertexAttribArray]


