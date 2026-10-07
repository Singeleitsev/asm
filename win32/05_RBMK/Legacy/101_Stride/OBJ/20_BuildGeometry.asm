BuildGeometry proc
LOCAL xCell:DWORD, yCell:DWORD, nBytesWritten:DWORD

call GetProcessHeap
mov ghProcessHeap,eax

push RBMK_ARRAY_SIZE ;1359360 bytes (see constant.asm)
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz BuildGeometry_Error
;Set the Destination (Interleaved Array) address
mov edi,eax
;Store the global pointers
mov gpVertices,eax
;offset 12 bytes = 3 vertex coordinates * 4 bytes
add eax,12 
mov gpNormals,eax
;offset 12 bytes = 3 normal coordinates * 4 bytes
add eax,12 
mov gpColors,eax

;Set the Source (Cap Pattern) address
lea esi,CapPattern

;Set the Look-Up Table address
lea ecx,Layout

;For r = 1 To nRows
xor ebx,ebx ;mov yCell,0
NextRow:

;For c = 1 To nCols
xor edx,edx ;mov xCell,0
NextColumn:

;Color = Layout(r, c)
mov al, byte ptr[ecx] ;al = Color

cmp al,1 ;Lead
jne @f
lea eax,Gray
jmp SetColor
@@:
cmp al,2 ;Green
jne @f
lea eax,Green
jmp SetColor
@@:
cmp al,3 ;Yellow
jne @f
lea eax,Yellow
jmp SetColor
@@:
cmp al,4 ;Red
jne @f
lea eax,Red
jmp SetColor
@@:
cmp al,5 ;Blue
jne NextCell ;Color = 0 or something else
lea eax,Blue

SetColor:
movss xmm5,dword ptr[eax+0] ;Red
movss xmm6,dword ptr[eax+4] ;Green
movss xmm7,dword ptr[eax+8] ;Blue

;xi = xOrigin + c * dChannelGrid
cvtsi2ss xmm0,edx ;dword ptr[xCell]
mulss xmm0,dChannelGrid
addss xmm0,xOrigin
;yi = yOrigin + r * dChannelGrid
cvtsi2ss xmm1,ebx ;dword ptr[yCell]
mulss xmm1,dChannelGrid
addss xmm1,yOrigin

;For nQuad = 0 To 19
xor eax,eax

WriteQuad:

;xv and yv coordinates vary depending on the cap's position
;They are computed and sent separately

;xv = gpVertices(0) = pCapPattern(0) + xi
movss xmm2,dword ptr[esi+0]
addss xmm2,xmm0 ;x
movss dword ptr[edi+0],xmm2
;yv = gpVertices(4) = pCapPattern(4) + yi
movss xmm3,dword ptr[esi+4]
addss xmm3,xmm1 ;y
movss dword ptr[edi+4],xmm3

;zv coordinate and nx,ny,nz coordinates are constant
;fortunately, their total size is 4*4 bytes
;which can be passed with one xmm instruction

;gpVertices(8) = pCapPattern(8)
;gpNormals(0) = gpVertices(12) = pCapPattern(12)
;gpNormals(4) = gpVertices(16) = pCapPattern(16)
;gpNormals(8) = gpVertices(20) = pCapPattern(20)
movups xmm4,oword ptr[esi+8]
movups oword ptr[edi+8],xmm4

;Colors can not be passed by a single xmm instruction
;because there are only 3 of them in gpColors array

;gpColors(0) = gpVertices(24) = red
movss dword ptr[edi+24],xmm5
;gpColors(4) = gpVertices(28) = green
movss dword ptr[edi+28],xmm6
;gpColors(8) = gpVertices(32) = blue
movss dword ptr[edi+32],xmm7

;Advance source address
add esi,24 ;24 bytes = 3*4 (coords) + 3*4 (normals)
;Advance destination address
add edi,STRIDE ;36 bytes = 3*4 (coords) + 3*4 (normals) * 3*4 (colors)

;Next nQuad
inc eax
cmp eax,20 ;Have we finished the source? 
jl WriteQuad

sub esi,480 ;Restore the source

NextCell:
inc ecx

;Next Column
inc edx ;xCell
cmp edx,48
jl NextColumn

;Next Row
inc ebx ;yCell
cmp ebx,48
jl NextRow

;Post Check
mov yCell,ebx
mov xCell,edx
mov esi,gpVertices ;Back to the start
sub edi,esi ;Compute the progress
mov nBytesWritten,edi
cmp edi,RBMK_ARRAY_SIZE ;1359360 bytes (see constant.asm)
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
invoke WriteDecimalToLog,nBytesWritten
invoke WriteLog,offset szCRLF

ret
BuildGeometry endp


