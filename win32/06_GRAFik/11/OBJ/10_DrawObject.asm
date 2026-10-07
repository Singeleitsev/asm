;1. External Cylinder
call glPushMatrix
invoke glRotatef,autoAngle,0,0,3f800000h
invoke DrawVoxelCylinder,fRadiusOuter,48,4,fCubeSize,fLayerHeight
call glPopMatrix

;2. Internal Cylinder
call glPushMatrix
mov eax, autoAngle2
xor eax, 80000000h ;eax = -autoAngle2
mov fTemp, eax
invoke glRotatef,fTemp,0,0,3f800000h
invoke DrawVoxelCylinder,fRadiusInner,36,4,fCubeSize,fLayerHeight
call glPopMatrix