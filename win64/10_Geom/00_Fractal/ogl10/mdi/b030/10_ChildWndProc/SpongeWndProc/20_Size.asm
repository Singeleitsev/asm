wmSpongeSize:

;if (wParam != SIZE_MINIMIZED)
	cmp r8,1
	je defSpongeWndProc

Call2 GetWindowLongPtrA,hwnd,0
mov lpSpongeData,rax

;Spell64rax hwnd, szSpongeTitle, szGetWindow

;cmp rax,lpGlobalData
;jne errSpongeWndProc

;lpSpongeData->cxClient = LOWORD (lParam) ;
	mov r9,lParam
	and r9,0FFFFh
	mov rax,lpSpongeData
	mov qword ptr [rax],r9 ;lpSpongeData->cxClient

;lpSpongeData->cyClient = HIWORD (lParam) ;
	mov r9,lParam
	shr r9,10h ;HIWORD (lParam)
	and r9,0FFFFh
	mov rax,lpSpongeData
	mov qword ptr [rax+8],r9 ;lpSpongeData->cyClient

;break ; // WM_SIZE must be processed by DefMDIChildProc
        jmp defSpongeWndProc


