;40_Voxel - цилиндры из кубиков
DrawCube proc xCenter:REAL4, yCenter:REAL4, zCenter:REAL4, xSize:REAL4, ySize:REAL4, zSize:REAL4, red:REAL4, green:REAL4, blue:REAL4

LOCAL x0:REAL4, x1:REAL4, y0:REAL4, y1:REAL4, z0:REAL4, z1:REAL4

;Load centers and sizes into XMM registers
movss xmm0, xCenter ;xmm0 = xCenter
movss xmm1, xSize ;xmm1 = xSize
movss xmm2, yCenter ;xmm2 = yCenter
movss xmm3, ySize ;xmm3 = ySize
movss xmm4, fHalf ;xmm4 = 0.5

;Compute xSize*0.5 and ySize*0.5
mulss xmm1, xmm4 ;xmm1 = xSize * 0.5
mulss xmm3, xmm4 ;xmm3 = ySize * 0.5

;x0 = xCenter - xSize*0.5
movaps xmm5, xmm0 ;xmm5 = xCenter
subss xmm5, xmm1 ;xmm5 = xCenter - xSize*0.5
movss x0, xmm5

;x1 = xCenter + xSize*0.5
movaps xmm6, xmm0 ;xmm6 = xCenter
addss xmm6, xmm1 ;xmm6 = xCenter + xSize*0.5
movss x1, xmm6

;y0 = yCenter - ySize*0.5
movaps xmm5, xmm2 ;xmm5 = yCenter
subss xmm5, xmm3 ;xmm5 = yCenter - ySize*0.5
movss y0, xmm5

;y1 = yCenter + ySize*0.5
movaps xmm6, xmm2 ;xmm6 = yCenter
addss xmm6, xmm3 ;xmm6 = yCenter + ySize*0.5
movss y1, xmm6

;z0 = zCenter
movss xmm0, zCenter
movss z0, xmm0

;z1 = zCenter + zSize
addss xmm0, zSize
movss z1, xmm0

invoke glColor3f, red, green, blue

;3. Рисуем 12 треугольников
invoke glBegin, 4 ;GL_TRIANGLES

;FRONT (outward −Z) 
;Нормаль: (0, 0, -1)
push 0bf800000h ;z  -1.0
push 0 ;y  0.0
push 0 ;x  0.0
call glNormal3f
;tri 1: (x0,y0,z0) -> (x0,y1,z0) -> (x1,y1,z0)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x0, y1, z0
invoke glVertex3f, x1, y1, z0
;tri 2: (x0,y0,z0) -> (x1,y1,z0) -> (x1,y0,z0)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x1, y1, z0
invoke glVertex3f, x1, y0, z0

;BACK (outward +Z) 
;Нормаль: (0, 0, 1)
push 3f800000h ;z  1.0
push 0 ;y  0.0
push 0 ;x  0.0
call glNormal3f
;tri 1: (x0,y0,z1) -> (x1,y0,z1) -> (x1,y1,z1)
invoke glVertex3f, x0, y0, z1
invoke glVertex3f, x1, y0, z1
invoke glVertex3f, x1, y1, z1
;tri 2: (x0,y0,z1) -> (x1,y1,z1) -> (x0,y1,z1)
invoke glVertex3f, x0, y0, z1
invoke glVertex3f, x1, y1, z1
invoke glVertex3f, x0, y1, z1

;BOTTOM (outward −Y) 
;Нормаль: (0, -1, 0)
push 0 ;z  0.0
push 0bf800000h ;y  -1.0
push 0 ;x  0.0
call glNormal3f
;tri 1: (x0,y0,z0) -> (x1,y0,z0) -> (x1,y0,z1)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x1, y0, z0
invoke glVertex3f, x1, y0, z1
;tri 2: (x0,y0,z0) -> (x1,y0,z1) -> (x0,y0,z1)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x1, y0, z1
invoke glVertex3f, x0, y0, z1

;TOP (outward +Y) 
;Нормаль: (0, 1, 0)
push 0 ;z  0.0
push 3f800000h ;y  1.0
push 0 ;x  0.0
call glNormal3f
;tri 1: (x0,y1,z0) -> (x0,y1,z1) -> (x1,y1,z1)
invoke glVertex3f, x0, y1, z0
invoke glVertex3f, x0, y1, z1
invoke glVertex3f, x1, y1, z1
;tri 2: (x0,y1,z0) -> (x1,y1,z1) -> (x1,y1,z0)
invoke glVertex3f, x0, y1, z0
invoke glVertex3f, x1, y1, z1
invoke glVertex3f, x1, y1, z0

;LEFT (outward −X) 
;Нормаль: (-1, 0, 0)
push 0 ;z  0.0
push 0 ;y  0.0
push 0bf800000h ;x  -1.0
call glNormal3f
;tri 1: (x0,y0,z0) -> (x0,y0,z1) -> (x0,y1,z1)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x0, y0, z1
invoke glVertex3f, x0, y1, z1
;tri 2: (x0,y0,z0) -> (x0,y1,z1) -> (x0,y1,z0)
invoke glVertex3f, x0, y0, z0
invoke glVertex3f, x0, y1, z1
invoke glVertex3f, x0, y1, z0

;RIGHT (outward +X) 
;Нормаль: (1, 0, 0)
push 0 ;z  0.0
push 0 ;y  0.0
push 3f800000h ;x  1.0
call glNormal3f
;tri 1: (x1,y0,z0) -> (x1,y1,z0) -> (x1,y1,z1)
invoke glVertex3f, x1, y0, z0
invoke glVertex3f, x1, y1, z0
invoke glVertex3f, x1, y1, z1
;tri 2: (x1,y0,z0) -> (x1,y1,z1) -> (x1,y0,z1)
invoke glVertex3f, x1, y0, z0
invoke glVertex3f, x1, y1, z1
invoke glVertex3f, x1, y0, z1

call glEnd

ret
DrawCube endp



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



DrawVoxelCylinder proc cylRadius:REAL4, cylCount:DWORD, cylLayers:DWORD, cylCubeSize:REAL4, cylLayerH:REAL4

LOCAL layer:DWORD, zPos:REAL4, seedVal:DWORD

mov layer,0

@LayerLoop:
mov eax,layer
cmp eax,cylLayers
jge @LayerEnd

cvtsi2ss xmm0, layer ;xmm0 = (float)layer
mulss xmm0, cylLayerH ;xmm0 = layer * cylLayerH
movss zPos, xmm0

mov eax,layer
mov ecx,3
mul ecx
mov seedVal,eax

invoke DrawVoxelRing,cylRadius,cylCount,cylCubeSize,cylLayerH,zPos,seedVal

inc layer
jmp @LayerLoop

@LayerEnd:
ret
DrawVoxelCylinder endp


