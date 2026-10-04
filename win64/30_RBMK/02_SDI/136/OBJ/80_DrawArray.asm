;inlined by ogl\80_DrawScene.asm

mov rcx,8074h ;GL_VERTEX_ARRAY
call glEnableClientState

mov rcx,8075h ;GL_NORMAL_ARRAY
call glEnableClientState

mov rcx,8076h ;GL_COLOR_ARRAY
call glEnableClientState

mov rcx,3 ;nSize
mov rdx,1406h ;GL_FLOAT
xor r8,r8
mov r9,gpVertices
call glVertexPointer

mov rcx,1406h ;GL_FLOAT
xor rdx,rdx
mov r8,gpNormals
call glNormalPointer

mov rcx,3 ;nSize
mov rdx,1406h ;GL_FLOAT
xor r8,r8
mov r9,gpColors
call glColorPointer

mov rcx,7 ;GL_QUADS
xor rdx,rdx
xor r8,r8
mov r8d,gnVertexCount
call glDrawArrays

mov rcx,8076h ;GL_COLOR_ARRAY
call glDisableClientState

mov rcx,8075h ;GL_NORMAL_ARRAY
call glDisableClientState

mov rcx,8074h ;GL_VERTEX_ARRAY
call glDisableClientState



