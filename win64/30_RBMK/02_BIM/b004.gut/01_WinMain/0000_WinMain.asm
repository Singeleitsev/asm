WinMain proc

sub rsp,8
sub rsp,100h

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

include CheckKeys.asm

lblWinMainCheckActive:
cmp fWinMainActive,0
je lblWinMainLoop

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

WinMain endp
