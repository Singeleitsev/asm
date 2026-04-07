;case WM_CREATE:
lbl_WndProc_Create:

mov ccs.hWindowMenu,0
mov ccs.idFirstChild,ID_MDI_FIRSTCHILD

;g_hMDIClient = CreateWindowEx(WS_EX_CLIENTEDGE, "MDICLIENT", NULL,
;WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
;CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
;hWnd, (HMENU)ID_MDI_CLIENT, g_hInst, (LPVOID)&ccs);
mov rcx,200h ;WS_EX_CLIENTEDGE
lea rdx,szClientClassName
xor r8,r8
mov r9,52000000h ;WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr[rsp+20h],rax
mov qword ptr[rsp+28h],rax
mov qword ptr[rsp+30h],rax
mov qword ptr[rsp+38h],rax
mov rax,hWnd
mov qword ptr[rsp+40h],rax
mov qword ptr[rsp+48h],ID_MDI_CLIENT
mov rax,g_hInst
mov qword ptr[rsp+50h],rax
lea rax,ccs
mov qword ptr[rsp+58h],rax
Call CreateWindowExA
mov g_hMDIClient,rax
cmp rax,0 ;hChild
je lbl_CreateMDIClient_Err

include 101_001_CreateMenuMain.asm

jmp lbl_WndProc_Return0

