FrameWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL clientcreate:CLIENTCREATESTRUCT64
LOCAL hwndChild:QWORD
LOCAL mdicreate:MDICREATESTRUCT64

;Assembler will add this prologue automatically:
        ;push rbp
        ;mov rbp,rsp

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
cmp iMsg,1 ;WM_CREATE
	je wmFrameCreate
cmp iMsg,111h ;WM_COMMAND
	je wmFrameCommand
cmp iMsg,11h ;WM_QUERYENDSESSION
	je wmFrameQueryEndSession
cmp iMsg,10h ;WM_CLOSE
	je wmFrameClose
cmp iMsg,2 ;WM_DESTROY
	je wmFrameDestroy
jmp defFrmProc


;WM_CREATE
	include 310_Create.asm

;WM_COMMAND
	include 320_Command.asm

;WM_QUERYENDSESSION
wmFrameQueryEndSession:
	;In Windows NT WM_QUERYENDSESSION can be sent 
	;only to the Frame Window
	jmp wmFrameClose

;WM_CLOSE
wmFrameClose:
	Call4 SendMessageA,hwnd,111h,IDM_CLOSEALL,0
	Call2 GetWindow,hwndClientF,5 ;GW_CHILD = 5
	test rax,rax
	je defFrmProc
	xor rax,rax
	jmp endFrmProc

;WM_DESTROY
wmFrameDestroy:
	Call1 PostQuitMessage,0
	;return 0
		xor rax,rax
		jmp endFrmProc

;Default
defFrmProc:
	Call5 DefFrameProcA,hwnd,hwndClientF,iMsg,wParam,lParam

;End FrameWndProc
endFrmProc: 
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h
FrameWndProc endp
