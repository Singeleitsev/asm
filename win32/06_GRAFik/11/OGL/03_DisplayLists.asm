BuildLightingDisplayList proc

;1. Create the new Display List for Lighting
push 4864h ;GL_COMPILE
push DISPLAY_LIST_LIGHTING
call glNewList

;2.1. Setup Lighting
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

;2.2. Set Materials to Lighting
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

call glEndList
ret
BuildLightingDisplayList endp

