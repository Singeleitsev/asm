WinMain proc
PROLOG 100h

;1. Start the Log
call InitLogger

;2. Load Instance Handle
lea rcx,szGetModuleHandleA
call WriteLog

xor rcx,rcx
call GetModuleHandleA
test rax,rax
jz WinMain_Error

mov ghInst,rax
mov wcx_hInstance,rax
lea rcx,szOK
call WriteLog

;3. Create and Destroy the Dummy Window
call CreateDummyWnd
test rax,rax
jnz WinMain_End

;4. Create the Main Window
call CreateMainWnd
test rax,rax
jnz WinMain_End

;5. Enter the Loop
WinMain_Loop:
lea rcx,msg
xor rdx,rdx ;0
xor r8,r8 ;0
xor r9,r9 ;0
mov qword ptr[rsp+20h],1 ;PM_REMOVE
call PeekMessageA
test rax,rax ;Is there a Message?
jnz ProceedMessage

;WinMain_NoMessages:
cmp isActive,0
je Wait2ms

;Proceed the Keyboard State
include 06_CheckKeys.asm

;WinMain_Active:
cmp isRefreshed,0
jne Wait16ms

;WinMain_ReDraw:
call DrawScene
jmp WinMain_Loop

ProceedMessage:
cmp msg_message,12h ;WM_QUIT
je WinMain_End

mov rcx,ghWnd
mov rdx,ghAccTable
lea r8,msg
call TranslateAcceleratorA
test eax,eax
jnz WinMain_Loop

lea rcx,msg
call TranslateMessage
lea rcx,msg
call DispatchMessageA
jmp WinMain_Loop

Wait2ms:
mov rcx,2
call Sleep
jmp WinMain_Loop

Wait16ms:
mov rcx,10h
call Sleep
jmp WinMain_Loop

WinMain_Error:
call SpellError
jmp WinMain_End

WinMain_End:
lea rcx,szExitProcess
call WriteLog
call CloseLogger
xor rcx,rcx
call ExitProcess

;No EPILGOG Required
WinMain endp


