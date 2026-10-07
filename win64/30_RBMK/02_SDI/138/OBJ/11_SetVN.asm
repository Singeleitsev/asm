;Input:
;rcx = i
;xmm0 = x,  xmm1 = y,  xmm2 = z,
;xmm3 = nx, xmm4 = ny, xmm5 = nz

SetVN proc
PROLOG 100h

lea rdi,capV
imul ecx,ecx,12 ;i * 4 bytes * 3 slots
add rdi,rcx

;capV(i * 3) = x
movss dword ptr[rdi+00],xmm0
;capV(i * 3 + 1) = y
movss dword ptr[rdi+04],xmm1
;capV(i * 3 + 2) = z
movss dword ptr[rdi+08],xmm2

lea rdi,capN
;imul ecx,ecx,12 ;Already Done
add rdi,rcx

;capN(i * 3) = nx
movss dword ptr[rdi+00],xmm3
;capN(i * 3 + 1) = ny
movss dword ptr[rdi+04],xmm4
;capN(i * 3 + 2) = nz
movss dword ptr[rdi+08],xmm5

EPILOG
SetVN endp

