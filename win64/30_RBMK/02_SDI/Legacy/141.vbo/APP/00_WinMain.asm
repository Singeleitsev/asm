WinMain proc
PROLOG 100h

call InitLogger
lea rcx,szLogEnterWinMain
call WriteLog

;1. Register Main Window Class

;1.1. Fill the rest of WNDCLASSEX32 Structure

;1.1.1. Load Instance Handle
lea rcx,szGetModuleHandleA
call WriteLog

xor rcx,rcx
call GetModuleHandleA
test rax,rax
jz WinMain_Error

mov ghInst,rax
mov wcx_hInstance,rax
lea rcx,szOK
call WriteLog

;1.1.2. Load Icon Handle
xor rcx,rcx
mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
call LoadIconA
mov wcx_hIcon,rax
mov wcx_hIconSm,rax

;1.1.3. Load Cursor Handle
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
call LoadCursorA
mov wcx_hCursor,rax

;1.1.4. Load Background Brush Handle
mov rcx,4 ;BLACK_BRUSH
call GetStockObject
mov wcx_hbrBackground,rax

;1.2. Now call to the Registering Function
lea rcx,szRegisterClassExA
call WriteLog

mov rcx,OFFSET_WCX
call RegisterClassExA
test rax,rax
jz WinMain_Error
mov gnWndClass,rax

lea rcx,szOK
call WriteLog

;2. Build the Menu without an .rc file
include 01_Menu.asm
include 02_Accel.asm

;3. Create the Window
lea rcx,szCreateWindowExA
call WriteLog

mov rcx,40100h ;dwExStyle = WS_EX_APPWINDOW | WS_EX_WINDOWEDGE
lea rdx,szMainWndClass
lea r8,szMainWndTitle
mov r9,16CF0000h ;dwStyle = WS_VISIBLE | WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS = 16CF.0000h
mov qword ptr[rsp+20h],10h ;x = 16
mov qword ptr[rsp+28h],10h ;y = 16
mov qword ptr[rsp+30h],DEFAULT_WND_WIDTH ;nWidth = 800
mov qword ptr[rsp+38h],DEFAULT_WND_HEIGHT ;nHeight = 600
mov qword ptr[rsp+40h],0 ;hWndParent
mov rax,ghMenu
mov qword ptr[rsp+48h],rax
mov rax,ghInst
mov qword ptr[rsp+50h],rax
mov qword ptr[rsp+58h],0 ;lpParam = 0 ;Don't Pass Anything To WM_CREATE
call CreateWindowExA
test rax,rax
jz WinMain_Error
mov ghWnd,rax

lea rcx,szOK
call WriteLog

;4. Create the Status Bar
include 03_StatusBar.asm

;5. Prepare the Window
mov rcx,ghWnd
call UpdateWindow
mov rcx,ghWnd
call SetForegroundWindow
mov rcx,ghWnd
call SetFocus

;6. Initialize OpenGL Environment
call InitGL
test rax,rax
jnz WinMain_End

;7. Read Input Data
call BuildGeometry
call SetVBO

;8. Get the System Frequency for FPS
lea rcx,qpcFreq
call QueryPerformanceFrequency

;9. Enter the Loop
WinMain_Loop:
mov rcx,OFFSET_MSG
xor rdx,rdx ;0
xor r8,r8 ;0
xor r9,r9 ;0
mov qword ptr[rsp+20h],1 ;PM_REMOVE
call PeekMessageA
test rax,rax ;Is there a Message?
jnz ProceedMessage

;WinMain_NoMessages:
cmp isActive,0
je Wait2ms

;Proceed the Keyboard State
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

mov rcx,ghWnd
mov rdx,ghAccTable
mov r8,OFFSET_MSG
call TranslateAcceleratorA
test eax,eax
jnz WinMain_Loop

mov rcx,OFFSET_MSG
call TranslateMessage
mov rcx,OFFSET_MSG
call DispatchMessageA
jmp WinMain_Loop

Wait2ms:
mov rcx,2
call Sleep
jmp WinMain_Loop

Wait16ms:
mov rcx,10h
call Sleep
jmp WinMain_Loop

WinMain_Error:
call SpellError
jmp WinMain_End

WinMain_End:
lea rcx,szExitProcess
call WriteLog
call CloseLogger
xor rcx,rcx
call ExitProcess

;No EPILGOG Required
WinMain endp




