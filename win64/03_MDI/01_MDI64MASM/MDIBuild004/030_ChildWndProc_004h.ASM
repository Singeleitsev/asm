;================================================================
ChildWndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h

;Align the Stack by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA:
        mov hWnd, rcx
        mov uMsg, rdx
        mov wParam, r8
        mov lParam, r9

;Distributing with respect to uMsg
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmChildCreate
        cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
                je wmChildActivate
        cmp rdx,202h ;WM_LBUTTONUP = 0x0202
                je wmChildLButtonUp
	cmp rdx,11h ;WM_QUERYENDSESSION = 0x0011
		;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
		je wmEndSession
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmChildClose
        jmp defChildProc

wmChildCreate:
	nop
        jmp endChildProc

wmChildActivate:
        ;mov rcx, hWnd
        ;mov r9, lParam
        cmp r9,rcx
                jne notChild
        ;Child:
                ;WM_MDISETMENU = 0x0230
                Call4 SendMessageA, hWndClient, 230h, hChildMenu, hChildSubMenu
                Call1 DrawMenuBar, hWndFrame
		xor rax,rax
                jmp endChildProc
        notChild:
                ;WM_MDISETMENU = 0x0230
                Call4 SendMessageA, hWndClient, 230h, hMainMenu, hMainSubMenu
                Call1 DrawMenuBar, hWndFrame
		xor rax,rax
                jmp endChildProc

wmChildLButtonUp:
        ;MB_OK + MB_ICONINFORMATION = 40h
        Call4 MessageBoxA, hWnd, offset szHello, offset szFrameTitle, 40h
	xor rax,rax
        jmp endChildProc

;case WM_QUERYENDSESSION :
wmEndSession:
	;jmp wmChildClose

wmChildClose:
	Call4 MessageBoxA,hWnd,offset szClose,offset szFrameTitle,21h
	cmp rax,1 ;IDOK
	je defChildProc ;mdidemo40191B
	xor rax,rax
	jmp endChildProc

defChildProc:
        Call4 DefMDIChildProcA, hWnd, uMsg, wParam, lParam

endChildProc:
;Assembler will add this epilogue automatically:
	;leave
        ret
ChildWndProc endp