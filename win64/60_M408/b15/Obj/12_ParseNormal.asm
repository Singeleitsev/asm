parseNormal proc
PROLOG 100h

;Skip "vn "
add rsi,3

;x
call ParseFloat
xor rdi,rdi
mov edi,gnCurrentNormalCount
imul edi,edi,0Ch ;dwNormCount*12
add rdi,gpObjNormals
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12

;y
call ParseFloat
add rdi,4
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12 + 4

;z
call ParseFloat
add rdi,4
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12 + 8]

inc gnCurrentNormalCount

EPILOG
parseNormal endp