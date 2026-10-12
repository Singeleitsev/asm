BuildGeometry proc
LOCAL pCurrentVertex:DWORD,pCurrentIndex:DWORD
LOCAL nVertexCount:WORD,nIndexCount:WORD

call GetProcessHeap
mov ghProcessHeap,eax

push RBMK_VERTEX_ARRAY_SIZE ;see constant.asm
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
;Set the Destination (Common Vertices Array) address
mov pCurrentVertex,eax
;Store the Global pointers
mov gpVertices,eax
;offset 12 bytes = 3 vertex coordinates * 4 bytes
add eax,12 
mov gpNormals,eax
;offset 12 bytes = 3 normal coordinates * 4 bytes
add eax,12 
mov gpColors,eax

push RBMK_INDEX_ARRAY_SIZE ;see constant.asm)
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
;Set the Destination (Common Indices Array) address
mov pCurrentIndex,eax
;Store the Global pointer
mov gpIndices,eax

;Load the Look-Up Table address
lea ecx,Layout

;Set the Counters
mov nVertexCount,0
mov nIndexCount,0

;Load the RBMK Grid Step (250 mm)
movss xmm7,dChannelGrid

;Set the Row Position
movss xmm1,yOrigin ;xmm1 = yi

;For r = 1 To nRows
mov bh,48 ;yCell
NextRow:

;Set the Column Position
movss xmm0,xOrigin ;xmm0 = xi

;For c = 1 To nCols
mov bl,48 ;xCell
NextColumn:

;Color = Layout(r, c)
mov al, byte ptr[ecx] ;al = Color

cmp al,1 ;Lead
jne @f
lea edx,Gray
jmp SetColor
@@:
cmp al,2 ;Green
jne @f
lea edx,Green
jmp SetColor
@@:
cmp al,3 ;Yellow
jne @f
lea edx,Yellow
jmp SetColor
@@:
cmp al,4 ;Red
jne @f
lea edx,Red
jmp SetColor
@@:
cmp al,5 ;Blue
jne NextCell ;Color = 0 or something else
lea edx,Blue

SetColor:
movss xmm3,dword ptr[edx+0] ;Red
movss xmm4,dword ptr[edx+4] ;Green
movss xmm5,dword ptr[edx+8] ;Blue

;For nVertex = 1 To 12
mov eax,12

;Reset the Source (Single Cap Vertices Array) address
lea esi,CapVertices
;Reset the Destination (Common Vertices Array) address
mov edi,pCurrentVertex

WriteVertices:

;xv and yv coordinates vary depending on the cap's position
;They are computed and passed separately

;Store xi
movss xmm6,dword ptr[esi+0]
addss xmm6,xmm0
movss dword ptr[edi+0],xmm6
;Store yi
movss xmm6,dword ptr[esi+4]
addss xmm6,xmm1
movss dword ptr[edi+4],xmm6

;zv coordinate and nx,ny,nz coordinates are constant
;fortunately, their total size is 4*4 bytes
;which can be passed with one xmm instruction

;gpVertices(8) = pCapPattern(8)
;gpNormals(0) = gpVertices(12) = pCapPattern(12)
;gpNormals(4) = gpVertices(16) = pCapPattern(16)
;gpNormals(8) = gpVertices(20) = pCapPattern(20)
movups xmm2,oword ptr[esi+8]
movups oword ptr[edi+8],xmm2

;Colors can not be passed by a single xmm instruction
;because there are only 3 of them in gpColors array

;gpColors(0) = gpVertices(24) = red
movss dword ptr[edi+24],xmm3
;gpColors(4) = gpVertices(28) = green
movss dword ptr[edi+28],xmm4
;gpColors(8) = gpVertices(32) = blue
movss dword ptr[edi+32],xmm5

;Advance the Destination address
add edi,STRIDE ;36 bytes = 3*4 (coords) + 3*4 (normals) * 3*4 (colors)
mov pCurrentVertex,edi

;Advance the Source address
add esi,24

;Next nVertex
dec eax ;nVertex = nVertex - 1
jnz WriteVertices

;For nIndex = 1 To 20
mov eax,20 ;4 indices * 1 quad * 5 faces = 20 words

;Reset the Source (Single Cap Indices Array) address
lea esi,CapIndices
;Reset the Destination (Common Indices Array) address
mov edi,pCurrentIndex

WriteIndex:
movzx edx,word ptr[esi]
add dx,nVertexCount
mov word ptr[edi],dx
add esi,2
add edi,2

dec eax ;nIndex = nIndex - 1
test al,al
jnz WriteIndex

;Advance the Destination address
mov pCurrentIndex,edi

;Advance the Vertex Count
add nVertexCount,12
;Advance the Index Count
add nIndexCount,20 ;4 indices * 1 quad * 5 faces = 20 words

NextCell:
inc ecx

;Next Column
addss xmm0,xmm7 ;xi = xi + dChannelGrid
dec bl ;xCell = xCell - 1
jnz NextColumn

;Next Row
addss xmm1,xmm7 ;yi = yi + dChannelGrid
dec bh ;yCell = yCell - 1
jnz NextRow

;Post Check
mov edi,pCurrentVertex
sub edi,gpVertices ;Back to the start
cmp edi,RBMK_VERTEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error
mov edi,pCurrentIndex
sub edi,gpIndices ;Back to the start
cmp edi,RBMK_INDEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error

;Success
invoke WriteLog,offset szLogDataLoaded
jmp BuildGeometry_End

BuildGeometry_Error:
invoke WriteLog,offset szErrDataLoading

BuildGeometry_End:
invoke WriteLog,offset szLastRow
mov eax,48
sub al,bl
invoke WriteDecimalToLog,eax
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLastColumn
mov eax,48
sub al,bh
invoke WriteDecimalToLog,eax
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szVertices
movzx eax,nVertexCount
invoke WriteDecimalToLog,eax
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szIndices
movzx eax,nIndexCount
invoke WriteDecimalToLog,eax
invoke WriteLog,offset szCRLF

ret
BuildGeometry endp


