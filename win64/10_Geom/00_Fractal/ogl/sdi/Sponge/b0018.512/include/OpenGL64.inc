;OpenGL32.inc

glRotatef PROTO :XMMWORD,:XMMWORD,:XMMWORD,:XMMWORD
glBegin PROTO :QWORD
glClear PROTO :QWORD
glColor3f PROTO :XMMWORD,:XMMWORD,:XMMWORD
glEnable PROTO :QWORD
glEnd PROTO
glVertex3d PROTO :XMMWORD,:XMMWORD,:XMMWORD
glVertex3f PROTO :XMMWORD,:XMMWORD,:XMMWORD
glViewport PROTO :QWORD,:QWORD,:QWORD,:QWORD

wglCreateContext PROTO :QWORD
wglMakeCurrent PROTO :QWORD,:QWORD
wglDeleteContext PROTO :QWORD


;GlU32.inc

