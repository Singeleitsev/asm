;// Create the frame window

lblRegFrameClass:
sub rsp,20h

;wc.cbSize = sizeof(WNDCLASSEX);
mov wc.cbSize,50h

;wc.style = CS_HREDRAW | CS_VREDRAW;
mov wc.style,3

;wc.lpfnWndProc = (WNDPROC)WndProc;
lea rax,WndProc ;qword ptr ds:[13F127390]
mov wc.lpfnWndProc ,rax

;wc.cbClsExtra = 0;
mov wc.cbClsExtra,0

;wc.cbWndExtra = 0;
mov cbWndExtra,0

;wc.hInstance = hInstance;
mov rax,hInstance
mov wc.hInstance,rax

;wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));
mov rcx,hInstance
mov rdx,68h
call LoadIconA
mov wc.hIcon,rax

;wc.hCursor = LoadCursor(NULL, IDC_ARROW);
xor rcx,rcx
mov edx,7F00h
call LoadCursorA
mov wc.hCursor,rax

;wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);
mov wc.hbrBackground,11h

;wc.lpszMenuName = "MAIN";
lea rax,szMainMenuName ;qword ptr ds:[13F1408F8] ;"MAIN"
mov wc.lpszMenuName,rax

;wc.lpszClassName = g_szMainClassName;
lea rax,g_szMainClassName ;qword ptr ds:[13F14C008] ;"MainWindow"
mov wc.lpszClassName,rax

;wc.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MYICON));
mov rcx,hInstance
mov rdx,68h
call LoadIconA
mov wc.hIcon,rax



;if(!RegisterClassEx(&wc))
lea rcx,wc
call RegisterClassExA
add rsp,20h

cmp rax,0
jne lblCreateFrameWindow

;{
;MessageBox(0, "Failed to register the main window","Error",MB_ICONEXCLAMATION | MB_OK);
sub rsp,20h
mov rcx,0
lea rdx,szFailRegMain
lea r8,szErr
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
add rsp,20h

;return -1;
mov rax,-1
jmp endWinMain
;}



lblCreateFrameWindow:
;g_hMainWindow = CreateWindowEx(WS_EX_LEFT, g_szMainClassName, "Al's OpenGL MDI Example",
;WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN,
;CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
;NULL, NULL, hInstance, NULL);
sub rsp,60h
xor rcx,rcx ;WS_EX_LEFT
lea rdx,g_szMainClassName ;qword ptr ds:[13F14C008] ;"MainWindow"
lea r8,szAppTitle ;"Al's OpenGL MDI Example"
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
add rsp,60h



;if(g_hMainWindow == NULL)
cmp rax,0
jne lblCreateFrameWindow
;{
;MessageBox(0, "Failed to create window.", "ERROR", MB_ICONEXCLAMATION | MB_OK);
sub rsp,20h
mov rcx,0
lea rdx,szFailCreateFrame
lea r8,szErr
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
add rsp,20h

;return -1;
mov rax,-1
jmp endWinMain
;}


sub rsp,20h
;ShowWindow(g_hMainWindow, nCmdShow);
mov rcx,g_hMainWindow
mov rdx,nCmdShow ;SW_SHOWNORMAL = 1
call ShowWindow

;UpdateWindow(g_hMainWindow);
mov rcx,g_hMainWindow
call UpdateWindow

add rsp,20h


