ReAssign proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Black Background
xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glClearColor

;Set Flags
mov isInitialPosition, 1
mov isRefreshed,0

;Epilogue:
leave
ret
ReAssign endp
