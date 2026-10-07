;Axes

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


