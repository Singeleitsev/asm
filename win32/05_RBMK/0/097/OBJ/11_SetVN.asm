SetVN proc
;Input:
;ecx = i
;xmm0 = x,  xmm1 = y,  xmm2 = z,
;xmm3 = nx, xmm4 = ny, xmm5 = nz

lea edi,capV
mov eax,ecx ;i
imul eax,eax,12 ;*4 bytes * 3 slots
add edi,eax

;capV(i*3 + 0) = x
movss dword ptr[edi+00],xmm0
;capV(i*3 + 1) = y
movss dword ptr[edi+04],xmm1
;capV(i*3 + 2) = z
movss dword ptr[edi+08],xmm2

lea edi,capN
;mov eax,ecx ;Already Done
;imul eax,eax,12 ;*4 bytes * 3 slots
add edi,eax

;capN(i*3 + 0) = nx
movss dword ptr[edi+00],xmm3
;capN(i*3 + 1) = ny
movss dword ptr[edi+04],xmm4
;capN(i*3 + 2) = nz
movss dword ptr[edi+08],xmm5

ret
SetVN endp

