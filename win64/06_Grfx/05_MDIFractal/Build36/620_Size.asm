wmGasketSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defGasketWndProc

;GASKETDATA
;----------------------------------
;00h-i ;Iteration Counter
;----------------------------------
;lpGasketX = [lpGasketData+10h]
;08h-x[2];04h-x[1];00h-x[0] ;x Coordinate
;14h-x[5];10h-x[4];0Ch-x[3]
;20h-x[8];1Ch-x[7];18h-x[6]
;----------------------------------
;lpGasketY = [lpGasketData+34h]
;08h-y[2];04h-y[1];00h-y[0] ;y Coordinate
;14h-y[5];10h-y[4];0Ch-y[3]
;20h-y[8];1Ch-y[7];18h-y[6]
;----------------------------------
;lpGasketR = [lpGasketData+58h]
;02h-b[0];01h-g[0];00h-r[0] ;Colors
;05h-b[1];04h-g[1];03h-r[1] ;Colors
;08h-b[2];07h-g[2];06h-r[2] ;Colors
;0Bh-b[3];0Ah-g[3];09h-r[3] ;Colors
;0Eh-b[4];0Dh-g[4];0Ch-r[4] ;Colors
;11h-b[5];10h-g[5];0Fh-r[5] ;Colors
;14h-b[6];13h-g[6];12h-r[6] ;Colors
;17h-b[7];16h-g[7];15h-r[7] ;Colors
;1Ah-b[8];19h-g[8];18h-r[8] ;Colors
;----------------------------------
;Vertex Colors are loaded in wmGasketCreate
;Coordinates of Vertices are calculated in wmGasketSize
;Coordinates of Current Point are calculated in wmGasketPaint

;lpGasketData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	GetGasketData

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


