wmFrameCreate:

;mov rax,g_hMenuFrame_Window
;mov clientcreate.hWindowMenu,rax
mov clientcreate.hWindowMenu,0

mov clientcreate.idFirstChild,IDM_FIRSTCHILD

xor rcx,rcx ;dwExStyle
lea rdx,szClassClient ;lpszFrameClass
xor r8,r8 ;lpszFrameTitle
mov r9,52000000h ;dwStyle=WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN
mov qword ptr [rsp+20h],0 ;x
mov qword ptr [rsp+28h],0 ;y
mov qword ptr [rsp+30h],0 ;nWidth
mov qword ptr [rsp+38h],0 ;nHeight
mov rax,hwnd
mov qword ptr [rsp+40h],rax ;hWndParent
mov qword ptr [rsp+48h],1 ;hMenu = 1. Why?!
mov rax,g_hInst
mov qword ptr [rsp+50h],rax
lea rax,clientcreate
mov qword ptr [rsp+58h],rax ;lpParam == lpClientStruct
call CreateWindowExA
mov g_hWndClient,rax

jmp lbl_FrameWndProc_Return0

