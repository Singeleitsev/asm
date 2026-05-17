WinMain proc hInstance:QWORD, hPrevInstance:QWORD, lpCmdLine:QWORD, nCmdShow:QWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

test rcx,rcx
jz lbl_ErrGetModuleHandle

;Save the Parameters to the Global Variables
mov ghInstance,rcx
mov ghPrevInstance,rdx ;NULL
mov gpCmdLine,r8
mov gnCmdShow,r9

;Fill the rest of WNDCLASSEXA
mov rax,ghInstance
mov wcx_hInstance,rax
;Load Icon
mov rcx,rax
mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
call LoadIconA
mov wcx_hIcon,rax
mov wcx_hIconSm,rax
;Load Cursor
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
call LoadCursorA
mov wcx_hCursor,rax
;Now call the Function
lea rcx,wcx_cbSize ;&wcx
call RegisterClassExA
test rax,rax
jz lbl_ErrRegisterClass
mov gnWndClass,rax

include 01_CreateMenu.asm

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
mov rax,ghMenuMain
mov qword ptr [rsp+48h],rax ;hMenu
mov rax,ghInstance
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
test rax,rax
jz lbl_ErrCreateWindow
mov ghWndMain,rax

include 02_CreateStatusBar.asm

call createInstance

mov rcx,ghWndMain
mov rdx,gnCmdShow
call ShowWindow

mov rcx,ghWndMain
call UpdateWindow


;Enter the Loop
lbl_WinMain_Loop:
lea rcx,msg_hwnd ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA

test rax,rax ;Is there a Message?
jnz lbl_WinMain_ProceedMessage

;lbl_WinMain_CheckActive:
cmp isActive,0 ;No Messages. Is the Window Active?
je lbl_WinMain_Loop

;lbl_WinMain_ReDraw:
;call DrawScene ;No Messages. The Window is Active
jmp lbl_WinMain_Loop

lbl_WinMain_ProceedMessage:
cmp msg_message,12h ;WM_QUIT
je lbl_WinMain_End

mov rcx,ghWndMain
mov rdx,ghAccTable
lea r8,msg_hwnd ;lpMsg
call TranslateAcceleratorA
test rax,rax
jnz lbl_WinMain_Loop

lea rcx,msg_hwnd ;lpMsg
call TranslateMessage
lea rcx,msg_hwnd ;lpMsg
call DispatchMessageA
jmp lbl_WinMain_Loop


;Errors
lbl_ErrGetModuleHandle:
lea rcx,szErrGetModuleHandle
lea rdx,szErrGetModuleHandleCode
call SpellError
jmp lbl_WinMain_End

lbl_ErrRegisterClass:
lea rcx,szErrRegisterClass
lea rdx,szErrRegisterClassCode
call SpellError
jmp lbl_WinMain_End

lbl_ErrCreateWindow:
lea rcx,szErrCreateWindow
lea rdx,szErrCreateWindowCode
call SpellError
jmp lbl_WinMain_End


;Exit messages
lbl_WinMain_Return_wParam:
mov rcx,msg_wParam
jmp lbl_WinMain_End

lbl_WinMain_Return0:
xor rax,rax
;jmp lbl_WinMain_End

lbl_WinMain_End:
;Epilogue
xor rcx,rcx
call ExitProcess
WinMain endp

