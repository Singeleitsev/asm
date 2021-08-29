OPTION DOTNAME
option casemap:none
include temphls.inc
include win64.inc
include user32.inc
includelib user32.lib
OPTION PROLOGUE:rbpFramePrologue
.code
WinMain proc 
	enter 4*8,0
	xor ecx,ecx
	mov r9,rcx
	lea r8,MsgCaption
	lea edx,MsgBoxText
        call MessageBox
        leave
	ret
WinMain endp
MsgCaption      db "Iczelion's tutorial #2a",0
MsgBoxText      db "Win64 Assembly is Great!",0
end