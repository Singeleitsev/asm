HelloWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL hMenu:QWORD
LOCAL lpHelloData:QWORD
LOCAL ps:PAINTSTRUCT64
LOCAL rect:RECT64

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
cmp rdx,0Fh ;WM_PAINT
	je wmHelloPaint
cmp rdx,111h ;WM_COMMAND
	je wmHelloCommand
cmp rdx,1 ;WM_CREATE
	je wmHelloCreate
cmp rdx,202h ;WM_LBUTTONUP
	je wmHelloLButtonUp
cmp rdx,222h ;WM_MDIACTIVATE
	je wmHelloActivate
cmp rdx,11h ;WM_QUERYENDSESSION
;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
	je wmHelloEndSession
cmp rdx,10h ;WM_CLOSE
	je wmHelloClose
cmp rdx,2 ;WM_DESTROY
	je wmHelloDestroy
jmp defHelloWndProc

include 10_Create.asm

include 20_Command.asm

include 30_Paint.asm

include 40_Activate.asm

wmHelloLButtonUp:
	Call4 MessageBoxA, hwnd, offset szHelloTitle, offset szFrameTitle, 40h
        jmp endHelloWndProc

;case WM_QUERYENDSESSION :
wmHelloEndSession:
	;jmp wmHelloClose

include 90_Close.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defHelloWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endHelloWndProc

errHelloWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szHelloTitle, szLastErr

endHelloWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h

HelloWndProc endp

