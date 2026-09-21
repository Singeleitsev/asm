parseNormal proc
PROLOG 100h

;Skip "vn "
add gpObjDataCurrent,3

;x
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
xor rdi,rdi
mov edi,gnCurrentNormalCount
imul edi,edi,0Ch ;dwNormCount*12
add rdi,gpObjNormals
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12

;y
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
add rdi,4
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12 + 4

;z
mov rcx,gpObjDataCurrent
call parseFloat
mov gpObjDataCurrent,rax
add rdi,4
movss dword ptr[rdi],xmm0 ;gpNormals + dwNormCount*12 + 8]

inc gnCurrentNormalCount

EPILOG
parseNormal endp