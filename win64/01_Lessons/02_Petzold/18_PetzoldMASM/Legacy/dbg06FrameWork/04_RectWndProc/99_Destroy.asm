wmRectDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpRectData,rax

;cmp lpGlobalData,rax
;jne errRectWndProc

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpRectData

Call2 KillTimer,hwnd,1

;return 0 ;
	xor rax,rax
	jmp endRectWndProc ;mdidemo401CE5

