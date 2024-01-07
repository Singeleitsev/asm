;===========
WinMain proc
;===========

;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL msg:MSG64
;LOCAL done:BYTE

;and rsp,-16 ;Align the Stack
sub rsp,108h ;Create the Buffer

;Load the Instance
xor rcx,rcx
call GetModuleHandleA
mov g_hInst,rax

cmp rax,0
je lblWinMainErr

;Spell hDC
Spell64rax hWnd,szWinMain,sz_hInst


call CreateGLWindow
cmp rax,1
jne lblWinMainErr


lblWinMainLoop:

;sub rsp,30h
lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA
;and rsp,30h

cmp rax,0
je lblWinMainCheckKeys

lblWinMainCheckQuit:

cmp msg.message,12h ;WM_QUIT
je lblWinMainDone

lblWinMainProceedMessage:

;sub rsp,20h
lea rcx,msg ;lpMsg
call TranslateMessage
lea rcx,msg ;lpMsg
call DispatchMessageA
;add rsp,20h

jmp lblWinMainLoop

lblWinMainCheckKeys:

cmp keys[1Bh],0 ;VK_ESCAPE
jne lblWinMainDone

lblWinMainCheckActive:

cmp fWinMainActive,0
je lblWinMainLoop

lblWinMainReDraw:

call DrawGLScene
cmp rax,0
je lblWinMainDone

lblWinMainSwapBuffers:

mov rcx,hDC
call SwapBuffers ;Double Buffering
jmp lblWinMainLoop


;Normal End
lblWinMainDone:
call KillGLWindow

;Spell wParam
mov rax,msg.wParam
Spell64rax hWnd,szWinMain,sz_wParam

;return (msg.wParam)
mov rcx,msg.wParam
call ExitProcess
jmp lblWinMainEnd


;Error Report
lblWinMainErr:
call KillGLWindow

mov rax,msg.wParam
Spell64rax hWnd,szWinMain,szWinMainErr

xor rcx,rcx
call ExitProcess


lblWinMainEnd:
add rsp,108h
;Assembler will add this epilogue automatically:
;leave   
ret

WinMain endp


