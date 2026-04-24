wmRectSize:

;if (wParam != SIZE_MINIMIZED)
	cmp r8,1
	je defRectWndProc

Call2 GetWindowLongPtrA,hwnd,0
mov lpRectData,rax

;Spell64rax hwnd, szRectTitle, szGetWindow

;cmp rax,lpGlobalData
;jne errRectWndProc

;lpRectData->cxClient = LOWORD (lParam) ;
	mov r9,lParam
	and r9,0FFFFh
	mov rax,lpRectData
	mov qword ptr [rax],r9 ;lpRectData->cxClient

;lpRectData->cyClient = HIWORD (lParam) ;
	mov r9,lParam
	shr r9,10h ;HIWORD (lParam)
	and r9,0FFFFh
	mov rax,lpRectData
	mov qword ptr [rax+8],r9 ;lpRectData->cyClient

;break ; // WM_SIZE must be processed by DefMDIChildProc
        jmp defRectWndProc


