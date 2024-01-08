wmGasketCreate:

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
;sizeof GASKETDATA = 80h
;See 611_SetPointers.asm
        mov r8,80h 
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpGasketData,rax

;SetWindowLong (hwnd, 0, (long) lpGasketData)
        Call3 SetWindowLongPtrA,hwnd,0,lpGasketData

;Re-Load GASKETDATA address
;lpGasketData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetGasketDataPointers

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

