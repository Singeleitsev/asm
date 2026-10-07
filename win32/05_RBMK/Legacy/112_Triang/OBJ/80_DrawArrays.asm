;inlined by ogl\80_DrawScene.asm

invoke glEnableClientState,8074h ;GL_VERTEX_ARRAY
invoke glEnableClientState,8075h ;GL_NORMAL_ARRAY
invoke glEnableClientState,8076h ;GL_COLOR_ARRAY

push gpVertices
push STRIDE ;(3 coords + 3 normals + 3 colors) * 4 bytes = 36 bytes
push 1406h ;GL_FLOAT
push 3 ;nSize
call glVertexPointer

push gpNormals
push STRIDE
push 1406h ;GL_FLOAT
call glNormalPointer

push gpColors
push STRIDE
push 1406h ;GL_FLOAT
push 3 ;nSize
call glColorPointer

push gpIndices
push 1403h ;GL_UNSIGNED_SHORT
push RBMK_TOTAL_INDICES
push 4 ;GL_TRIANGLES
call glDrawElements

invoke glDisableClientState,8076h ;GL_COLOR_ARRAY
invoke glDisableClientState,8075h ;GL_NORMAL_ARRAY
invoke glDisableClientState,8074h ;GL_VERTEX_ARRAY

