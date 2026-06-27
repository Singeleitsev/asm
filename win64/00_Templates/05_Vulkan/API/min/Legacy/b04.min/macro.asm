;Frame Buffer
PROLOG macro ShadowSpace
;Save non-volatile registers
;push rbx
;push rsi
;push rdi
;push r12
;push r13
;push r14
;push r15
;enter
push rbp
mov rbp,rsp
sub rsp,ShadowSpace
;Align the Stack
and rsp,-16
endm

EPILOG macro
;leave
mov rsp,rbp
pop rbp
;Restore non-volatile registers
;pop r15
;pop r14
;pop r13
;pop r12
;pop rdi
;pop rsi
;pop rbx
ret
endm

;Logger
LOG_TEXT macro text
lea rcx,text
call WriteLog
endm
