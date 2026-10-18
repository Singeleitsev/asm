CreateMainWnd proc
PROLOG 100h

lea rcx,szLogCreatingMainWnd
call WriteLog

;1. Register the Main Window Class

;1.1. Fill the rest of WNDCLASSEX Structure
mov wcx_style,2Bh ;CS_VREDRAW|CS_HREDRAW|CS_DBLCLKS|CS_OWNDC = 1+2+8+20h = 2Bh
lea rax,WndProc
mov wcx_lpfnWndProc,rax
lea rax,szWndClassMain
mov wcx_lpszClassName,rax

;Load Icon Handle
xor rcx,rcx
mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
call LoadIconA
mov wcx_hIcon,rax
mov wcx_hIconSm,rax

;Load Cursor Handle
xor rcx,rcx
mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
call LoadCursorA
mov wcx_hCursor,rax

;Load Background Brush Handle
mov rcx,4 ;BLACK_BRUSH
call GetStockObject
mov wcx_hbrBackground,rax

;1.2. Now call to the Registering Function
lea rcx,szRegisterClassExA
call WriteLog

lea rcx,wcx
call RegisterClassExA
test rax,rax
jz CreateMainWnd_Error
mov gnWndClass,rax

lea rcx,szOK
call WriteLog

;2. Build the Menu without an .rc file
include 03_Menu.asm
include 04_Accel.asm

;3. Create the Window
lea rcx,szCreateWindowExA
call WriteLog

mov rcx,40100h ;dwExStyle = WS_EX_APPWINDOW | WS_EX_WINDOWEDGE
lea rdx,szWndClassMain
lea r8,szWndTitleMain
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
jz CreateMainWnd_Error
mov ghWnd,rax

lea rcx,szOK
call WriteLog

;4. Create the Status Bar
include 05_StatusBar.asm

;5. Prepare the Window
mov rcx,ghWnd
call UpdateWindow
mov rcx,ghWnd
call SetForegroundWindow
mov rcx,ghWnd
call SetFocus

;6. Read the Input Data
call BuildGeometry

;7. Initialize OpenGL 3.3 (Core) Environment
call InitCoreGL
test rax,rax
jnz CreateMainWnd_Error

;8. Get the System Frequency for FPS
lea rcx,qpcFreq
call QueryPerformanceFrequency

;Success
lea rcx,szLogMainWndCreated 
call WriteLog
xor rax,rax ;Return Success
jmp CreateMainWnd_End

;Error
CreateMainWnd_Error:
call SpellError
mov rax,-1 ;Return Error

CreateMainWnd_End:
EPILOG
CreateMainWnd endp


