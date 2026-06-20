;Macros
LOG_TEXT macro text
lea rcx,text
call WriteLog
endm

PROLOG macro buffer
push rbp
mov rbp,rsp
and rsp,-16 ;Align the Stack
sub rsp,buffer
endm
