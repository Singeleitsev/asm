defFrameCmd:

;Pass to active child...
;WM_MDIGETACTIVE = 0x0229
Call4 SendMessageA, hWndClient, 229h, 0, 0
mov hWndChild,rax

Call1 IsWindow, hWndChild
cmp rax,0
 jne defFrmProc

;WM_COMMAND = 0x0111
Call4 SendMessageA, hWndChild, 111h, wParam, lParam

;...and then to DefFrameProc
jmp defFrmProc