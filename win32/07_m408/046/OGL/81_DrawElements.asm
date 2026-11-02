;inlined by ogl\80_DrawScene.asm

invoke glEnableClientState,8074h ;GL_VERTEX_ARRAY
invoke glEnableClientState,8075h ;GL_NORMAL_ARRAY

push gpVertices
push STRIDE ;(3 coords + 3 normals + 3 colors) * 4 bytes = 36 bytes
push 1406h ;GL_FLOAT
push 3 ;nSize
call glVertexPointer

push gpNormals
push STRIDE
push 1406h
call glNormalPointer

;Pass 1 - Render Opaque Materials
include 82_Opaque.asm

;Pass 2 - Render Transparent Materials
include 83_Transparent.asm

;Restore default state
push 0BE2h ;GL_BLEND
call glDisable
push 1 ;GL_TRUE
call glDepthMask

invoke glDisableClientState,8075h ;GL_NORMAL_ARRAY
invoke glDisableClientState,8074h ;GL_VERTEX_ARRAY


