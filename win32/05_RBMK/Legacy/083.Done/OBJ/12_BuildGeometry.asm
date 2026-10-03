BuildGeometry proc
LOCAL nCount:DWORD, nCap:DWORD, nQuad:DWORD
LOCAL nWrittenBytes:DWORD, xCell:DWORD, yCell:DWORD
LOCAL cr:REAL4, cg:REAL4, cb:REAL4

call GetProcessHeap
mov ghProcessHeap,eax

push 453120 ;= 1888 channels * 5 quads * 4 vertices * 3 coords * 4 bytes
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
mov gpVertices,eax

push 453120 ;= 1888 channels * 5 quads * 4 vertices * 3 coords * 4 bytes
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
mov gpNormals,eax

push 453120 ;= 1888 channels * 5 quads * 4 vertices * 3 coords * 4 bytes
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
mov gpColors,eax

mov nCount,0
mov nCap,0

;base = 0
mov nWrittenBytes,0

;For r = 1 To nRows
mov yCell,0
NextRow:

;For c = 1 To nCols
mov xCell,0
NextColumn:

;nCode = CellCode(vals(r, c))
lea ecx,Layout
add ecx,nCount
movzx eax, byte ptr[ecx] ;eax = nCode

cmp eax,1 ;Lead
jne @f
lea ecx,Gray
jmp SetColor
@@:
cmp eax,2 ;Green
jne @f
lea ecx,Green
jmp SetColor
@@:
cmp eax,3 ;Yellow
jne @f
lea ecx,Yellow
jmp SetColor
@@:
cmp eax,4 ;Red
jne @f
lea ecx,Red
jmp SetColor
@@:
cmp eax,5 ;Blue
jne NextCell ;nCode = 0 or something else
lea ecx,Blue

SetColor:
movss xmm0,dword ptr[ecx+00]
movss cr,xmm0
movss xmm1,dword ptr[ecx+04]
movss cg,xmm1
movss xmm2,dword ptr[ecx+08]
movss cb,xmm2

;ox = ORIGIN_X + (c - 1) * CAP_STEP
cvtsi2ss xmm0,dword ptr[xCell]
mulss xmm0,ChannelGrid
addss xmm0,xOrigin
;oy = ORIGIN_Y + (nyCells - r) * CAP_STEP
movss xmm1,f32_LayoutDim ;48.0 rows
cvtsi2ss xmm2,dword ptr[yCell]
subss xmm1,xmm2
mulss xmm1,ChannelGrid
addss xmm1,yOrigin

;For i = 0 To 19
mov nQuad,0
WriteQuad:

mov eax,nQuad
imul eax,eax,12 ;*3 coordinates * 4 bytes

;Coordinates
mov edi,gpVertices
add edi,nWrittenBytes
add edi,eax

lea esi,capV
add esi,eax

;gVerts(base + i * 3) = capV(i * 3) + ox
movss xmm3,dword ptr[esi+0]
addss xmm3,xmm0
movss dword ptr[edi+0],xmm3
;gVerts(base + i * 3 + 1) = capV(i * 3 + 1) + oy
movss xmm4,dword ptr[esi+4]
addss xmm4,xmm1
movss dword ptr[edi+4],xmm4
;gVerts(base + i * 3 + 2) = capV(i * 3 + 2)
movss xmm5,dword ptr[esi+8]
movss dword ptr[edi+8],xmm5

;Normals
mov edi,gpNormals
add edi,nWrittenBytes
add edi,eax

lea esi,capN
add esi,eax
;gNorms(base + i * 3) = capN(i * 3)
movss xmm3,dword ptr[esi+0]
movss dword ptr[edi+0],xmm3
;gNorms(base + i * 3 + 1) = capN(i * 3 + 1)
movss xmm4,dword ptr[esi+4]
movss dword ptr[edi+4],xmm4
;gNorms(base + i * 3 + 2) = capN(i * 3 + 2)
movss xmm5,dword ptr[esi+8]
movss dword ptr[edi+8],xmm5

;Colors
mov edi,gpColors
add edi,nWrittenBytes
add edi,eax

;gCols(base + i * 3) = cr
mov ecx,dword ptr[cr]
mov dword ptr[edi+0],ecx
;gCols(base + i * 3 + 1) = cg
mov ecx,dword ptr[cg]
mov dword ptr[edi+4],ecx
;gCols(base + i * 3 + 2) = cb
mov ecx,dword ptr[cb]
mov dword ptr[edi+8],ecx

;Next i
inc nQuad
cmp nQuad,20
jl WriteQuad

;Count the Cap
inc nCap

;base = base + 60
add nWrittenBytes,240 ;5 quads * 4 vertices * 3 coordinates * 4 bytes

NextCell:
inc nCount

;Next c
inc xCell
cmp xCell,48
jl NextColumn

;Next r
inc yCell
cmp yCell,48
jl NextRow

;Post Check
cmp nWrittenBytes,453120 ;= 1888 channels * 5 quads * 4 vertices * 3 coordinates * 4 bytes
jne BuildGeometry_Error

;Success
invoke WriteLog,offset szLogDataLoaded
jmp BuildGeometry_End

BuildGeometry_Error:
invoke WriteLog,offset szErrDataLoading

BuildGeometry_End:
invoke WriteLog,offset szLastRow
invoke WriteDecimalToLog,xCell
invoke WriteLog,offset szLastColumn
invoke WriteDecimalToLog,yCell
invoke WriteLog,offset szBytesWritten
invoke WriteDecimalToLog,nWrittenBytes
invoke WriteLog,offset szCRLF
ret
BuildGeometry endp


