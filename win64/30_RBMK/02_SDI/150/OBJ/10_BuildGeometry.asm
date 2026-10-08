BuildGeometry proc
PROLOG 100h

;rax = common purpose
;rbx = xCell, yCell
;rcx = current address in the Look-Up Table (Layout)
;rdx = common purpose
;rsi = source index
;rdi = destination index
;r8 = pCurrentVertex
;r9 = pCurrentIndex
;r10 = nVertexCount
;r11 = nIndexCount
;r12 = common purpose

call GetProcessHeap
mov ghProcessHeap,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,RBMK_VERTEX_ARRAY_SIZE ;see constant.asm
call HeapAlloc
test rax,rax
jz BuildGeometry_Error
;Store the Global pointers
mov gpVertices,rax
;offset 12 bytes = 3 vertex coordinates * 4 bytes
add rax,12 
mov gpNormals,rax
;offset 12 bytes = 3 normal coordinates * 4 bytes
add rax,12 
mov gpColors,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,RBMK_INDEX_ARRAY_SIZE ;see constant.asm)
call HeapAlloc
test rax,rax
jz BuildGeometry_Error
;Store the Global pointer
mov gpIndices,rax

;Load the Local Pointers
mov r8,gpVertices ;pCurrentVertex
mov r9,gpIndices ;pCurrentIndex

;Load the Look-Up Table address
lea rcx,Layout

;Set the Counters
xor r10,r10 ;nVertexCount
xor r11,r11 ;nIndexCount

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
mov al, byte ptr[rcx] ;al = Color

cmp al,1 ;Lead
jne @f
lea rdx,Gray
jmp SetColor
@@:
cmp al,2 ;Green
jne @f
lea rdx,Green
jmp SetColor
@@:
cmp al,3 ;Yellow
jne @f
lea rdx,Yellow
jmp SetColor
@@:
cmp al,4 ;Red
jne @f
lea rdx,Red
jmp SetColor
@@:
cmp al,5 ;Blue
jne NextCell ;Color = 0 or something else
lea rdx,Blue

SetColor:
movss xmm3,dword ptr[rdx+0] ;Red
movss xmm4,dword ptr[rdx+4] ;Green
movss xmm5,dword ptr[rdx+8] ;Blue

;For nVertex = 1 To 12
mov rax,12

;Reset the Source (Single Cap Vertices Array) address
lea rsi,CapVertices
;Reset the Destination (Common Vertices Array) address
mov rdi,r8 ;pCurrentVertex

WriteVertices:

;xv and yv coordinates vary depending on the cap's position
;They are computed and passed separately

;Store xi
movss xmm6,dword ptr[rsi+0]
addss xmm6,xmm0
movss dword ptr[rdi+0],xmm6
;Store yi
movss xmm6,dword ptr[rsi+4]
addss xmm6,xmm1
movss dword ptr[rdi+4],xmm6

;zv coordinate and nx,ny,nz coordinates are constant
;fortunately, their total size is 4*4 bytes
;which can be passed with one xmm instruction

;gpVertices(8) = pCapPattern(8)
;gpNormals(0) = gpVertices(12) = pCapPattern(12)
;gpNormals(4) = gpVertices(16) = pCapPattern(16)
;gpNormals(8) = gpVertices(20) = pCapPattern(20)
movups xmm2,oword ptr[rsi+8]
movups oword ptr[rdi+8],xmm2

;Colors can not be passed by a single xmm instruction
;because there are only 3 of them in gpColors array

;gpColors(0) = gpVertices(24) = red
movss dword ptr[rdi+24],xmm3
;gpColors(4) = gpVertices(28) = green
movss dword ptr[rdi+28],xmm4
;gpColors(8) = gpVertices(32) = blue
movss dword ptr[rdi+32],xmm5

;Advance the Destination address
add rdi,STRIDE ;36 bytes = 3*4 (coords) + 3*4 (normals) * 3*4 (colors)
mov r8,rdi ;pCurrentVertex

;Advance the Source address
add rsi,24

;Next nVertex
dec rax ;nVertex = nVertex - 1
jnz WriteVertices

;For nIndex = 1 To 20
mov rax,20 ;4 indices * 1 quad * 5 faces = 20 words

;Reset the Source (Single Cap Indices Array) address
lea rsi,CapIndices
;Reset the Destination (Common Indices Array) address
mov rdi,r9 ;pCurrentIndex

WriteIndex:
mov r12w,word ptr[rsi]
add r12w,r10w ;nVertexCount
mov word ptr[rdi],r12w
add rsi,2
add rdi,2

dec rax ;nIndex = nIndex - 1
test al,al
jnz WriteIndex

;Advance the Destination address
mov r9,rdi ;pCurrentIndex

;Advance the Vertex Count
add r10,12 ;nVertexCount
;Advance the Index Count
add r11,20 ;nIndexCount

NextCell:
inc rcx ;Layout

;Next Column
addss xmm0,xmm7 ;xi = xi + dChannelGrid
dec bl ;xCell = xCell - 1
jnz NextColumn

;Next Row
addss xmm1,xmm7 ;yi = yi + dChannelGrid
dec bh ;yCell = yCell - 1
jnz NextRow

;Post Check
sub r8,gpVertices ;nBytesWritten = pCurrentVertex - gpVertices
cmp r8,RBMK_VERTEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error
sub r9,gpIndices ;nBytesWritten = pCurrentIndex - gpIndices
cmp r9,RBMK_INDEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error

;Success
lea rcx,szLogDataLoaded
call WriteLog
jmp BuildGeometry_End

BuildGeometry_Error:
lea rcx,szErrDataLoading
call WriteLog

BuildGeometry_End:
lea rcx,szLastRow
call WriteLog
mov rcx,48 ;yCell
sub cl,bh
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

lea rcx,szLastColumn
call WriteLog
mov rcx,48 ;xCell
sub cl,bl
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

lea rcx,szVertices
call WriteLog
mov rcx,r10 ;nVertexCount
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

lea rcx,szIndices
call WriteLog
mov rcx,r11 ;nIndexCount
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

EPILOG
BuildGeometry endp


