CloseGL proc hWnd:DWORD

invoke wglMakeCurrent,0,0

cmp ghRC,0
je @f
invoke wglDeleteContext,ghRC
mov ghRC,0

@@:
cmp ghDC,0
je @f
invoke ReleaseDC,hWnd,ghDC
mov ghDC,0

@@:
CloseGL_End:
ret
CloseGL endp