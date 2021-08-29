;// Create an OpenGL compatible window class

lblRegChild2DClass:

sub rsp,20h
;wc.cbSize = sizeof(WNDCLASSEX);
mov wc.cbSize,50h

;wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC | CS_DBLCLKS;
mov wc.style,2Bh

;wc.lpfnWndProc = (WNDPROC)Child2DWndProc;
lea rax,Child2DWndProc ;qword ptr ds:[13F121540]
mov wc.lpfnWndProc,rax

;wc.cbClsExtra = 0;
mov wc.cbClsExtra,0

;wc.cbWndExtra = 0;
mov cbWndExtra,0

;wc.hInstance = hInstance;
mov rax,hInstance
mov wc.hInstance,rax

;wc.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
mov rcx,hInstance
mov rdx,69h
call LoadIconA
mov wc.hIcon,rax

;wc.hCursor = LoadCursor(NULL, IDC_ARROW);
xor rcx,rcx
mov edx,7F00h
call LoadCursorA
mov wc.hCursor,rax

;wc.hbrBackground = (HBRUSH)(COLOR_3DSHADOW+1);// Background color (Only seen if OGL fails)
mov wc.hbrBackground,11h

;wc.lpszMenuName = NULL;
mov wc.lpszMenuName,0

;wc.lpszClassName = g_szChild2DClassName;
lea rax,g_szChild2DClassName ;qword ptr ds:[13F14C028]
mov wc.lpszClassName,rax

;wc.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CHILDICON));
mov rcx,hInstance
mov rdx,69h
call LoadIconA
mov wc.hIconSm,rax



;if(!RegisterClassEx(&wc))
lea rcx,wc
callRegisterClassExA
add rsp,20h

cmp rax,0
jne lblRegFrameClass

;{
;MessageBox(NULL,"Failed to register the child window","Error",MB_OK|MB_ICONEXCLAMATION);
sub rsp,20h
mov rcx,0
lea rdx,szFailRegChild
lea r8,szErr
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
add rsp,20h

;return FALSE;
xor rax,rax
jmp endWinMain
;}

