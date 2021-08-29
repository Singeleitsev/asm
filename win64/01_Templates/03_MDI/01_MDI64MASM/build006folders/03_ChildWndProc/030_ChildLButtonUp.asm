wmChildLButtonUp:

;MB_OK + MB_ICONINFORMATION = 40h
Call4 MessageBoxA, hWnd, offset szHello, offset szFrameTitle, 40h

xor rax,rax
jmp endChildProc