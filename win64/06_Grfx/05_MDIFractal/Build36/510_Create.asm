wmSieveCreate:

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

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
        mov r8,40h ;sizeof SieveData
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpSieveData,rax

;SetWindowLong (hwnd, 0, (long) lpSieveData)
        Call3 SetWindowLongPtrA,hwnd,0,lpSieveData

;Re-Load SIEVEDATA address
	include 511_GetData.asm
;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	GetSieveData

;Load Vertex Colors
	mov rax,lpSieveR ;r[0]
	add rax,3 ;r[1]
	mov byte ptr[rax],0FFh ;Red
	inc rax ;g[1]
	mov byte ptr[rax],2 ;Green = 2 for Debug Purpose
	inc rax ;b[1]
	mov byte ptr[rax],3 ;Blue = 3 for Debug Purpose
	inc rax ;r[2]
	mov byte ptr[rax],4 ;Red = 4 for Debug Purpose
	inc rax ;g[2]
	mov byte ptr[rax],0FFh ;Green
	inc rax ;b[2]
	mov byte ptr[rax],6 ;Blue = 6 for Debug Purpose
	inc rax ;r[3]
	mov byte ptr[rax],7 ;Red = 7 for Debug Purpose
	inc rax ;g[3]
	mov byte ptr[rax],8 ;Green = 8 for Debug Purpose
	inc rax ;b[3]
	mov byte ptr[rax],0FFh ;Blue

;Start the timer going
        ;Call4 SetTimer,hwnd,1,0FFh,0

;Save some window handles
        Call1 GetParent,hwnd
        mov hwndClientS,rax
        Call1 GetParent,hwndClientS
        mov hwndFrameS,rax

;return 0
xor rax,rax
jmp endSieveWndProc

