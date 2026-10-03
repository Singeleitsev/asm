SetVN proc i:DWORD, x:REAL4,y:REAL4,z:REAL4, nx:REAL4,ny:REAL4,nz:REAL4

lea eax,capV
mov ecx,i
imul ecx,ecx,12 ;*4 bytes * 3 slots
add eax,ecx

;capV(i * 3) = x
mov edx,dword ptr[x]
mov dword ptr[eax+00],edx

;capV(i * 3 + 1) = y
mov edx,dword ptr[y]
mov dword ptr[eax+04],edx

;capV(i * 3 + 2) = z
mov edx,dword ptr[z]
mov dword ptr[eax+08],edx

lea eax,capN
mov ecx,i
imul ecx,ecx,12 ;*4 bytes * 3 slots
add eax,ecx

;capN(i * 3) = nx
mov edx,dword ptr[nx]
mov dword ptr[eax+00],edx

;capN(i * 3 + 1) = ny
mov edx,dword ptr[ny]
mov dword ptr[eax+04],edx

;capN(i * 3 + 2) = nz
mov edx,dword ptr[nz]
mov dword ptr[eax+08],edx

ret
SetVN endp

