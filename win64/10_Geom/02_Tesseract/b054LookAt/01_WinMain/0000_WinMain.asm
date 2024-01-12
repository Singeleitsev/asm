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

;Load the Instance
xor rcx,rcx
call GetModuleHandleA
mov g_hInst,rax
cmp rax,0
je lblWinMainErr

;Spell g_hInst
mov rcx,g_hInst
xor rdx,rdx ;There's no hWnd yet
lea r8,szWinMain
lea r9,sz_hInst
call Spell64


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
;add rsp,30h

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
je lblWinMainErr

lblWinMainSwapBuffers:
mov rcx,g_hDC
call SwapBuffers ;Double Buffering
cmp rax,0
je lblWinMainErr
jmp lblWinMainLoop


;Normal End
lblWinMainDone:
call KillGLWindow
;Spell wParam
mov rcx,msg.wParam
mov rdx,g_hWnd
lea r8,szWinMain
lea r9,sz_wParam
call Spell64
;return (msg.wParam)
mov rcx,msg.wParam
call ExitProcess


;Error Report
lblWinMainErr:
call KillGLWindow
;Spell wParam
xor rcx,rcx ;hWnd = HWND_DESKTOP
lea rdx,szWinMain
lea r8,szWinMainErr
mov r9,10h ;uType = MB_OK+MB_ICONERROR
call MessageBoxA
;return 0
xor rcx,rcx
call ExitProcess


;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave   

;ret
WinMain endp


