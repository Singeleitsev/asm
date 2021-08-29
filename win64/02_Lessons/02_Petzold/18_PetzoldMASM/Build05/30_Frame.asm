;================================================================
;LRESULT CALLBACK FrameWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
FrameWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;================================================================
;mdidemo401305:
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;CLIENTCREATESTRUCT clientcreate ;
	LOCAL clientcreate:CLIENTCREATESTRUCT64
;HWND hwndChild ;
	LOCAL hwndChild:QWORD
;MDICREATESTRUCT mdicreate ;
	LOCAL mdicreate:MDICREATESTRUCT64

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
cmp iMsg,1 ;WM_CREATE
	je wmFrameCreate ;mdidemo401319
cmp iMsg,111h ;WM_COMMAND
	je wmFrameCommand ;mdidemo401360
cmp iMsg,11h ;WM_QUERYENDSESSION
	je wmFrameQueryEndSession
cmp iMsg,10h ;WM_CLOSE
	je wmFrameClose ;mdidemo4015AC
cmp iMsg,2 ;WM_DESTROY
	je wmFrameDestroy ;mdidemo4015E1
jmp defFrmProc ;mdidemo401634


;case WM_CREATE : // Create the client window
;mdidemo401319:
	include 31_Create.asm

;case WM_COMMAND :
;mdidemo401360: ;Command
	include 32_Command.asm

;case WM_QUERYENDSESSION :
wmFrameQueryEndSession:
	;In Windows NT WM_QUERYENDSESSION can be sent 
	;only to the Frame Window
	;jmp wmFrameClose

;case WM_CLOSE : // Attempt to close all children
;mdidemo4015AC:
wmFrameClose:
	;SendMessage (hwnd, WM_COMMAND, IDM_CLOSEALL, 0) ;
	;if (NULL != GetWindow (hwndClient, GW_CHILD))
		;return 0 ;
	;break ;   // I.e., call DefFrameProc 

	Call4 SendMessage,hwnd,111h,IDM_CLOSEALL,0
	Call2 GetWindow,hwndClientF,5 ;GW_CHILD = 5
	test rax,rax
		je defFrmProc ;mdidemo4015DC
	xor rax,rax
	jmp endFrmProc ;mdidemo401655

;case WM_DESTROY :
;mdidemo4015E1:
wmFrameDestroy:
	;PostQuitMessage (0) ;
		Call1 PostQuitMessage,0
	;return 0 ;
		xor rax,rax
		jmp endFrmProc ;mdidemo401655

;return DefFrameProc (hwnd, hwndClient, iMsg, wParam, lParam) ;
;mdidemo401634:
defFrmProc:
	Call5 DefFrameProc,hwnd,hwndClientF,iMsg,wParam,lParam

;mdidemo401655:
endFrmProc: 
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h
FrameWndProc endp
