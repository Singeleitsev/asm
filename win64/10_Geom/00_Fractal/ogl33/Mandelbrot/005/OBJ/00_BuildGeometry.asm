BuildGeometry proc
PROLOG 100h

;rax = common purpose
;rbx = common purpose
;rcx = common purpose
;rdx = common purpose
;rsi = pVertexArray
;rdi = pIndexArray
;r8 = pCurrentVertex
;r9 = pCurrentIndex
;r10 = nVertexCount
;r11 = nIndexCount
;r12 = common purpose

call GetProcessHeap
mov ghProcessHeap,rax

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,VERTEX_ARRAY_SIZE ;see constant.asm
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
mov r8,INDEX_ARRAY_SIZE ;see constant.asm
call HeapAlloc
test rax,rax
jz BuildGeometry_Error
;Store the Global pointer
mov gpIndices,rax

;Set the Source address
lea rsi,VertexArray
;Set the Destination address
mov r8,gpVertices ;pCurrentVertex
;Load the Counter
mov r10,TOTAL_VERTICES

NextVertex:
;Coordinates
mov eax,dword ptr[rsi+00] ;x
mov dword ptr[r8+00],eax
mov eax,dword ptr[rsi+04] ;y
mov dword ptr[r8+04],eax
mov eax,dword ptr[rsi+08] ;z
mov dword ptr[r8+08],eax
;Normal
mov eax,dword ptr[rsi+12] ;nx
mov dword ptr[r8+12],eax
mov eax,dword ptr[rsi+16] ;ny
mov dword ptr[r8+16],eax
mov eax,dword ptr[rsi+20] ;nz
mov dword ptr[r8+20],eax
;Color
mov eax,dword ptr[rsi+24] ;r
mov dword ptr[r8+24],eax
mov eax,dword ptr[rsi+28] ;g
mov dword ptr[r8+28],eax
mov eax,dword ptr[rsi+32] ;b
mov dword ptr[r8+32],eax
add rsi,STRIDE
add r8,STRIDE
dec r10
jnz NextVertex

;Set the Source address
lea rdi,IndexArray
;Set the Destination address
mov r9,gpIndices ;pCurrentIndex
;Load the Counter
mov r11,TOTAL_INDICES

NextIndex:
mov ax,word ptr[rdi]
mov word ptr[r9],ax
add rdi,2 ;sizeof(word)
add r9,2 ;sizeof(word)
dec r11
jnz NextIndex

;Post Check
sub r8,gpVertices ;nBytesWritten = pCurrentVertex - gpVertices
cmp r8,VERTEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error
sub r9,gpIndices ;nBytesWritten = pCurrentIndex - gpIndices
cmp r9,INDEX_ARRAY_SIZE ;see constant.asm
jne BuildGeometry_Error

;Success
lea rcx,szLogDataLoaded
call WriteLog
jmp BuildGeometry_End

BuildGeometry_Error:
lea rcx,szErrDataLoading
call WriteLog

BuildGeometry_End:

lea rcx,szVertices
call WriteLog
mov rcx,TOTAL_VERTICES
sub rcx,r10 ;nVertexCount
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

lea rcx,szIndices
call WriteLog
mov rcx,TOTAL_INDICES
sub rcx,r11 ;nIndexCount
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

EPILOG
BuildGeometry endp


