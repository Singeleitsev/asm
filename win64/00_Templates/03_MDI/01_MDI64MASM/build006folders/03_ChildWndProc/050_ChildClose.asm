wmChildClose:

Call4 MessageBoxA,hWnd,offset szClose,offset szFrameTitle,21h
cmp rax,1 ;IDOK
je defChildProc ;mdidemo40191B

xor rax,rax
jmp endChildProc