wmSieveCreate:

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
;sizeof SIEVEDATA = 40h
;See 511_SetPointers.asm
        mov r8,40h
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpSieveData,rax

;SetWindowLong (hwnd, 0, (long) lpSieveData)
        Call3 SetWindowLongPtrA,hwnd,0,lpSieveData

;Re-Load SIEVEDATA address
;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetSieveDataPointers

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

