;Register Frame Window Class
mov wcx.cbSize,50h ;sizeof(WNDCLASSEX)
mov wcx.style,3 ;CS_HREDRAW | CS_VREDRAW;
lea rax,WndProc
mov wcx.lpfnWndProc,rax
mov wcx.cbClsExtra,0
mov wcx.cbWndExtra,0
mov rcx,g_hInst
mov wcx.hInstance,rcx
;wcx.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));
mov rcx,g_hInst
mov rdx,7F00h ;IDI_APPLICATION
call LoadIconA
mov wcx.hIcon,rax
mov wcx.hIconSm,rax
;wcx.hCursor = LoadCursor(NULL, IDC_ARROW);
xor rcx,rcx
mov edx,7F00h ;IDC_ARROW
call LoadCursorA
mov wcx.hCursor,rax
mov wcx.hbrBackground,11h ;(HBRUSH)(COLOR_3DSHADOW+1)
;lea rax,szMenuNameMain ;"MAIN"
;mov wcx.lpszMenuName,rax
mov wcx.lpszMenuName,0
lea rax,g_szMainClassName
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
lea rax,g_szChild2DClassName
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Register 3D Child Window Class
lea rax,Child3DWndProc
mov wcx.lpfnWndProc,rax
lea rax,g_szChild3DClassName
mov wcx.lpszClassName,rax

lea rcx,wcx
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err

;Create the Frame Window
xor rcx,rcx ;WS_EX_LEFT
lea rdx,g_szMainClassName ;'MainWindow'
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

