;lbl_CreateStatusBar:

LOG_TEXT szLogCreateStatusBar

lea rcx,icce_dwSize
Call InitCommonControlsEx

;Create the Window
xor rcx,rcx ;dwExStyle = 0
lea rdx,szStatusClassName
xor r8,r8 ;lpWindowName = 0
mov r9,50000100h ;dwStyle = SBARS_SIZEGRIP | WS_CHILD | WS_VISIBLE
mov qword ptr [rsp+20h],0 ;x = 0
mov qword ptr [rsp+28h],0 ;y = 0
mov qword ptr [rsp+30h],0 ;nWidth = 0
mov qword ptr [rsp+38h],0 ;nHeight = 0
mov rax,ghWndMain ;hWndParent
mov qword ptr [rsp+40h],rax
mov qword ptr [rsp+48h],1 ;hMenu = idStatusBar = 1
mov rax,ghInstance
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
Call CreateWindowExA
test rax,rax
jz lbl_WinMain_WinError
mov ghWndStatusBar,rax

mov rcx,ghWndStatusBar
mov rdx, 404h ;Msg = SB_SETPARTS = WM_USER + 4
mov r8,N_STATUSBAR_PARTS ;wParam = Number of Parts
lea r9,xStatusParts
Call SendMessageA

lbl_CreateStatusBar_End:
LOG_TEXT szOK
