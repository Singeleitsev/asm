idmFrameClose:

;WM_MDIGETACTIVE = 229h
Call4 SendMessageA,hWndClient,229h,0,0
mov hWndChild,rax

;WM_QUERYENDSESSION = 11h
;In Windows NT WM_QUERYENDSESSION can be sent
;only to the Frame Window
Call4 SendMessageA,hWndChild,11h,0,0
test rax,rax
je @f

;WM_MDIDESTROY = 221h
Call4 SendMessageA,hWndClient,221h,hWndChild,0

@@:
xor rax,rax
jmp endFrmProc