wmRBMKDestroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpRBMKData,rax

;cmp lpGlobalData,rax
;jne errRBMKWndProc

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpRBMKData

Call2 KillTimer,hwnd,1

;return 0 ;
	xor rax,rax
	jmp endRBMKWndProc ;mdidemo401CE5

