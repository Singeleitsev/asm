wmRectCreate:

;Allocate memory for window private data
	sub rsp,20h
	call GetProcessHeap
	mov rcx,rax
	mov rdx,8 ;HEAP_ZERO_MEMORY
	mov r8,10h ;sizeof RECTDATA
	call HeapAlloc
	add rsp,20h
	mov lpRectData,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

Call3 SetWindowLongPtrA,hwnd,0,lpRectData

;cmp rax,0
;je errRectWndProc

;Start the timer going
        Call4 SetTimer,hwnd,1,0FAh,0 ;250 ms = 0FAh

;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientR,rax

	Call1 GetParent,s_hwndClientR
	mov s_hwndFrameR,rax

;return 0 ;
        xor rax,rax
        jmp endRectWndProc



