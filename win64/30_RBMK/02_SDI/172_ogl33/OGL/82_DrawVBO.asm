;inlined by ogl\80_DrawScene.asm

;Bind index buffer
mov rcx,8893h ;GL_ELEMENT_ARRAY_BUFFER
mov rdx,VboIndicesID
call qword ptr[gpGlBindBuffer]

;Draw — indices pointer is offset 0
mov rcx,4 ;GL_TRIANGLES
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


