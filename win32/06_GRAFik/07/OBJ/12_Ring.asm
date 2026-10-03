DrawVoxelRing proc vRadius:REAL4, vCount:DWORD, vCubeSize:REAL4, vHeight:REAL4, vZBase:REAL4, vSeed:DWORD
LOCAL i:DWORD, ang:REAL4, sVal:REAL4, cVal:REAL4, xPos:REAL4, yPos:REAL4, rCol:REAL4, gCol:REAL4, bCol:REAL4, idx:DWORD

mov i, 0

@RingLoop:
mov eax, i
cmp eax, vCount
jge @RingEnd

;ang = (i * 2*pi) / vCount
cvtsi2ss xmm0, eax ;xmm0 = (float)i
mulss xmm0, fTwoPi ;xmm0 = i * 2*pi
cvtsi2ss xmm1, vCount ;xmm1 = (float)vCount
divss xmm0, xmm1 ;xmm0 = ang
movss ang, xmm0

;sVal = sin(ang), cVal = cos(ang)
fld ang
fsincos
fstp cVal
fstp sVal

;xPos = vRadius * cVal
movss xmm2, vRadius
mulss xmm2, cVal; ;xmm2 = vRadius * cVal
movss xPos, xmm2

;yPos = vRadius * sVal
movss xmm3, vRadius
mulss xmm3, sVal ;xmm3 = vRadius * sVal
movss yPos, xmm3

;idx = (i + vSeed) % 6
mov eax, i
add eax, vSeed
xor edx, edx
mov ecx, 6
div ecx
mov idx, edx

;colorTable lookup
mov eax, idx
mov ecx, 3
mul ecx
shl eax, 2
lea ebx, colorTable
add ebx, eax
movss xmm4, [ebx+0] ;r
movss xmm5, [ebx+4] ;g
movss xmm6, [ebx+8] ;b
movss rCol, xmm4
movss gCol, xmm5
movss bCol, xmm6

invoke DrawCube,xPos,yPos,vZBase,vCubeSize,vCubeSize,vHeight,rCol,gCol,bCol

inc i
jmp @RingLoop

@RingEnd:
ret
DrawVoxelRing endp


