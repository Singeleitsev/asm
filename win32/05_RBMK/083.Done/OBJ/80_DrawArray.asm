;inlined by ogl\80_DrawScene.asm

invoke glEnableClientState,8074h ;GL_VERTEX_ARRAY
invoke glEnableClientState,8075h ;GL_NORMAL_ARRAY
invoke glEnableClientState,8076h ;GL_COLOR_ARRAY

push gpVertices
push 0
push 1406h ;GL_FLOAT
push 3 ;nSize
call glVertexPointer

;mov eax,dword ptr [gpNormals+8]
;call SpellEAX

push gpNormals
push 0
push 1406h ;GL_FLOAT
call glNormalPointer

push gpColors
push 0
push 1406h ;GL_FLOAT
push 3 ;nSize
call glColorPointer

;invoke ExitProcess,0

push gnVertexCount
push 0
push 7 ;GL_QUADS
call glDrawArrays

invoke glDisableClientState,8076h ;GL_COLOR_ARRAY
invoke glDisableClientState,8075h ;GL_NORMAL_ARRAY
invoke glDisableClientState,8074h ;GL_VERTEX_ARRAY

