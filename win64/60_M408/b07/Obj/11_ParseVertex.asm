parseVertex proc
PROLOG 100h

add rsi,2 ;Skip "v "

;x
call ParseFloat
xor rdi,rdi
mov edi,gnCurrentVertexCount
imul edi,edi,0Ch ;dwPosCount*12
add rdi,gpObjVertices
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12

;y
call ParseFloat
add rdi,4
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12 + 4

;z
call ParseFloat
add rdi,4
movss dword ptr[rdi],xmm0 ;gpPositions + dwPosCount*12 + 8

inc gnCurrentVertexCount

EPILOG
parseVertex endp
