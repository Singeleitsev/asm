;lbl_CreateStatusBar:

lea rcx,icce
Call InitCommonControlsEx

;Create the Window
xor rcx,rcx ;dwExStyle = 0
lea rdx,szStatusClassName
xor r8,r8 ;lpWindowName = 0
mov r9,50000100h ;dwStyle = SBARS_SIZEGRIP Or WS_CHILD Or WS_VISIBLE
mov qword ptr [rsp+20h],0 ;x = 0
mov qword ptr [rsp+28h],0 ;y = 0
mov qword ptr [rsp+30h],0 ;nWidth = 0
mov qword ptr [rsp+38h],0 ;nHeight = 0
mov rax,ghWnd ;hWndParent
mov qword ptr [rsp+40h],rax
mov qword ptr [rsp+48h],1 ;hMenu = idStatusBar = 1
mov rax,ghInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
Call CreateWindowExA
mov hwndStatusBar,rax
cmp rax,0
je lbl_ErrCreateStatusBar

mov rcx,hwndStatusBar
mov rdx, 404h ;Msg = SB_SETPARTS = WM_USER + 4
mov r8,9 ;wParam = Number of Parts
lea r9,xStatusParts
Call SendMessageA

jmp lbl_CreateStatusBar_End

lbl_ErrCreateStatusBar:
lea rcx,szErrCreateStatusBar
;mov rdx,29 ;String Length
mov rdx,lpszErrCreateStatusBarCode
call SpellError
;jmp lbl_CreateStatusBar_End

lbl_CreateStatusBar_End:
