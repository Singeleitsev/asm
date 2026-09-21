SetView proc

;Update OpenGL Viewport
cmp ghRC,0
je SetView_End
invoke glViewport,0,0,gRectClientWidth,gRectClientHeight

;Activate the Projection Matrix
push 1701h ;GL_PROJECTION
call glMatrixMode

;Reset the Projection Matrix
call glLoadIdentity

;Set the Perspective
;Call gluPerspective(90, RectAspect, 1, 1000000)
;zFar = 1000000.0
push dword ptr [zFar+4] ;high dword
push dword ptr [zFar] ;low dword
;zNear = 1.0
push dword ptr [zNear+4]
push dword ptr [zNear]
;aspect = Width/Height
push dword ptr [gRectClientAspect+4]
push dword ptr [gRectClientAspect]
;fovy = 90.0
push dword ptr [fovy+4]
push dword ptr [fovy]
call gluPerspective

;Activate the ModelView Matrix
push 1700h ;GL_MODELVIEW
call glMatrixMode

;Reset the ModelView Matrix
call glLoadIdentity

;Move the Entire Scene to Make it Visible in the Frame
;Call glTranslatef(0, 1500, -9000)
push 0c60ca000h ;z = -9000.0f
push 44bb8000h ;y = 1500.0f
push 0 ;x = 0.0f
call glTranslatef

;Rotate the Entire Scene to Make it Visible in the Frame
;Call glRotatef(300, 1, 0, 0)  'Model Tilt
push 0 ;zPivot = 0.0f
push 0 ;yPivot = 0.0f
push 3f800000h ;xPivot = 1.0f
push 43960000h ;Angle = 300.0f
call glRotatef

;Rotate the Entire Scene to the Default Position
;Call glRotatef(20, 0, 0, 1) 'Model Turn
push 3f800000h ;zPivot = 1.0f
push 0 ;yPivot = 0.0f
push 0 ;xPivot = 0.0f
push 41a00000h ;Angle = 20.0f
call glRotatef

;Set the Flag to Make the Esc Key Work by the Rule:
;First Esc Hit - Rotate the Entire Scene to the Default Position
;Second Esc Hit - Close the Window
mov isInitialPosition,1

;Set the Flag to ReDraw the Scene
mov isRefreshed,0

SetView_End:
ret
SetView endp

