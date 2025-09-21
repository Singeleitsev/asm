;Register Frame Window Class
mov wc.cbSize,50h ;sizeof(WNDCLASSEX)
mov wc.style,3 ;CS_HREDRAW | CS_VREDRAW;
lea rax,WndProc
mov wc.lpfnWndProc,rax
mov wc.cbClsExtra,0
mov wc.cbWndExtra,0
mov wc.hInstance,rcx ;wc.hInstance = hInstance
;wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));
;mov rcx,hInstance ;It was still in rcx
mov edx,68h ;MAKEINTRESOURCE(IDI_MYICON)
call LoadIconA
mov wc.hIcon,rax
mov wc.hIconSm,rax
;wc.hCursor = LoadCursor(NULL, IDC_ARROW);
xor rcx,rcx
mov edx,7F00h
call LoadCursorA
mov wc.hCursor,rax
mov wc.hbrBackground,11h ;(HBRUSH)(COLOR_3DSHADOW+1)
lea rax,szMenuNameMain ;"MAIN"
mov wc.lpszMenuName,rax
lea rax,g_szMainClassName
mov,wc.lpszClassName,rax
	
lea rcx,wc
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err


;Register 2D Child Window Class
mov wc.style,2Bh ;CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS
lea rax,Child2DWndProc
mov wc.lpfnWndProc,rax
;wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
mov rcx,hInstance ;It was still in rcx
mov rdx,69h ;MAKEINTRESOURCE(IDI_CHILDICON)
call LoadIconA
mov wc.hIcon,rax
mov wc.hIconSm,rax
;wc.hCursor = LoadCursor(NULL, IDC_ARROW);
xor rcx,rcx
mov edx,7F00h
call LoadCursorA
mov wc.hCursor,rax
mov wc.lpszMenuName,0
lea rax,g_szChild2DClassName
mov wc.lpszClassName,rax

lea rcx,wc
call RegisterClassExA
cmp rax,0
je lbl_RegisterClass_Err


;Register 3D Child Window Class
lea rax,Child3DWndProc
mov wc.lpfnWndProc,rax
lea rax,g_szChild3DClassName
mov wc.lpszClassName,rax

lea rcx,wc
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
mov rax,hInstance
mov qword ptr [rsp+50h],rax
mov qword ptr [rsp+58h],0 ;lpParam
call CreateWindowExA
mov g_hMainWindow,rax
cmp rax,0
je lbl_CreateWindowFrame_Err

mov rcx,g_hMainWindow
mov rdx,nCmdShow ;SW_SHOWNORMAL = 1
call ShowWindow

mov rcx,g_hMainWindow
call UpdateWindow
