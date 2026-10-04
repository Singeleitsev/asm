BuildGeometry proc
PROLOG 100h

call GetProcessHeap
mov ghProcessHeap,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,RBMK_TOTAL_VERTICES ;1888 channels * 5 quads * 4 vertices * 3 coords * 4 bytes = 453120
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
mov gpVertices,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,RBMK_TOTAL_VERTICES
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
mov gpNormals,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,RBMK_TOTAL_VERTICES
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
mov gpColors,rax

xor r15,r15 ;nCount = 0
xor r14,r14 ;nCap = 0
xor r13,r13 ;nBytesWritten = 0

;For r = 1 To nRows
xor r11,r11 ;yCell = 0
NextRow:

;For c = 1 To nCols
xor r10,r10 ;xCell = 0
NextColumn:

;Color = CellCode(vals(r, c))
lea rcx,Layout
add rcx,r15 ;nCount
mov al,byte ptr[rcx] ;al = Color

cmp al,1 ;Lead
jne @f
lea rcx,Gray
jmp SetColor
@@:
cmp al,2 ;Green
jne @f
lea rcx,Green
jmp SetColor
@@:
cmp al,3 ;Yellow
jne @f
lea rcx,Yellow
jmp SetColor
@@:
cmp al,4 ;Red
jne @f
lea rcx,Red
jmp SetColor
@@:
cmp al,5 ;Blue
jne NextCell ;Color = 0 or something else
lea rcx,Blue

SetColor:
movss xmm10,dword ptr[rcx+00] ;xmm10 = red
movss xmm11,dword ptr[rcx+04] ;xmm11 = green
movss xmm12,dword ptr[rcx+08] ;xmm12 = blue

;xi = ORIGIN_X + c * CAP_STEP
cvtsi2ss xmm0,r10d ;xCell
mulss xmm0,ChannelGrid
addss xmm0,xOrigin
;yi = ORIGIN_Y + r * CAP_STEP
cvtsi2ss xmm1,r11d ;yCell
mulss xmm1,ChannelGrid
addss xmm1,yOrigin

;For nQuad = 0 To 19
xor r12,r12 ;nQuad = 0
WriteQuad:

mov rax,r12 ;nQuad
imul eax,eax,12 ;*3 coordinates * 4 bytes

;Coordinates
mov rdi,gpVertices
add rdi,r13 ;nBytesWritten
add rdi,rax

lea rsi,capV
add rsi,rax

;gpVertices(base + i*3 + 0) = capV(i*3 + 0) + xi
movss xmm2,dword ptr[rsi+0]
addss xmm2,xmm0
movss dword ptr[rdi+0],xmm2
;gpVertices(base + i*3 + 1) = capV(i*3 + 1) + yi
movss xmm3,dword ptr[rsi+4]
addss xmm3,xmm1
movss dword ptr[rdi+4],xmm3
;gpVertices(base + i*3 + 2) = capV(i*3 + 2)
movss xmm4,dword ptr[rsi+8]
movss dword ptr[rdi+8],xmm4

;Normals
mov rdi,gpNormals
add rdi,r13 ;nBytesWritten
add rdi,rax

lea rsi,capN
add rsi,rax
;gpNormals(base + i*3 + 0) = capN(i*3 + 0)
movss xmm5,dword ptr[rsi+0]
movss dword ptr[rdi+0],xmm5
;gpNormals(base + i*3 + 1) = capN(i*3 + 1)
movss xmm6,dword ptr[rsi+4]
movss dword ptr[rdi+4],xmm6
;gpNormals(base + i*3 + 2) = capN(i*3 + 2)
movss xmm7,dword ptr[rsi+8]
movss dword ptr[rdi+8],xmm7

;Colors
mov rdi,gpColors
add rdi,r13 ;nBytesWritten
add rdi,rax

;gpColors(base + i*3) = Red
movss dword ptr[rdi+0],xmm10
;gpColors(base + i*3 + 1) = Green
movss dword ptr[rdi+4],xmm11
;gpColors(base + i*3 + 2) = Blue
movss dword ptr[rdi+8],xmm12

;Next nQuad
inc r12 ;nQuad
cmp r12,20 ;nQuad = [0..19]
jl WriteQuad

;Count the Cap
inc r14 ;nCap

;nBytesWritten + (5 quads * 4 vertices * 3 coordinates * 4 bytes)
add r13,240

NextCell:
inc r15 ;nCount

;Next Column
inc r10 ;xCell
cmp r10,48 ;xCell = [0..47]
jl NextColumn

;Next Row
inc r11 ;yCell
cmp r11,48 ;yCell = [0..47]
jl NextRow

;Post Check
cmp r13,RBMK_TOTAL_VERTICES ;nBytesWritten = 1888 channels * 5 quads * 4 vertices * 3 coords * 4 bytes = 453120
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
mov rcx,r11 ;yCell
call WriteDecimalToLog

lea rcx,szLastColumn
call WriteLog
mov rcx,r10 ;xCell
call WriteDecimalToLog

lea rcx,szBytesWritten
call WriteLog
mov rcx,r13 ;nBytesWritten
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

EPILOG
BuildGeometry endp


