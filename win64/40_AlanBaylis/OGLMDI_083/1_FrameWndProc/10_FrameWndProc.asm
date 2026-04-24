FrameWndProc proc hWnd:QWORD,uMessage:QWORD,wParam:QWORD,lParam:QWORD

LOCAL iLoop:DWORD
LOCAL bType:DWORD ;Temporary until saved to g_child[iThisChild].iType
LOCAL lpChildStruct:QWORD ;Pointer to g_child[iThisChild]
LOCAL childID:QWORD ;Temporary until saved to g_child[iThisChild].iThisChild
LOCAL hWndChildActive:QWORD

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store WinMain Parameters
mov hWnd,rcx
mov uMessage,rdx
mov wParam,r8
mov lParam,r9

;switch(uMessage)
;Arranged by Probability
cmp dx,111h ;WM_COMMAND
je lbl_FrameWndProc_Command
cmp dx,10h ;WM_CLOSE
je lbl_FrameWndProc_Close
cmp dx,2 ;WM_DESTROY
je lbl_FrameWndProc_Destroy
cmp dx,1 ;WM_CREATE
je lbl_FrameWndProc_Create

;None of the Above:
lbl_DefFrameProc:
mov rcx,hWnd
mov rdx,g_hWndClient
mov r8,uMessage
mov r9,wParam
mov r10,lParam
mov qword ptr[rsp+20h],r10
Call DefFrameProcA
jmp lbl_FrameWndProc_End

include 11_001_0_Create.asm
include 11_010_Close.asm
include 11_111_Command.asm

lbl_FrameWndProc_Destroy:
mov rcx,hMenuMain
call DestroyMenu
xor rcx,rcx
Call PostQuitMessage
jmp lbl_FrameWndProc_Return0

include 19_Errors.asm

lbl_FrameWndProc_Return0:
xor rax,rax

lbl_FrameWndProc_End:
;Epilogue
leave
ret
FrameWndProc endp

