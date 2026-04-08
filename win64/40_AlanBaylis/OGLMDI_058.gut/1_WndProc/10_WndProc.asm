WndProc proc hWnd:QWORD,uMessage:QWORD,wParam:QWORD,lParam:QWORD

LOCAL iLoop:DWORD
LOCAL bType:DWORD
LOCAL lpChildStruct:QWORD
LOCAL childID:QWORD

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
je lbl_WndProc_Command
cmp dx,10h ;WM_CLOSE
je lbl_WndProc_Close
cmp dx,2 ;WM_DESTROY
je lbl_WndProc_Destroy
cmp dx,1 ;WM_CREATE
je lbl_WndProc_Create

;None of the Above:
lbl_WndProc_DefFrameProc:
mov qword ptr[rsp+20h],r9 ;Upside Down
mov r9,r8 ;wParam
mov r8,rdx ;uMessage
mov rdx,g_hMDIClient
;mov rcx,hWnd
Call DefFrameProcA
jmp lbl_WndProc_End

include 11_001_Create.asm
include 11_010_Close.asm
include 11_111_Command.asm

lbl_WndProc_Destroy:
xor rcx,rcx
Call PostQuitMessage
jmp lbl_WndProc_End

include 19_Errors.asm

lbl_WndProc_Return0:
xor rax,rax

lbl_WndProc_End:
;Epilogue
leave
ret
WndProc endp

