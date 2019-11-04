;mdidemo401319:
wmFrameCreate:

;clientcreate.hWindowMenu = hMenuInitWindow ;
	m64m64 clientcreate.hWindowMenu,hMenuInitWindow

;clientcreate.idFirstChild = IDM_FIRSTCHILD ;
	mov clientcreate.idFirstChild,IDM_FIRSTCHILD

;hwndClient = CreateWindow ("MDICLIENT", NULL,
	;WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE,
	;0, 0, 0, 0, hwnd, (HMENU) 1, hInst,
	;(LPSTR) &clientcreate) ;
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
	m64m64 qword ptr [rsp+50h],hInst
	m64addr qword ptr [rsp+58h],clientcreate ;lpParam == lpClientStruct
	call CreateWindowExA
	mov hwndClientF,rax
	add rsp,60h

;return 0 ;
	xor rax,rax
	jmp endFrmProc ;mdidemo401655

