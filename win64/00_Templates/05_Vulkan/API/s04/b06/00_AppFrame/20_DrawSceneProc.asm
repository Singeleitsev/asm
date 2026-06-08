DrawScene proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogDrawScene
mov isRefreshed,1

;Epilogue:
leave
ret
DrawScene endp