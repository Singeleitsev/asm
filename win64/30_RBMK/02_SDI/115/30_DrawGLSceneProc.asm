DrawGLScene proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

include 31_CheckKeys.asm
include 33_CamMode_0.asm
include 35_CamMode_1.asm

lbl_DrawGLScene_Refresh:
cmp isRefreshed,0
jne lbl_DrawGLScene_End

include 40_RefreshTitle.asm
include 41_RefreshStatus.asm
include 50_SetView.asm
Call DrawAxesProc
Call DrawObjectProc

mov rcx,ghDC
Call SwapBuffers

lbl_DrawGLScene_End:
mov isRefreshed,1

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
DrawGLScene endp

