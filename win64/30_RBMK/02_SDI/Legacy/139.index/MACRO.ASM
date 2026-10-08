;Frame Buffer
PROLOG macro ShadowSpace
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
ret
endm

PROLOG_PUSH macro ShadowSpace
;Save non-volatile registers
push rbx
push rsi
push rdi
push r10
push r11
push r12
push r13
push r14
push r15
;enter
push rbp
mov rbp,rsp
sub rsp,ShadowSpace
;Align the Stack
and rsp,-16
endm

EPILOG_POP macro
;leave
mov rsp,rbp
pop rbp
;Restore non-volatile registers
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop rdi
pop rsi
pop rbx
ret
endm

;Reads lParam into xMouseOld/yMouseOld
GET_REFERENCE_CURSOR_POSITION macro
mov eax,r9d ;lParam
;Extract X Component
movsx ecx,ax
mov xMouseOld,ecx
;Extract Y Component
shr eax,16
movsx eax,ax
mov yMouseOld,eax
endm

;Copies new into old, in preparation for the next move
SAVE_OLD_CURSOR_POSITION macro
mov eax,xMouseNew
mov xMouseOld,eax
mov eax,yMouseNew
mov yMouseOld,eax
endm

;Reads lParam into xMouseNew/yMouseNew (current position)
GET_NEW_CURSOR_POSITION macro
mov eax,r9d ;lParam
;Extract X Component
movsx ecx,ax
mov xMouseNew,ecx
;Extract Y Component
shr eax,16
movsx eax,ax
mov yMouseNew,eax
endm

;Computes dxMouse/dyMouse from new minus old
COMPUTE_MOUSE_DELTA macro
mov eax,xMouseNew
sub eax,xMouseOld
mov dxMouse,eax
mov eax,yMouseNew
sub eax,yMouseOld
mov dyMouse,eax
endm


