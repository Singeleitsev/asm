wmSpongeCreate:

;Allocate memory for window private data
	call GetProcessHeap
	mov rcx,rax
	mov rdx,8 ;HEAP_ZERO_MEMORY
	mov r8,10h ;sizeof SpongeDATA
	call HeapAlloc
	mov lpSpongeData,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

Call3 SetWindowLongPtrA,hwnd,0,lpSpongeData

;cmp rax,0
;je errSpongeWndProc

;Start the timer going
        Call4 SetTimer,hwnd,1,0FAh,0 ;250 ms = 0FAh

;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientChild[06],rax

	Call1 GetParent,s_hwndClientChild[06]
	mov s_hwndFrameChild[06],rax

;return 0 ;
        xor rax,rax
        jmp endSpongeWndProc



