WinMain proc

call InitLogger
LOG_TEXT szLogEnterWinMain

;1. Register Main Window Class

;1.1. Fill the rest of WNDCLASSEX32 Structure

;1.1.1. Load Instance Handle
LOG_TEXT szGetModuleHandleA
invoke GetModuleHandleA,0
test eax,eax
jz WinMain_Error
mov ghInst,eax
mov wcx_hInstance,eax
LOG_TEXT szOK

;1.1.2. Load Icon Handle
invoke LoadIconA,0,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
mov wcx_hIcon,eax
mov wcx_hIconSm,eax

;1.1.3. Load Cursor Handle
invoke LoadCursorA,0,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
mov wcx_hCursor,eax

;1.1.4. Load Background Brush Handle
invoke GetStockObject,4 ;BLACK_BRUSH
mov wcx_hbrBackground,eax

;1.2. Now call to the Registering Function
LOG_TEXT szRegisterClassExA
invoke RegisterClassExA,OFFSET_WCX
test eax,eax
jz WinMain_Error
mov gnWndClass,eax
LOG_TEXT szOK

;2. Build the Menu without an .rc file
include 01_Menu.asm

;3. Create the Window
;LOG_TEXT szLogCreatingMainWnd
LOG_TEXT szCreateWindowExA
push 0 ;lpParam = 0 ;Don't Pass Anything To WM_CREATE
push ghInst
push ghMenu
push 0 ;hWndParent
push DEFAULT_WND_HEIGHT ;nHeight = 600
push DEFAULT_WND_WIDTH ;nWidth = 800
push 10h ;y = 16
push 10h ;x = 16
push 16CF0000h ;dwStyle = WS_VISIBLE | WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS = 16CF.0000h
push offset szMainWndTitle
push offset szMainWndClass
push 40100h ;dwExStyle = WS_EX_APPWINDOW | WS_EX_WINDOWEDGE
call CreateWindowExA
test eax,eax
jz WinMain_Error
mov ghWnd,eax
;LOG_TEXT szLogMainWndCreated
LOG_TEXT szOK

;4. Create the Status Bar
include 02_StatusBar.asm

;5. Prepare the Window
invoke UpdateWindow,ghWnd
invoke SetForegroundWindow,ghWnd
invoke SetFocus,ghWnd

;6. Initialize OpenGL Environment
call InitGL
test eax,eax
jnz WinMain_End

;7. Read Input Files
call parseObjFile
call parseMtlFile

;8. Set Timer
call InitTimer

;9. Enter the Loop
WinMain_Loop:
invoke PeekMessageA, OFFSET_MSG,0,0,0,1 ;PM_REMOVE
test eax,eax ;Is there a Message?
jnz ProceedMessage

;WinMain_NoMessages:
cmp isActive,0
je Wait2ms

call Tick ;Refresh dt

include 04_CheckKeys.asm

;WinMain_Active:
cmp isRefreshed,0
jne Wait16ms

;WinMain_ReDraw:
call DrawScene
jmp WinMain_Loop

ProceedMessage:
cmp msg_message,12h ;WM_QUIT
je WinMain_End

invoke TranslateAcceleratorA,ghWnd,ghAccTable,OFFSET_MSG
test eax,eax
jnz WinMain_Loop

invoke TranslateMessage,OFFSET_MSG
invoke DispatchMessageA,OFFSET_MSG
jmp WinMain_Loop

Wait2ms:
invoke Sleep,2
jmp WinMain_Loop

Wait16ms:
invoke Sleep,10h
mov dword ptr [qpcPrev],0
mov dword ptr [qpcPrev+4],0
jmp WinMain_Loop

WinMain_Error:
call SpellError
jmp WinMain_End

WinMain_End:
LOG_TEXT szExitProcess
call CloseLogger
invoke ExitProcess,0

WinMain endp


