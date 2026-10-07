CloseGL proc hWnd:QWORD
PROLOG 100h

xor rcx,rcx
xor rdx,rdx
call wglMakeCurrent

cmp ghRC,0
je @f
mov rcx,ghRC
call wglDeleteContext
mov ghRC,0

@@:
cmp ghDC,0
je @f
mov rcx,hWnd
mov rdx,ghDC
call ReleaseDC
mov ghDC,0

@@:
CloseGL_End:
EPILOG
CloseGL endp