WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD

LOCAL wcx:WNDCLASSEX64
LOCAL msg:MSG64

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store Parameters
mov hInstance,rcx
mov g_hInst,rcx
mov hPrevInstance,rdx
mov szCmdLine,r8
mov iCmdShow,r9

;Fill the wndclass Structure
mov wcx.cbSize,50h ;sizeof (wndclass)
mov wcx.style,3 ;CS_HREDRAW | CS_VREDRAW
lea r10,FrameWndProc
mov wcx.lpfnWndProc,r10
mov wcx.cbClsExtra,0
mov wcx.cbWndExtra,0
mov r11,hInstance
mov wcx.hInstance,r11
xor rcx,rcx
mov rdx,7F00h ;IDI_APPLICATION
call LoadIconA
mov wcx.hIcon,rax
mov wcx.hIconSm,rax
xor rcx,rcx
mov rdx,7F00h ;IDC_ARROW
call LoadCursorA
mov wcx.hCursor,rax
mov wcx.hbrBackground,0Dh ;COLOR_APPWORKSPACE + 1
mov wcx.lpszMenuName,0
lea r12,szClassFrame
mov wcx.lpszClassName,r12
;Register the Frame Window Class
lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Re-Fill the wndclass Structure
lea r10,Child0WndProc
mov wcx.lpfnWndProc,r10
mov wcx.cbWndExtra,8 ;sizeof (HANDLE)
xor rcx,rcx ;WHITE_BRUSH = 0
call GetStockObject 
mov wcx.hbrBackground,rax
lea r12,szClassChild0
mov wcx.lpszClassName,r12
;Register the Hello Child Window Class
lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Re-Fill the wndclass Structure
lea r10,Child1WndProc
mov wcx.lpfnWndProc,r10
lea r12,szClassChild1
mov wcx.lpszClassName,r12
;Register the Rect Child Window Class
lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

include 01_0_CreateMenuFrame.asm
include 01_1_CreateMenuChild0.asm
include 01_2_CreateMenuChild1.asm
include 02_Accel.asm

;Create the Frame Window
xor rcx,rcx ;dwExStyle
lea rdx,szClassFrame ;lpClassName
lea r8,szTitleFrame ;lpWindowName
mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr [rsp+20h],rax ;x
mov qword ptr [rsp+28h],rax ;y
mov qword ptr [rsp+30h],rax ;nWidth
mov qword ptr [rsp+38h],rax ;nHeight
mov qword ptr [rsp+40h],0 ;hWndParent
mov r10,g_hMenuFrame
mov qword ptr [rsp+48h],r10 ;hMenu
mov r11,hInstance
mov qword ptr [rsp+50h],r11
mov qword ptr [rsp+58h],0 ;lpParam
call CreateWindowExA
mov g_hWndFrame,rax
cmp rax,0
je lbl_CreateWindowFrame_Err

mov rcx,g_hWndFrame
mov rdx,1 ;nCmdShow = SW_SHOWNORMAL = 1
call ShowWindow

mov rcx,g_hWndFrame
call UpdateWindow

;include 03_0_MainLoop_GetMessage.asm
include 03_1_MainLoop_PeekMessage.asm

include 09_Errors.asm

lbl_WinMain_End:

;Clean up by deleting unattached menus
mov rcx,g_hMenuChild0
call DestroyMenu
mov rcx,g_hMenuChild1
call DestroyMenu
mov rcx, g_hAccel
call DestroyAcceleratorTable

xor rcx,rcx
call ExitProcess
WinMain endp


