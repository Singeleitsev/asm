ChNPPWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL hMenu:QWORD
LOCAL lpChNPPData:QWORD
LOCAL ps:PAINTSTRUCT64 ;<- Not Needed for OGL
LOCAL rect:RECT64
;Added for OGL
LOCAL hrc:QWORD
LOCAL pfd:PIXELFORMATDESCRIPTOR64
LOCAL clock:DWORD

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
cmp rdx,0Fh ;WM_PAINT
	je wmChNPPPaint
cmp rdx,111h ;WM_COMMAND
	je wmChNPPCommand
cmp rdx,1 ;WM_CREATE
	je wmChNPPCreate
cmp rdx,202h ;WM_LBUTTONUP
	je wmChNPPLButtonUp
cmp rdx,222h ;WM_MDIACTIVATE
	je wmChNPPActivate
cmp rdx,11h ;WM_QUERYENDSESSION
;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
	je wmChNPPEndSession
cmp rdx,10h ;WM_CLOSE
	je wmChNPPClose
cmp rdx,2 ;WM_DESTROY
	je wmChNPPDestroy
jmp defChNPPWndProc

include 10_Create.asm

include 20_Command.asm

include 30_Paint.asm

include 40_Activate.asm

wmChNPPLButtonUp:
	Call4 MessageBoxA, hwnd, offset szChNPPTitle, offset szFrameTitle, 40h
        jmp endChNPPWndProc

;case WM_QUERYENDSESSION :
wmChNPPEndSession:
	;jmp wmChNPPClose

include 90_Close.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defChNPPWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endChNPPWndProc

errChNPPWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szChNPPTitle, szLastErr

endChNPPWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h

ChNPPWndProc endp

