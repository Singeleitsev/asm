wmSpongeDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpSpongeData,rax

;cmp lpGlobalData,rax
;jne errSpongeWndProc

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpSpongeData

Call2 KillTimer,hwnd,1

;return 0 ;
	xor rax,rax
	jmp endSpongeWndProc ;mdidemo401CE5

