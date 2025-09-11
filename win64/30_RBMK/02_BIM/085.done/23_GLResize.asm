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

lea rdi,xStatusParts
mov eax,RectWidth
mov ebx,11 ;xStatusParts(0) = 11/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi],eax
mov eax,RectWidth
mov ebx,23 ;xStatusParts(1) = 23/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+4],eax
mov eax,RectWidth
mov ebx,34 ;xStatusParts(2) = 34/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+8],eax
mov eax,RectWidth
mov ebx,48 ;xStatusParts(3) = 48/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+12],eax
mov eax,RectWidth
mov ebx,62 ;xStatusParts(4) = 62/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+16],eax
mov eax,RectWidth
mov ebx,76 ;xStatusParts(5) = 76/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+20],eax
mov eax,RectWidth
mov ebx,93 ;xStatusParts(6) = 93/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+24],eax
mov eax,RectWidth
mov ebx,110 ;xStatusParts(7) = 110/128*RectWidth
mul ebx
shr eax,7
mov dword ptr[rdi+28],eax

mov rcx,hwndStatusBar
mov rdx, 404h ;Msg = SB_SETPARTS = WM_USER + 4
mov r8,9 ;wParam = Number of Parts
lea r9,xStatusParts
Call SendMessageA

jmp lbl_GLResize_End

lbl_ErrGetClientRect:
lea rcx,szErrGetClientRect
;mov rdx,27 ;String Length
mov rdx,lpszErrGetClientRectCode
call SpellError
jmp lbl_GLResize_End

lbl_GLResize_End:

