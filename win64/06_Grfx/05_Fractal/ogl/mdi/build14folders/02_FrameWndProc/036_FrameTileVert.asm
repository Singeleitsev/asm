idmFrameTileVert:

;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
Call4 SendMessageA, hWndClient, 226h, 0, 0

xor rax,rax 
jmp endFrmProc