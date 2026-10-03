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


