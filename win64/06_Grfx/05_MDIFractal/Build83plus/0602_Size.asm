wmGasketSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defGasketWndProc

;Set GASKETDATA Pointers
;lpGasketData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetGasketDataPointers

;Calculate X-Coordinates:
;x[0] = [lpGasketX+00h] = Variable
;x[1] = [lpGasketX+04h] = w/2
;x[2] = [lpGasketX+08h] = w
;x[3] = [lpGasketX+0Ch] = w
;x[4] = [lpGasketX+10h] = w
;x[5] = [lpGasketX+14h] = w/2
;x[6] = [lpGasketX+18h] = 0
;x[7] = [lpGasketX+1Ch] = 0
;x[8] = [lpGasketX+20h] = 0

;xWidth = LOWORD (lParam)
	mov r9,lParam
	and r9,0FFFFh

;x[2] = [lpGasketX+08h] = w
	mov rax,lpGasketX
	add rax,8
	mov dword ptr[rax],r9d
;x[3] = [lpGasketX+0Ñh] = w
	mov rax,lpGasketX
	add rax,0Ch
	mov dword ptr[rax],r9d
;x[4] = [lpGasketX+10h] = w
	mov rax,lpGasketX
	add rax,10h
	mov dword ptr[rax],r9d

;x[1] = [lpGasketX+04h] = w/2
	shr r9,1 ;Divide by 2
	mov rax,lpGasketX
	add rax,4
	mov dword ptr [rax],r9d
;x[5] = [lpGasketX+14h] = w/2
	mov rax,lpGasketX
	add rax,14h
	mov dword ptr [rax],r9d

;x[6] = [lpGasketX+18h] = 0
	mov rax,lpGasketX
	add rax,18h
	mov dword ptr [rax],0
;x[7] = [lpGasketX+1Ñh] = 0
	mov rax,lpGasketX
	add rax,1Ch
	mov dword ptr [rax],0
;x[8] = [lpGasketX+20h] = 0
	mov rax,lpGasketX
	add rax,20h
	mov dword ptr [rax],0

;Calculate Y-Coordinates
;y[0] = [lpGasketY+00h] = Variable
;y[1] = [lpGasketY+04h] = 0
;y[2] = [lpGasketY+08h] = 0
;y[3] = [lpGasketY+0Ch] = h/2
;y[4] = [lpGasketY+10h] = h
;y[5] = [lpGasketY+14h] = h
;y[6] = [lpGasketY+18h] = h
;y[7] = [lpGasketY+1Ch] = h/2
;y[8] = [lpGasketY+20h] = 0

;yHeight = HIWORD (lParam)
        mov r9,lParam
        shr r9,10h ;HIWORD (lParam)
        and r9,0FFFFh

;y[4] = [lpGasketData+10h] = h
	mov rax,lpGasketY
	add rax,10h
	mov dword ptr [rax],r9d
;y[5] = [lpGasketData+14h] = h
	mov rax,lpGasketY
	add rax,14h
	mov dword ptr [rax],r9d
;y[6] = [lpGasketData+18h] = h
	mov rax,lpGasketY
	add rax,18h
	mov dword ptr [rax],r9d

;y[3] = [lpGasketData+0Ch] = h/2
	shr r9,1 ;Divide by 2
	mov rax,lpGasketY
	add rax,0Ch
	mov dword ptr [rax],r9d
;y[7] = [lpGasketData+1Ch] = h/2
	mov rax,lpGasketY
	add rax,1Ch
	mov dword ptr [rax],r9d

;y[1] = [lpGasketData+04h] = 0
	mov rax,lpGasketY
	add rax,4
	mov dword ptr [rax],0
;y[2] = [lpGasketData+08h] = 0
	mov rax,lpGasketY
	add rax,8
	mov dword ptr [rax],0

;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defGasketWndProc


