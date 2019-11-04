;===================================================================
FrameWndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;===================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h

;Align the Stack by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA
        mov hWnd,rcx
        mov uMsg,rdx
        mov wParam,r8
        mov lParam,r9

;Window Messages processing
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmFrameCreate
        cmp rdx,111h ;WM_COMMAND = 0x0111
                je wmFrameCommand
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmFrameClose
        cmp rdx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        jmp defFrmProc

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

wmFrameCommand:
        mov r9,lParam ;lParam is already in r9
        cmp r9,0
                jne endFrmProc
        ;Distributing with respect to wParam
	mov r8,wParam ;wParam is already in r8
        cmp r8,IDM_NEW
                je idmFrameNew
        cmp r8,IDM_CLOSE
                je idmFrameClose
	cmp r8,IDM_CLOSEALL
		je idmFrameCloseAll
        cmp r8,IDM_EXIT
                je idmFrameExit
        cmp r8,IDM_TILEHORZ
                je idmFrameTileHorz
        cmp r8,IDM_TILEVERT
                je idmFrameTileVert
        cmp r8,IDM_CASCADE
                je idmFrameCascade
        cmp r8,IDM_ABOUT
                je idmFrameAbout
        jmp defFrameCmd

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
        idmFrameClose:
               	;WM_MDIGETACTIVE = 229h
		Call4 SendMessageA,hWndClient,229h,0,0
		mov hWndChild,rax
		;WM_QUERYENDSESSION = 11h
		;In Windows NT WM_QUERYENDSESSION can be sent
		;only to the Frame Window
		Call4 SendMessageA,hWndChild,11h,0,0
		test rax,rax
		je @f
		;WM_MDIDESTROY = 221h
		Call4 SendMessageA,hWndClient,221h,hWndChild,0
		@@:
		xor rax,rax
		jmp endFrmProc
	idmFrameCloseAll:
		Call3 EnumChildWindows,hWndClient,offset CloseEnumProc,0
		xor rax,rax
		jmp endFrmProc
        idmFrameExit:
                ;WM_CLOSE = 0x0010
                Call4 SendMessageA, hWnd, 10h, 0, 0
		xor rax,rax 
                jmp endFrmProc
        idmFrameTileHorz:
                ;WM_MDITILE = 0x0226 ;MDITILE_HORIZONTAL = 1
                Call4 SendMessageA, hWndClient, 226h, 1, 0
		xor rax,rax 
                jmp endFrmProc
        idmFrameTileVert:
                ;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
                Call4 SendMessageA, hWndClient, 226h, 0, 0
		xor rax,rax 
                jmp endFrmProc
        idmFrameCascade:
                ;WM_MDICASCADE = 0x0227 ;MDITILE_SKIPDISABLED = 2
                Call4 SendMessageA, hWndClient, 227h, 2, 0
		xor rax,rax 
                jmp endFrmProc
        idmFrameAbout:
		;MB_OK + MB_ICONINFORMATION = 40h
                Call4 MessageBoxA, hWnd, offset szAbout, offset szFrameTitle, 40h
		xor rax,rax 
                jmp endFrmProc
        defFrameCmd:
                ;Pass to active child...
                        ;WM_MDIGETACTIVE = 0x0229
                        Call4 SendMessageA, hWndClient, 229h, 0, 0
                        mov hWndChild,rax
                        Call1 IsWindow, hWndChild
                        cmp rax,0
			jne defFrmProc
                        ;WM_COMMAND = 0x0111
                        Call4 SendMessageA, hWndChild, 111h, wParam, lParam
                ;...and then to DefFrameProc
                        jmp defFrmProc

wmFrameClose:
	Call4 SendMessage,hWnd,111h,IDM_CLOSEALL,0
	Call2 GetWindow,hWndClient,5 ;GW_CHILD = 5
	test rax,rax
		je defFrmProc
	xor rax,rax
	jmp endFrmProc

wmFrameDestroy:
        Call1 PostQuitMessage, 0
        xor rax,rax
        jmp endFrmProc

defFrmProc:
        Call5 DefFrameProcA, hWnd, hWndClient, uMsg, wParam, lParam

endFrmProc:
;Assembler will add this epilogue automatically:
	;leave 
        ret
FrameWndProc endp

