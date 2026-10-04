;CreateStatusBar:
lea rcx,szLogCreatingStatusBar
call WriteLog

;1. Initialize the Common Controls
mov rcx,OFFSET_ICCE
call InitCommonControlsEx

;2. Create the Window
xor rcx,rcx ;dwExStyle = 0
lea rdx,szStatusClassName
xor r8,r8 ;lpWindowName = 0
mov r9,50000100h ;dwStyle = SBARS_SIZEGRIP Or WS_CHILD Or WS_VISIBLE
mov qword ptr[rsp+20h],0 ;x = 0
mov qword ptr[rsp+28h],0 ;y = 0
mov qword ptr[rsp+30h],0 ;nWidth = 0
mov qword ptr[rsp+38h],0 ;nHeight = 0
mov rax,ghWnd
mov qword ptr[rsp+40h],rax ;hWndParent
mov qword ptr[rsp+48h],1 ;hMenu = idStatusBar = 1 (Unique ID)
mov rax,ghInst
mov qword ptr[rsp+50h],rax
mov qword ptr[rsp+58h],0 ;lpParam = 0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
test rax,rax
jz WinMain_Error
mov ghWndStatusBar,rax

;3. Set Status Bar Parts
mov rcx,ghWndStatusBar ;hWnd
mov rdx,404h ;Msg = SB_SETPARTS = WM_USER + 4 = 404h
mov r8,STATUS_BAR_PARTS ;wParam = 6 parts
lea r9,xStatusParts ;lParam = address of the Array of Coordinates
call SendMessageA
test rax,rax
jz WinMain_Error

;Success
lea rcx,szOK
call WriteLog


