idmFrameExit:

;WM_CLOSE = 0x0010
Call4 SendMessageA, hWnd, 10h, 0, 0

xor rax,rax 
jmp endFrmProc