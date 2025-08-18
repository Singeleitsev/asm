WinMain proc
LOCAL nPeek:QWORD, nWndClass:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,0
call GetModuleHandleA
mov ghInst,rax
cmp rax, 0
je lbl_ErrGetModuleHandle

;Register Main Window Class

;Fill the WNDCLASSEX64 Structure
mov wcx.cbSize,50h
mov wcx.style,23h ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC
lea rax,WndProc
mov wcx.lpfnWndProc,rax
mov wcx.cbClsExtra,0 ;No Extra Window Data
mov wcx.cbWndExtra,0 ;No Extra Window Data
;Load Instance
mov rax,ghInst
mov wcx.hInstance,rax
;Load Icon
xor rcx,rcx
mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
call LoadIconA
mov wcx.hIcon,rax
mov wcx.hIconSm,rax
;Load Cursor
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
call LoadCursorA
mov wcx.hCursor,rax
;Background
mov rcx,2 ;GRAY_BRUSH
;mov rcx,4 ;BLACK_BRUSH
call GetStockObject
mov wcx.hbrBackground,rax
mov wcx.lpszMenuName,0
lea rax,szMainWndClass
mov wcx.lpszClassName,rax

;Now call the Function
lea rcx,wcx
call RegisterClassExA
mov nWndClass,rax
cmp rax, 0
je lbl_ErrRegisterClass

;Create the Window
mov rcx,40100h ;dwExStyle = WS_EX_APPWINDOW | WS_EX_WINDOWEDGE
lea rdx,szMainWndClass
lea r8,szMainWndTitle
mov r9,16CF0000h ;dwStyle = WS_VISIBLE | WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS = 16CF.0000h
mov qword ptr [rsp+20h],10h ;x = 16
mov qword ptr [rsp+28h],10h ;y = 16
mov qword ptr [rsp+30h],400h ;nWidth = 1024
mov qword ptr [rsp+38h],300h ;nHeight = 768
mov qword ptr [rsp+40h],0 ;hWndParent
mov qword ptr [rsp+48h],0 ;hMenu
mov rax,ghInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
mov ghWnd,rax
cmp rax, 0
je lbl_ErrCreateWindow

Call InitializeGL

;Show The Window
mov rcx,ghWnd
mov rdx,5 ;SW_SHOW
call ShowWindow
mov rcx,ghWnd
call UpdateWindow

;Slightly Higher Priority
mov rcx,ghWnd
call SetForegroundWindow
;Sets Keyboard Focus To The Window
mov rcx,ghWnd
call SetFocus

;Enter the Loop
lbl_WinMain_Loop:
;sub rsp,30h
lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA
;add rsp,30h

cmp msg.message,12h ;WM_QUIT
je lbl_WinMain_End

cmp rax,0
je lbl_WinMain_CheckActive

lbl_WinMain_ProceedMessage:
;sub rsp,20h
lea rcx,msg ;lpMsg
call TranslateMessage
lea rcx,msg ;lpMsg
call DispatchMessageA
;add rsp,20h
jmp lbl_WinMain_Loop

lbl_WinMain_CheckActive:
cmp fWinMainActive,0
je lbl_WinMain_Loop

lbl_WinMain_ReDraw:
;sub rsp,20h
call DrawGLScene
;add rsp,20h
jmp lbl_WinMain_Loop

lbl_ErrGetModuleHandle:
lea rcx,szErrGetModuleHandle
mov rdx,27 ;String Length
Call SpellError
jmp lbl_WinMain_End

lbl_ErrRegisterClass:
lea rcx,szErrRegisterClass
mov rdx,25 ;String Length
Call SpellError
jmp lbl_WinMain_End

lbl_ErrCreateWindow:
lea rcx,szErrCreateWindow
mov rdx,24 ;String Length
Call SpellError
jmp lbl_WinMain_End

lbl_WinMain_End:
;sub rsp,20h
xor rcx,rcx
call ExitProcess
;add rsp,20h

WinMain endp