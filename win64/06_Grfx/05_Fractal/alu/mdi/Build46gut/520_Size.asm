wmSieveSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defSieveWndProc

;SIEVEDATA
;----------------------------------
;00h-i ;Iteration Counter
;----------------------------------
;lpSieveX = [lpSieveData+10h]
;0Ch-x[3];08h-x[2];04h-x[1];00h-x[0] ;x Coordinate
;----------------------------------
;lpSieveY = [lpSieveData+20h]
;0Ch-y[3];08h-y[2];04h-y[1];00h-y[0] ;y Coordinate
;----------------------------------
;lpSieveR = [lpSieveData+30h] ;Red Color goes first
;02h-b[0];01h-g[0];00h-r[0] ;Variables
;05h-b[1];04h-g[1];03h-r[1] ;Vertex 1
;08h-b[2];07h-g[2];06h-r[2] ;Vertex 2
;0Bh-b[3];0Ah-g[3];09h-r[3] ;Vertex 3
;----------------------------------
;Vertex Colors are loaded in wmSieveCreate
;Coordinates of Vertices are calculated in wmSieveSize
;Coordinates of Current Point are calculated in wmSievePaint

;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	GetSieveData

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


