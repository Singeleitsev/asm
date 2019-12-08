wmTreeSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defTreeWndProc

;Re-Set TREEDATA Pointers
;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetTreeDataPointers

;Width = LOWORD (lParam)
	mov r9,lParam
	and r9,0FFFFh
;R9D = w/2
	shr r9,1 ;Divide by 2
;CenterX = w/2
	mov rsi,lpTreeCX
	mov dword ptr[rsi],r9d

;Height = HIWORD (lParam)
        mov r9,lParam
        shr r9,10h ;HIWORD (lParam)
        and r9,0FFFFh
;R9D = h/2
	shr r9,1 ;Divide by 2
;CenterY = h/2
	mov rdi,lpTreeCY
	mov dword ptr[rdi],r9d

;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defTreeWndProc


