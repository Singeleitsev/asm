wmR3Create:

;Allocate memory for window private data
	call GetProcessHeap
	mov rcx,rax
	mov rdx,8 ;HEAP_ZERO_MEMORY
	mov r8,10h ;sizeof R3DATA
	call HeapAlloc
	mov lpR3Data,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

Call3 SetWindowLongPtrA,hwnd,0,lpR3Data

;cmp rax,0
;je errR3WndProc

;Start the timer going
        Call4 SetTimer,hwnd,1,0FAh,0 ;250 ms = 0FAh

;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientR,rax

	Call1 GetParent,s_hwndClientR
	mov s_hwndFrameR,rax

;return 0 ;
        xor rax,rax
        jmp endR3WndProc



