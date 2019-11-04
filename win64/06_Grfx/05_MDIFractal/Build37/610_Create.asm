wmGasketCreate:

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

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
        mov r8,80h ;sizeof GASKETDATA
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpGasketData,rax

;SetWindowLong (hwnd, 0, (long) lpGasketData)
        Call3 SetWindowLongPtrA,hwnd,0,lpGasketData

;Re-Load GASKETDATA address
	include 611_GetData.asm
;lpGasketData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	GetGasketData

;Load Vertex Colors

;Red
	mov rax,lpGasketR ;r[0]
	add rax,3 ;r[1]
	mov byte ptr[rax],0FFh ;Red
	inc rax ;g[1]
	mov byte ptr[rax],0 ;Green
	inc rax ;b[1]
	mov byte ptr[rax],0 ;Blue
;Orange
	inc rax ;r[2]
	mov byte ptr[rax],0FFh ;Red
	inc rax ;g[2]
	mov byte ptr[rax],0AAh ;Green
	;mov byte ptr[rax],55h ;Green
	inc rax ;b[2]
	mov byte ptr[rax],0 ;Blue
;Yellow
	inc rax ;r[3]
	;mov byte ptr[rax],7Fh ;Red
	mov byte ptr[rax],0FFh ;Red
	inc rax ;g[3]
	mov byte ptr[rax],0FFh ;Green
	;mov byte ptr[rax],0AAh ;Green
	inc rax ;b[3]
	mov byte ptr[rax],0 ;Blue
;Green
	inc rax ;r[4]
	mov byte ptr[rax],0 ;Red
	;mov byte ptr[rax],0AAh ;Red
	inc rax ;g[4]
	mov byte ptr[rax],0FFh ;Green
	inc rax ;b[4]
	mov byte ptr[rax],55h ;Blue
;Cyan/Green
	inc rax ;r[5]
	mov byte ptr[rax],0 ;Red
	inc rax ;g[5]
	mov byte ptr[rax],0FFh ;Green
	inc rax ;b[5]
	mov byte ptr[rax],0FFh ;Blue
	;mov byte ptr[rax],0 ;Blue
;Blue
	inc rax ;r[6]
	mov byte ptr[rax],0 ;Red
	inc rax ;g[6]
	mov byte ptr[rax],55h ;Green
	inc rax ;b[6]
	mov byte ptr[rax],0FFh ;Blue
	;mov byte ptr[rax],0AAh ;Blue
;Purple
	inc rax ;r[7]
	mov byte ptr[rax],7Fh ;Red
	inc rax ;g[7]
	mov byte ptr[rax],0 ;Green
	inc rax ;b[7]
	mov byte ptr[rax],0FFh ;Blue
;Magenta
	inc rax ;r[8]
	mov byte ptr[rax],0FFh ;Red
	inc rax ;g[8]
	mov byte ptr[rax],0 ;Green
	inc rax ;b[8]
	mov byte ptr[rax],0AAh ;Blue


;Start the timer going
        ;Call4 SetTimer,hwnd,1,0FFh,0

;Save some window handles
        Call1 GetParent,hwnd
        mov hwndClientG,rax
        Call1 GetParent,hwndClientG
        mov hwndFrameG,rax

;return 0
xor rax,rax
jmp endGasketWndProc

