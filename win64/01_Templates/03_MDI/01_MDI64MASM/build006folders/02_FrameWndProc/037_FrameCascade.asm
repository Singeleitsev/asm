idmFrameCascade:

;WM_MDICASCADE = 0x0227 ;MDITILE_SKIPDISABLED = 2
Call4 SendMessageA, hWndClient, 227h, 2, 0

xor rax,rax 
jmp endFrmProc