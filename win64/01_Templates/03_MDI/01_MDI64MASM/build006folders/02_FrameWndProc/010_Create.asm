wmFrameCreate:

;Initialize the CLIENTSTRUCT
m64m64 ClientStruct.hWindowMenu,hMainSubMenu
mov ClientStruct.idFirstChild,IDM_FIRSTCHILD
sub rsp,60h
xor rcx,rcx ;dwExStyle
lea rdx,szClientClass ;lpszFrameClass
xor r8,r8 ;lpszFrameTitle
mov r9,52000000h ;dwStyle=WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT
mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT
mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT
mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT
m64m64 qword ptr [rsp+40h],hWnd ;hWndParent
mov qword ptr [rsp+48h],0 ;hMenu
m64m64 qword ptr [rsp+50h],hInstance
m64addr qword ptr [rsp+58h],ClientStruct ;lpParam == lpClientStruct
call CreateWindowExA
add rsp,60h
mov hWndClient,rax

xor rax,rax
jmp endFrmProc