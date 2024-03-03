;===========
WinMain proc
;===========

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL msg:MSG64
;LOCAL done:BYTE

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;sub rsp,20h
call CreateGLWindow
;add rsp,20h

;Enter the Loop
lblWinMainLoop:
;sub rsp,30h
lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA
;add rsp,30h

cmp rax,0
je lblWinMainCheckKeys

cmp msg.message,12h ;WM_QUIT
je lblWinMainEnd

lblWinMainProceedMessage:
;sub rsp,20h
lea rcx,msg ;lpMsg
call TranslateMessage
lea rcx,msg ;lpMsg
call DispatchMessageA
;add rsp,20h
jmp lblWinMainLoop

lblWinMainCheckActive:
cmp fWinMainActive,0
je lblWinMainLoop

include CheckKeys.asm

lblWinMainReDraw:
;sub rsp,20h
call DrawGLScene
;add rsp,20h
jmp lblWinMainLoop

lblWinMainEnd:
;sub rsp,20h
xor rcx,rcx
call ExitProcess
;add rsp,20h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave   

;ret
WinMain endp
