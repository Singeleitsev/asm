;CreateStatusBar:
LOG_TEXT szLogCreatingStatusBar

;1. Initialize the Common Controls
invoke InitCommonControlsEx,OFFSET_ICCE

;2. Create the Window
push 0 ;lpParam = 0 ;Don't Pass Anything To WM_CREATE
push ghInst
push 1 ;hMenu = idStatusBar = 1 (Unique ID)
push ghWnd ;hWndParent
push 0 ;nHeight = 0
push 0 ;nWidth = 0
push 0 ;y = 0
push 0 ;x = 0
push 50000100h ;dwStyle = SBARS_SIZEGRIP Or WS_CHILD Or WS_VISIBLE
push 0 ;lpWindowName = 0
push offset szStatusClassName
push 0 ;dwExStyle = 0
call CreateWindowExA
test eax,eax
jz WinMain_Error
mov ghwndStatusBar,eax

;3. Set Status Bar Parts
push offset xStatusParts ;lParam = address of the Array of Coordinates
push STATUS_BAR_PARTS ;wParam = 9 parts
push 404h ;Msg = SB_SETPARTS = WM_USER + 4 = 404h
push ghwndStatusBar ;hWnd
call SendMessageA
test eax,eax
jz WinMain_Error

;Success
LOG_TEXT szOK


