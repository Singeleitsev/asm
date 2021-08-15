wmRBMKSize:

;if (wParam != SIZE_MINIMIZED)
	cmp r8,1
	je defRBMKWndProc

Call2 GetWindowLongPtrA,hwnd,0
mov lpRBMKData,rax

;Spell64rax hwnd, szRBMKTitle, szGetWindow

;cmp rax,lpGlobalData
;jne errRBMKWndProc

;lpRBMKData->cxClient = LOWORD (lParam) ;
	mov r9,lParam
	and r9,0FFFFh
	mov rax,lpRBMKData
	mov qword ptr [rax],r9 ;lpRBMKData->cxClient

;lpRBMKData->cyClient = HIWORD (lParam) ;
	mov r9,lParam
	shr r9,10h ;HIWORD (lParam)
	and r9,0FFFFh
	mov rax,lpRBMKData
	mov qword ptr [rax+8],r9 ;lpRBMKData->cyClient

;break ; // WM_SIZE must be processed by DefMDIChildProc
        jmp defRBMKWndProc


