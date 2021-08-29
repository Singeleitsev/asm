wmR3Destroy:

Call2 GetWindowLongPtrA,hwnd,0
mov lpR3Data,rax

;cmp lpGlobalData,rax
;jne errR3WndProc

Call0 GetProcessHeap
Call3 HeapFree,rax,0,lpR3Data

Call2 KillTimer,hwnd,1

;return 0 ;
	xor rax,rax
	jmp endR3WndProc ;mdidemo401CE5

