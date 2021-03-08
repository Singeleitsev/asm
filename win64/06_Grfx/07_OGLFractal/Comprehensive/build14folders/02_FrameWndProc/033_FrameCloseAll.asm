idmFrameCloseAll:

Call3 EnumChildWindows,hWndClient,offset CloseEnumProc,0

xor rax,rax
jmp endFrmProc