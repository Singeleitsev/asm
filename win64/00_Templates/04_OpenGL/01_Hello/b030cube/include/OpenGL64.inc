;OpenGL32.inc

glRotatef PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
glBegin PROTO :QWORD
glClear PROTO :QWORD
glClearColor PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
glClearDepth PROTO :XMMWORD
glColor3f PROTO :XMMWORD,:XMMWORD,:XMMWORD
glDepthFunc PROTO :QWORD
glEnable PROTO :QWORD
glEnd PROTO
glFrustum PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
glHint PROTO :QWORD,:QWORD
glLoadIdentity PROTO
glMatrixMode PROTO :QWORD
glOrtho PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
glShadeModel PROTO :QWORD
;glTranslated PROTO :XMMWORD,:XMMWORD,:XMMWORD
glTranslatef PROTO :XMMWORD,:XMMWORD,:XMMWORD
glVertex3d PROTO :XMMWORD,:XMMWORD,:XMMWORD
glVertex3f PROTO :XMMWORD,:XMMWORD,:XMMWORD
glViewport PROTO :QWORD,:QWORD,:QWORD,:QWORD

wglCreateContext PROTO :QWORD
wglMakeCurrent PROTO :QWORD,:QWORD
wglDeleteContext PROTO :QWORD


;GlU32.inc
gluLookAt PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD, :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
gluPerspective PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD

