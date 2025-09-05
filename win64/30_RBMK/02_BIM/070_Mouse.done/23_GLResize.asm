;lbl_GLResize:

mov rcx,hWnd
lea rdx,RectMain
Call GetClientRect
cmp eax,0
je lbl_ErrGetClientRect

mov eax,RectMain.right
sub eax,RectMain.left
mov RectWidth,eax
cmp eax,0
je lbl_ErrGetClientRect

mov eax,RectMain.bottom
sub eax,RectMain.top
mov RectHeight,eax
cmp eax,0
je lbl_ErrGetClientRect

fild RectWidth ;st0 = RectWidth
fild RectHeight ;st0 = RectHeight, st1 = RectWidth
fdivp ;st0 = RectAspect
fstp RectAspect

xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,RectWidth
xor r9,r9
mov r9d,RectHeight
Call glViewport ;(0, 0, RectWidth, RectHeight)

;Screen Center
mov eax,RectWidth
shr eax,1 ;Divide by 2
mov xScrCenter,eax
mov ebx,RectHeight
shr ebx,1 ;Divide by 2
mov yScrCenter,ebx

;Status Bar
mov rcx,hwndStatusBar
mov rdx,5 ;WM_SIZE
xor r8,r8
xor r9,r9
Call SendMessageA

jmp lbl_GLResize_End

lbl_ErrGetClientRect:
lea rcx,szErrGetClientRect
;mov rdx,27 ;String Length
mov rdx,lpszErrGetClientRectCode
call SpellError
jmp lbl_GLResize_End

lbl_GLResize_End:

