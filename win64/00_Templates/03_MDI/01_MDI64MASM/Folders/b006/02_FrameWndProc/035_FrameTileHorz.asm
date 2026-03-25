idmFrameTileHorz:

;WM_MDITILE = 0x0226 ;MDITILE_HORIZONTAL = 1
Call4 SendMessageA, hWndClient, 226h, 1, 0

xor rax,rax 
jmp endFrmProc