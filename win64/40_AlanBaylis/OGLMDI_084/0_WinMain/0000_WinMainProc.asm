WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD

LOCAL lpChildStruct:QWORD
LOCAL iLoop:BYTE,iLoopPoly:BYTE

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

;https://learn.microsoft.com/en-us/windows/win32/winmsg/using-the-multiple-document-interface

;Register Frame Window Class
mov wcx.cbSize,50h ;sizeof(WNDCLASSEX)
mov wcx.style,3 ;CS_HREDRAW | CS_VREDRAW;
lea rax,FrameWndProc
mov wcx.lpfnWndProc,rax
mov wcx.cbClsExtra,0
mov wcx.cbWndExtra,0
mov rcx,g_hInst
mov wcx.hInstance,rcx
mov rcx,g_hInst
mov rdx,7F00h ;IDI_APPLICATION
call LoadIconA
mov wcx.hIcon,rax
mov wcx.hIconSm,rax
xor rcx,rcx
mov edx,7F00h ;IDC_ARROW
call LoadCursorA
mov wcx.hCursor,rax
mov wcx.hbrBackground,11h ;COLOR_3DSHADOW+1
mov wcx.lpszMenuName,0
lea rax,szClassFrame
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Register 2D Child Window Class
;mov wcx.cbSize,50h ;sizeof(WNDCLASSEX)
mov wcx.style,2Bh ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS
lea rax,Child2DWndProc
mov wcx.lpfnWndProc,rax
;mov wcx.cbClsExtra,0
;The class structure should reserve extra space in the window structure.
;With this space, the application can associate data, such as a filename, with a particular child window
mov wcx.cbWndExtra,8 
;mov rcx,g_hInst
;mov wcx.hInstance,rcx
;mov rdx,7F00h ;IDI_APPLICATION
;call LoadIconA
;mov wcx.hIcon,rax
;mov wcx.hIconSm,rax
;xor rcx,rcx
;mov edx,7F00h ;IDC_ARROW
;call LoadCursorA
;mov wcx.hCursor,rax
;mov wcx.hbrBackground,11h ;COLOR_3DSHADOW+1
mov wcx.lpszMenuName,0 ;The menu name should be NULL, because an MDI child window cannot have its own menu
lea rax,szClassChild2D
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Register 3D Child Window Class
;mov wcx.cbSize,50h ;sizeof(WNDCLASSEX)
;mov wcx.style,2Bh ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS
lea rax,Child3DWndProc
mov wcx.lpfnWndProc,rax
;mov wcx.cbClsExtra,0
;The class structure should reserve extra space in the window structure.
;With this space, the application can associate data, such as a filename, with a particular child window
;mov wcx.cbWndExtra,8 
;mov rcx,g_hInst
;mov wcx.hInstance,rcx
;mov rdx,7F00h ;IDI_APPLICATION
;call LoadIconA
;mov wcx.hIcon,rax
;mov wcx.hIconSm,rax
;xor rcx,rcx
;mov edx,7F00h ;IDC_ARROW
;call LoadCursorA
;mov wcx.hCursor,rax
;mov wcx.hbrBackground,11h ;COLOR_3DSHADOW+1
;mov wcx.lpszMenuName,0 ;The menu name should be NULL, because an MDI child window cannot have its own menu
lea rax,szClassChild3D
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Create the Frame Window
xor rcx,rcx ;WS_EX_LEFT
lea rdx,szClassFrame ;'MainWindow'
lea r8,szTitleFrame ;'Al's OpenGL MDI Example'
mov r9,2CF0000h ;WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr [rsp+20h],rax ;x
mov qword ptr [rsp+28h],rax ;y
mov qword ptr [rsp+30h],rax ;nWidth
mov qword ptr [rsp+38h],rax ;nHeight
mov qword ptr [rsp+40h],0 ;hWndParent
;mov rax,hMenuMain
mov qword ptr [rsp+48h],0 ;hMenu
mov rax,g_hInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;lpParam
call CreateWindowExA
mov g_hWndFrame,rax
cmp rax,0
je lbl_CreateWindowFrame_Err

mov rcx,g_hWndFrame
mov rdx,1 ;SW_SHOWNORMAL = 1
call ShowWindow

mov rcx,g_hWndFrame
call UpdateWindow

;Initialize the Object
Call SetVertices
Call SetPolygons

;sphere for vertex selection
call gluNewQuadric
mov sphere,rax ;GLUquadricObj

include 0100_MainLoop.asm

include 0900_Errors.asm

lbl_WinMain_End:
xor rcx,rcx
call ExitProcess
WinMain endp
