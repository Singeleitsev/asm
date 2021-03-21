wmTreeSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defTreeWndProc

;Re-Set TREEDATA Pointers
;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetTreeDataPointers

;Width = LOWORD (lParam)
	mov r9,lParam
	and r9,0FFFFh
;Margin Right = w - 1
	mov rax,lpTreeMR
	mov dword ptr[rax],r9d
	dec dword ptr[rax]
;Margin Width = w
	mov rax,lpTreeMW
	mov dword ptr[rax],r9d
	dec dword ptr[rax]
	dec dword ptr[rax]
;R9D = w/2
	shr r9,1 ;Divide by 2
;CenterX = w/2
	mov rsi,lpTreeCX
	mov dword ptr[rsi],r9d
;Margin Left = 1
	mov rax,lpTreeML
	mov dword ptr[rax],1


;Height = HIWORD (lParam)
        mov r9,lParam
        shr r9,10h ;HIWORD (lParam)
        and r9,0FFFFh
;Margin Bottom = h - 1
	mov rax,lpTreeMB
	mov dword ptr[rax],r9d
	dec dword ptr[rax]
;Margin Height = h - 2
	mov rax,lpTreeMH
	mov dword ptr[rax],r9d
	dec dword ptr[rax]
	dec dword ptr[rax]
;R9D = h/2
	shr r9,1 ;Divide by 2
;CenterY = h/2
	mov rdi,lpTreeCY
	mov dword ptr[rdi],r9d
;Margin Top = 1
	mov rax,lpTreeMT
	mov dword ptr[rax],1



;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defTreeWndProc


