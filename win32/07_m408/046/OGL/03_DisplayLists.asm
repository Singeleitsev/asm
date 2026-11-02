BuildLightingDisplayList proc

;1. Create the new Display List for Lighting
push 4864h ;GL_COMPILE
push DISPLAY_LIST_LIGHTING
call glNewList

;2. Setup Lighting
invoke glEnable,0B50h ;GL_LIGHTING

;Global ambient (replaces per-light ambient)
push offset globalAmbient
push 1200h ;GL_LIGHT_MODEL_AMBIENT
call glLightModelfv

;Two-sided lighting so the interior is lit correctly
invoke glLightModeli,0B52h,1 ;GL_LIGHT_MODEL_TWO_SIDE, GL_TRUE

;Local viewer for nicer specular at grazing angles
invoke glLightModeli,0B51h,1 ;GL_LIGHT_MODEL_LOCAL_VIEWER, GL_TRUE

;LIGHT0: key
invoke glEnable,4000h ;GL_LIGHT0

push offset keyAmbient
push 1200h ;GL_AMBIENT
push 4000h ;GL_LIGHT0
call glLightfv

push offset keyDiffuse
push 1201h ;GL_DIFFUSE
push 4000h ;GL_LIGHT0
call glLightfv

push offset keySpecular
push 1202h ;GL_SPECULAR
push 4000h ;GL_LIGHT0
call glLightfv

push offset keyPosition
push 1203h ;GL_POSITION
push 4000h ;GL_LIGHT0
call glLightfv

;LIGHT1: fill
invoke glEnable,4001h ;GL_LIGHT1

push offset fillDiffuse
push 1201h ;GL_DIFFUSE
push 4001h ;GL_LIGHT1
call glLightfv

push offset fillSpecular
push 1202h ;GL_SPECULAR
push 4001h ;GL_LIGHT1
call glLightfv

push offset fillPosition
push 1203h ;GL_POSITION
push 4001h ;GL_LIGHT1
call glLightfv

;LIGHT2: rim
invoke glEnable,4002h ;GL_LIGHT2

push offset rimDiffuse
push 1201h ;GL_DIFFUSE
push 4002h ;GL_LIGHT2
call glLightfv

push offset rimSpecular
push 1202h ;GL_SPECULAR
push 4002h ;GL_LIGHT2
call glLightfv

push offset rimPosition
push 1203h ;GL_POSITION
push 4002h ;GL_LIGHT2
call glLightfv

;3. Set Materials to Lighting
push 1601h ;GL_DIFFUSE
push 0408h ;GL_FRONT_AND_BACK
call glColorMaterial

invoke glEnable,0B57h ;GL_COLOR_MATERIAL

;4. Protect from future matrix changes
invoke glEnable,0BA1h ;GL_NORMALIZE

call glEndList
ret
BuildLightingDisplayList endp


