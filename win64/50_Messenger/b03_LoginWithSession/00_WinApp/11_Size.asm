;lbl_Size:

mov rcx,hWnd ;Not global
lea rdx,RectMain_left
call GetClientRect
test rax,rax
jz lbl_ErrGetClientRect

mov eax,RectMain_right
sub eax,RectMain_left
mov RectMain_width,eax
test rax,rax
jz lbl_ErrGetClientRect

mov eax,RectMain_bottom
sub eax,RectMain_top
mov RectMain_height,eax
test rax,rax
jz lbl_ErrGetClientRect

;Status Bar
mov rcx,ghwndStatusBar
mov rdx,5 ;WM_SIZE
xor r8,r8
xor r9,r9
call SendMessageA

;xStatusParts(i) = xStatusProportions(i)*RectWidth/1024
mov cl,8
mov ebx,RectMain_width
lea rsi,xStatusProportions
lea rdi,xStatusParts
lbl_NextStatusPart:
mov eax,dword ptr[rsi] ;xStatusProportions(i)
mul ebx ;*RectWidth
shr eax,10 ;Divide by DEFAULT_SCREEN_WIDTH = 1024
mov dword ptr[rdi],eax ;xStatusParts(i)
add rsi,4
add rdi,4
dec cl
cmp cl,0
jg lbl_NextStatusPart

mov rcx,ghwndStatusBar
mov rdx, 404h ;Msg = SB_SETPARTS = WM_USER + 4
mov r8,9 ;wParam = Number of Parts
lea r9,xStatusParts
call SendMessageA

mov isRefreshed,0

jmp lbl_Size_End

lbl_ErrGetClientRect:
lea rcx,szErrGetClientRect
lea rdx,szErrGetClientRectCode
call SpellError
jmp lbl_Size_End

lbl_Size_End:

