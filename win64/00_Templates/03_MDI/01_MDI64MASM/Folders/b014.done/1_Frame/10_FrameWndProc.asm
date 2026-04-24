FrameWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL clientcreate:CLIENTCREATESTRUCT64
LOCAL mdicreate:MDICREATESTRUCT64
LOCAL hwndChild:QWORD

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store Parameters
mov hwnd,rcx
mov iMsg,rdx
mov wParam,r8
mov lParam,r9

;switch (iMsg)
cmp rdx,111h ;WM_COMMAND
je wmFrameCommand
cmp rdx,11h ;WM_QUERYENDSESSION
je wmFrameQueryEndSession
cmp rdx,10h ;WM_CLOSE
je wmFrameClose
cmp rdx,2 ;WM_DESTROY
je wmFrameDestroy
cmp rdx,1 ;WM_CREATE
je wmFrameCreate

defFrmProc:
mov rcx,hwnd
mov rdx,g_hWndClient
mov r8,iMsg
mov r9,wParam
mov rax,lParam
mov qword ptr[rsp+20h],rax
call DefFrameProcA
jmp endFrmProc

include 11_001_Create.asm
include 11_111_Command.asm

wmFrameQueryEndSession:
;In Windows NT, WM_QUERYENDSESSION can be sent only to the Frame Window
jmp wmFrameClose

wmFrameClose:
mov rcx,hwnd
mov rdx,111h ;WM_COMMAND
mov r8,IDM_WINDOW_CLOSEALL
xor r9,r9
call SendMessageA

mov rcx,g_hWndClient
mov rdx,5 ;GW_CHILD = 5
call GetWindow
test rax,rax
je defFrmProc
jmp lbl_FrameWndProc_Return0

wmFrameDestroy:
xor rcx,rcx
call PostQuitMessage
jmp lbl_FrameWndProc_Return0

lbl_FrameWndProc_Return0:
xor rax,rax
jmp endFrmProc

;Errors

endFrmProc: 
;Epilogue
leave
ret
FrameWndProc endp
