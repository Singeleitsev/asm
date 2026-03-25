idmFrameNew:

;Initialize the MDICREATESTRUCT
	m64addr MDICreate.szClass,szChildClass
	m64addr MDICreate.szTitle,szChildTitle
	m64m64 MDICreate.hOwner,hInstance
	mov rax, 80000000h ;CW_USEDEFAULT
	mov MDICreate.x, eax
	mov MDICreate.y, eax
	mov MDICreate.lx, eax
	mov MDICreate.ly, eax
	mov MDICreate.style, 0
	mov MDICreate.lParam, 0

;WM_MDICREATE = 0x0220
Call4 SendMessageA, hWndClient, 220h, 0, offset MDICreate
mov hWndChild,rax

xor rax,rax 
jmp endFrmProc