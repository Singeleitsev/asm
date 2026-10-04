BuildLightingDisplayList proc
PROLOG 100h

;1. Create the new Display List for Lighting
mov rcx,DISPLAY_LIST_LIGHTING
mov rdx,4864h ;GL_COMPILE
call glNewList

;2.1. Setup Lighting
mov rcx,0B50h ;GL_LIGHTING
call glEnable

mov rcx,4000h ;GL_LIGHT0
call glEnable

mov rcx,4000h ;GL_LIGHT0
mov rdx,1200h ;GL_AMBIENT
lea r8,lightAmbient
call glLightfv

mov rcx,4000h ;GL_LIGHT0
mov rdx,1201h ;GL_DIFFUSE
lea r8,lightDiffuse
call glLightfv

mov rcx,4000h ;GL_LIGHT0
mov rdx,1202h ;GL_SPECULAR
lea r8,lightSpecular
call glLightfv

;2.2. Set Materials to Lighting
mov rcx,408h ;GL_FRONT_AND_BACK
mov rdx,1602h ;GL_AMBIENT_AND_DIFFUSE
call glColorMaterial

mov rcx,0B57h ;GL_COLOR_MATERIAL
call glEnable

mov rcx,0408h ;GL_FRONT_AND_BACK
mov rdx,1202h ;GL_SPECULAR
lea r8,lightSpecular
call glMaterialfv

mov rcx,0408h ;GL_FRONT_AND_BACK
mov rdx,1601h ;GL_SHININESS
mov r8,3f000000h ;0.5
call glMaterialf

call glEndList
EPILOG
BuildLightingDisplayList endp

