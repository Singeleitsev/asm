wmFrameDestroy:

include 041_Release.asm

Call1 PostQuitMessage, 0

xor rax,rax
jmp endFrmProc