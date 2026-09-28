DrawScene proc

;1.1. Setup Lighting
invoke glEnable,0B50h ;GL_LIGHTING

invoke glEnable,4000h ;GL_LIGHT0

push offset lightAmbient
push 1200h ;GL_AMBIENT
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightDiffuse
push 1201h ;GL_DIFFUSE
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightSpecular
push 1202h ;GL_SPECULAR
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightPosition
push 1203h ;GL_POSITION
push 4000h ;GL_LIGHT0
call glLightfv

;1.2. Set Materials
push 1602h ;GL_AMBIENT_AND_DIFFUSE
push 408h ;GL_FRONT_AND_BACK
call glColorMaterial

push 0B57h ;GL_COLOR_MATERIAL
call glEnable

push offset lightSpecular
push 1202h ;GL_SPECULAR
push 0408h ;GL_FRONT_AND_BACK
call glMaterialfv

push 3f000000h ;0.5
push 1601h ;GL_SHININESS
push 0408h ;GL_FRONT_AND_BACK
call glMaterialf

;2.1. Activate the Projection Matrix
push 1701h ;GL_PROJECTION
call glMatrixMode

;2.2. Load the current Projection matrix
push offset mtxProjectionVolatile
call glLoadMatrixf

;3.1. Activate the ModelView Matrix
push 1700h ;GL_MODELVIEW
call glMatrixMode

;3.2. Load the current Camera matrix
push offset mtxCameraVolatile
call glLoadMatrixf

;3.3. Multiply by the current Object matrix
push offset mtxObjectVolatile
call glMultMatrixf

;4.1. Select the background color
;push 0 ;a
;push 0 ;b
;push 0 ;g
;push 3f800000h ;r
;call glClearColor

;4.2. Clear the Frame
push 4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;5.Axes
invoke glDisable,0B57h ;GL_COLOR_MATERIAL
invoke glDisable,0B50h; GL_LIGHTING
invoke glBegin,1 ;GL_LINES
;X - Red
invoke glColor3f,3f800000h,0,0
invoke glVertex3f,0,0,0
invoke glVertex3f,447a0000h,0,0 ;1000.0, 0.0, 0.0
;Y- Green
invoke glColor3f,0,3f800000h,0
invoke glVertex3f,0,0,0
invoke glVertex3f,0,447a0000h,0 ;0.0, 1000.0, 0.0
;Z - Blue
invoke glColor3f,0,0,3f800000h
invoke glVertex3f,0,0,0
invoke glVertex3f,0,0,447a0000h ;0.0, 0.0, 1000.0,
call glEnd
invoke glEnable,0B50h; GL_LIGHTING
invoke glEnable,0B57h  ;GL_COLOR_MATERIAL

;6.1. Select the Floor Color
push 0 ;b
push 0 ;g
push 3ecccccdh ;r = 0.4
call glColor3f

;6.2. Draw the floor without culling
invoke glDisable,0B44h ;GL_CULL_FACE

invoke glBegin,7 ;GL_QUADS
;v0
push 0
push 0c5bb8000h ;y = -6000
push 0c5bb8000h ;x = -6000
call glVertex3f
;v1
push 0
push 0c5bb8000h ;y = -6000
push 45bb8000h  ;x = 6000
call glVertex3f
;v2
push 0
push 45bb8000h  ;y = 6000
push 45bb8000h  ;x = 6000
call glVertex3f
;v3
push 0
push 45bb8000h  ;y = 6000
push 0c5bb8000h ;x = -6000
call glVertex3f
call glEnd

invoke glEnable,0B44h ;GL_CULL_FACE

;7. Draw Custom Blocks

;7.1. External Cylinder
call glPushMatrix
invoke glRotatef,autoAngle,0,0,3f800000h
invoke DrawVoxelCylinder,fRadiusOuter,48,4,fCubeSize,fLayerHeight
call glPopMatrix

;7.2. Internal Cylinder
call glPushMatrix
mov eax, autoAngle2
xor eax, 80000000h ;eax = -autoAngle2
mov fTemp, eax
invoke glRotatef,fTemp,0,0,3f800000h
invoke DrawVoxelCylinder,fRadiusInner,36,4,fCubeSize,fLayerHeight
call glPopMatrix

;8. Swap the buffers
push ghDC
call SwapBuffers

;9. Update the Indicators
call RefreshTitle

;9.1. Get the Camera's World Position
invoke GetGlobalOrigin,offset mtxCameraVolatile,offset vecCamPos
;9.2. Get the Object's World Position
invoke GetGlobalOrigin,offset mtxObjectVolatile,offset vecObjPos
call RefreshStatus

;10. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
ret
DrawScene endp

