wmSieveSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defSieveWndProc

;Re-Set SIEVEDATA Pointers
;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetSieveDataPointers

;Calculate X-Coordinates:
;x[0] = [lpSieveX] = Variable
;x[1] = [lpSieveX+04h] = w/2
;x[2] = [lpSieveX+08h] = 0
;x[3] = [lpSieveX+0Ch] = w

;xWidth = LOWORD (lParam)
	mov r9,lParam
	and r9,0FFFFh
;x[3] = [lpSieveX+0Ch] = w
	mov rax,lpSieveX
	add rax,0Ch
	mov dword ptr[rax],r9d
;x[1] = [lpSieveX+04h] = w/2
	shr r9,1 ;Divide by 2
	mov rax,lpSieveX
	add rax,4
	mov dword ptr [rax],r9d
;x[2] = [lpSieveX+08h] = 0
	mov rax,lpSieveX
	add rax,8
	mov dword ptr [rax],0

;Calculate Y-Coordinates:
;y[0] = [lpSieveY] = Variable
;y[1] = [lpSieveY+04h] = 0
;y[2] = [lpSieveY+08h] = h
;y[3] = [lpSieveY+0Ch] = h

;yHeight = HIWORD (lParam)
        mov r9,lParam
        shr r9,10h ;HIWORD (lParam)
        and r9,0FFFFh
;y[2] = [lpSieveY+08h] = h
	mov rax,lpSieveY
	add rax,8
	mov dword ptr [rax],r9d
;y[3] = [lpSieveY+0Ch] = h
	mov rax,lpSieveY
	add rax,0Ch
	mov dword ptr [rax],r9d
;y[1] = [lpSieveY+04h] = 0
	mov rax,lpSieveY
	add rax,4
	mov dword ptr [rax],0

;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defSieveWndProc


