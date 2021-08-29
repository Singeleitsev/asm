wmR3Size:

;if (wParam != SIZE_MINIMIZED)
	cmp r8,1
	je defR3WndProc

Call2 GetWindowLongPtrA,hwnd,0
mov lpR3Data,rax

;Spell64rax hwnd, szR3Title, szGetWindow

;cmp rax,lpGlobalData
;jne errR3WndProc

;lpR3Data->cxClient = LOWORD (lParam) ;
	mov r9,lParam
	and r9,0FFFFh
	mov rax,lpR3Data
	mov qword ptr [rax],r9 ;lpR3Data->cxClient

;lpR3Data->cyClient = HIWORD (lParam) ;
	mov r9,lParam
	shr r9,10h ;HIWORD (lParam)
	and r9,0FFFFh
	mov rax,lpR3Data
	mov qword ptr [rax+8],r9 ;lpR3Data->cyClient

;break ; // WM_SIZE must be processed by DefMDIChildProc
        jmp defR3WndProc


