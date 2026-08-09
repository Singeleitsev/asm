parseVertex proc
PROLOG 100h

;Skip "v "
add gpObjDataCurrent,2

;x
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
xor rdi,rdi
mov edi,gnCurrentVertexCount
imul edi,edi,0Ch ;dwPosCount*12
add rdi,gpObjVertices
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12

;y
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
add rdi,4
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12 + 4

;z
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
add rdi,4
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12 + 8

inc gnCurrentVertexCount

EPILOG
parseVertex endp
