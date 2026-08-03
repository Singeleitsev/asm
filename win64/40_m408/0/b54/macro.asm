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



;-----------------------------------------------
; Skip Space, Tab, CR, LF using SSE4.2 pcmpistri
; Input:  RCX = pointer to string
; Output: RCX = pointer after whitespace
; Destroys: RAX, ECX (from pcmpistri), XMM0
; Requires: SSE4.2 (Nehalem+)
;----------------------------
SKIP_WHITESPACES_SSE MACRO
LOCAL lbl_Next, lbl_Done

;Check for EOF
cmp rcx,gpObjDataEnd
jge lbl_Done

;Save rcx since it's affected by vpcmpistri
mov rdx,rcx ;RDX = current position
;Clear the container
xor rcx,rcx ;Will be used as index (zero-initialized)

;Pattern: SPACE (20h), TAB (09h), CR (0Dh), LF (0Ah)
mov eax,0A0D0920h
movd xmm0,eax

lbl_Next:
;Compare bytes at [RDX] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rdx],0
jc lbl_Done
jz lbl_Done

;ECX contains index of the first whitespace character
add rdx,rcx ;Advance to the whitespace
inc rdx ;Skip past it
jmp lbl_Next

lbl_Done:
mov rcx,rdx ;Restore rcx
ENDM


