lblDrawQuad:

;Reset The Current Modelview Matrix
call glLoadIdentity


;glTranslatef(1.5f,0.0f,-7.0f) // Move Right1.5 Units And Into The Screen 7.0
;glRotatef(rquad,1.0f,1.0f,1.0f) // Rotate The Quad On The X axis ( NEW )
;glBegin(GL_QUADS) // Draw A Quad
;glColor3f(0.0f,1.0f,0.0f) // Set The Color To Green
;glVertex3f(1.0f,1.0f,-1.0f) // Top Right Of The Quad (Top)
;glVertex3f(-1.0f,1.0f,-1.0f) // Top Left Of The Quad (Top)
;glVertex3f(-1.0f,1.0f,1.0f) // Bottom Left Of The Quad (Top)
;glVertex3f(1.0f,1.0f,1.0f) // Bottom Right Of The Quad (Top)
;glColor3f(1.0f,0.5f,0.0f) // Set The Color To Orange
;glVertex3f(1.0f,-1.0f,1.0f) // Top Right Of The Quad (Bottom)
;glVertex3f(-1.0f,-1.0f,1.0f) // Top Left Of The Quad (Bottom)
;glVertex3f(-1.0f,-1.0f,-1.0f) // Bottom Left Of The Quad (Bottom)
;glVertex3f(1.0f,-1.0f,-1.0f) // Bottom Right Of The Quad (Bottom)
;glColor3f(1.0f,0.0f,0.0f) // Set The Color To Red
;glVertex3f(1.0f,1.0f,1.0f) // Top Right Of The Quad (Front)
;glVertex3f(-1.0f,1.0f,1.0f) // Top Left Of The Quad (Front)
;glVertex3f(-1.0f,-1.0f,1.0f) // Bottom Left Of The Quad (Front)
;glVertex3f(1.0f,-1.0f,1.0f) // Bottom Right Of The Quad (Front)
;glColor3f(1.0f,1.0f,0.0f) // Set The Color To Yellow
;glVertex3f(1.0f,-1.0f,-1.0f) // Top Right Of The Quad (Back)
;glVertex3f(-1.0f,-1.0f,-1.0f) // Top Left Of The Quad (Back)
;glVertex3f(-1.0f,1.0f,-1.0f) // Bottom Left Of The Quad (Back)
;glVertex3f(1.0f,1.0f,-1.0f) // Bottom Right Of The Quad (Back)
;glColor3f(0.0f,0.0f,1.0f) // Set The Color To Blue
;glVertex3f(-1.0f,1.0f,1.0f) // Top Right Of The Quad (Left)
;glVertex3f(-1.0f,1.0f,-1.0f) // Top Left Of The Quad (Left)
;glVertex3f(-1.0f,-1.0f,-1.0f) // Bottom Left Of The Quad (Left)
;glVertex3f(-1.0f,-1.0f,1.0f) // Bottom Right Of The Quad (Left)
;glColor3f(1.0f,0.0f,1.0f) // Set The Color To Violet
;glVertex3f(1.0f,1.0f,-1.0f) // Top Right Of The Quad (Right)
;glVertex3f(1.0f,1.0f,1.0f) // Top Left Of The Quad (Right)
;glVertex3f(1.0f,-1.0f,1.0f) // Bottom Left Of The Quad (Right)
;glVertex3f(1.0f,-1.0f,-1.0f) // Bottom Right Of The Quad (Right)



;Done Drawing The Quad
call glEnd

;Decrease The Rotation Variable For The Quad
fld aQuad
fsub daQuad
fstp aQuad


