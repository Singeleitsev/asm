;================================================================
;LRESULT CALLBACK HelloWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
HelloWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;================================================================
;mdidemo4016EB:
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;HDC hdc ;
	LOCAL hdc:QWORD
;HMENU hMenu ;
	LOCAL hMenu:QWORD
;LPHELLODATA lpHelloData ;
	LOCAL lpHelloData:QWORD
;PAINTSTRUCT ps ;
	LOCAL ps:PAINTSTRUCT64
;RECT rect ;
	LOCAL rect:RECT64

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
        cmp rdx,1 ;WM_CREATE = 0x0001
		je wmHelloCreate ;mdidemo4016FF
	cmp rdx,111h ;WM_COMMAND
		je wmHelloCommand ;mdidemo40175D
	cmp rdx,0Fh ;WM_PAINT
		je wmHelloPaint ;mdidemo4017F5
	cmp rdx,11h ;WM_QUERYENDSESSION = 0x0011
		;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
		je wmHelloEndSession
        cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
                je wmHelloActivate ;mdidemo401860
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
                je wmHelloLButtonUp
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmHelloClose ;mdidemo4018F5
	cmp rdx,2 ;WM_DESTROY
		je wmHelloDestroy ;mdidemo401920
        jmp defHelloWndProc ;mdidemo4019B5

;case WM_CREATE : // Allocate memory for window private data
;mdidemo4016FF:
	include 51_Create.asm

;case WM_COMMAND :
;mdidemo40175D:
	include 52_Command.asm

;case WM_PAINT : // Paint the window
;mdidemo4017F5:
	include 53_Paint.asm

;case WM_MDIACTIVATE :
;mdidemo401860:
	include 54_Activate.asm

;case WM_LBUTTONUP :
wmHelloLButtonUp:
        ;MB_OK + MB_ICONINFORMATION = 40h
	Call4 MessageBoxA, hwnd, offset szHelloTitle, offset szFrameTitle, 40h
        jmp endHelloWndProc ;mdidemo4019D0

;case WM_QUERYENDSESSION :
wmHelloEndSession:
	;jmp wmHelloClose

;case WM_CLOSE :
;mdidemo4018F5:
	include 55_Close.asm

;case WM_DESTROY :
;mdidemo401920:
	include 56_Destroy.asm

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
;mdidemo4019B5:
defHelloWndProc:
	Call4 DefMDIChildProc,hwnd,iMsg,wParam,lParam
	jmp endHelloWndProc

errHelloWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szHelloTitle, szLastErr

;End Proc
;mdidemo4019D0:
endHelloWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h
HelloWndProc endp

