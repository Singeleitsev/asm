FrameWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL clientcreate:CLIENTCREATESTRUCT64
LOCAL hwndChild:QWORD
LOCAL mdicreate:MDICREATESTRUCT64

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
jmp defFrmProc

include 10_Create.asm

include 20_Command.asm

wmFrameQueryEndSession:
	;In Windows NT WM_QUERYENDSESSION can be sent 
	;only to the Frame Window
	;jmp wmFrameClose

wmFrameClose:
	Call4 SendMessageA,hwnd,111h,IDM_CLOSEALL,0 ;WM_COMMAND
	Call2 GetWindow,s_hwndFrame,5 ;GW_CHILD = 5
	test rax,rax
	je defFrmProc
	xor rax,rax
	jmp endFrmProc

wmFrameDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp endFrmProc

defFrmProc:
	Call5 DefFrameProcA,hwnd,s_hwndFrame,iMsg,wParam,lParam

endFrmProc: 
;Assembler will add this epilogue automatically:
	;leave
	ret
FrameWndProc endp
