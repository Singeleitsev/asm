OPTION DOTNAME
option casemap:none
include temphls.inc
include win64.inc
include kernel32.inc
include user32.inc
includelib kernel32.lib
includelib user32.lib
OPTION PROLOGUE:rbpFramePrologue
.code
WinMain proc 
	sub rsp,5*8
        invoke MessageBox,NULL,&MsgBoxText,&MsgCaption,MB_OK
        invoke ExitProcess,NULL
WinMain endp
MsgCaption      db "Iczelion's tutorial #2",0
MsgBoxText      db "Win64 Assembly is Great!",0
end