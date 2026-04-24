WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD

LOCAL lpChildStruct:QWORD
LOCAL iLoop:BYTE,iLoopPoly:BYTE,dummy0:BYTE,dummy1:BYTE,dummy2:BYTE,dummy3:BYTE,dummy4:BYTE,dummy5:BYTE
LOCAL lpV0:QWORD,lpV1:QWORD,lpV2:QWORD

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


;Register Frame Window Class
mov wcx.cbSize,50h ;sizeof(WNDCLASSEX)
mov wcx.style,3 ;CS_HREDRAW | CS_VREDRAW;
lea rax,WndProc
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
lea rax,szMainClassName
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Register 2D Child Window Class
mov wcx.style,2Bh ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS
lea rax,Child2DWndProc
mov wcx.lpfnWndProc,rax
mov wcx.lpszMenuName,0
lea rax,szChild2DClassName
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Register 3D Child Window Class
lea rax,Child3DWndProc
mov wcx.lpfnWndProc,rax
lea rax,szChild3DClassName
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Create the Frame Window
xor rcx,rcx ;WS_EX_LEFT
lea rdx,szMainClassName ;'MainWindow'
lea r8,szAppTitle ;'Al's OpenGL MDI Example'
mov r9,2CF0000h ;WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr [rsp+20h],rax ;x
mov qword ptr [rsp+28h],rax ;y
mov qword ptr [rsp+30h],rax ;nWidth
mov qword ptr [rsp+38h],rax ;nHeight
mov qword ptr [rsp+40h],0 ;hWndParent
mov qword ptr [rsp+48h],0 ;hMenu
mov rax,g_hInst
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;lpParam
call CreateWindowExA
mov g_hMainWindow,rax
cmp rax,0
je lbl_CreateWindowFrame_Err

mov rcx,g_hMainWindow
mov rdx,1 ;SW_SHOWNORMAL = 1
call ShowWindow

mov rcx,g_hMainWindow
call UpdateWindow

;Initialize the Object
Call SetVertices
Call SetPolygons
Call SetTextures

;sphere for vertex selection
call gluNewQuadric
mov sphere,rax ;GLUquadricObj

include 0100_MainLoop.asm

include 0900_Errors.asm

lbl_WinMain_End:
xor rcx,rcx
call ExitProcess
WinMain endp
