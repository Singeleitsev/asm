wmFrameCreate:

m64m64 clientcreate.hWindowMenu,g_hMenuInitWindow

mov clientcreate.idFirstChild,IDM_FIRSTCHILD

sub rsp,60h
xor rcx,rcx ;dwExStyle
lea rdx,szClientClass ;lpszFrameClass
xor r8,r8 ;lpszFrameTitle
mov r9,52000000h ;dwStyle=WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN
mov qword ptr [rsp+20h],0 ;x
mov qword ptr [rsp+28h],0 ;y
mov qword ptr [rsp+30h],0 ;nWidth
mov qword ptr [rsp+38h],0 ;nHeight
m64m64 qword ptr [rsp+40h],hwnd ;hWndParent
mov qword ptr [rsp+48h],1 ;hMenu = 1. Why?!
m64m64 qword ptr [rsp+50h],g_hInst
m64addr qword ptr [rsp+58h],clientcreate ;lpParam == lpClientStruct
call CreateWindowExA
mov s_hwndClientF,rax
add rsp,60h

xor rax,rax
jmp endFrmProc

