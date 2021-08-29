;===============================================================
;LRESULT CALLBACK RectWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
RectWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;===============================================================
;mdidemo4019D7:
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;HBRUSH hBrush ;
	LOCAL hBrush:QWORD
;HDC hdc ;
	LOCAL hdc:QWORD
;LPRECTDATA lpRectData ;
	LOCAL lpRectData:QWORD
;PAINTSTRUCT ps ;
	LOCAL ps:PAINTSTRUCT64
;int xLeft, xRight, yTop, yBottom ;
	LOCAL xLeft:QWORD, xRight:QWORD, yTop:QWORD, yBottom:QWORD
;short nRed, nGreen, nBlue ;
	LOCAL nRGB:QWORD

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
mdidemo401C78: ;switch (iMsg)
	cmp iMsg,1 ;WM_CREATE
		je wmRectCreate ;mdidemo4019EB
	cmp iMsg,5 ;WM_SIZE ?
		je wmRectSize ;mdidemo401A49
	cmp iMsg,113h ;WM_TIMER
		je wmRectTimer ;mdidemo401A82
	cmp iMsg,0Fh ;WM_PAINT
		je wmRectPaint ;mdidemo401BAC
	cmp iMsg,222h ;WM_MDIACTIVATE
		je wmRectActivate ;Activate
	cmp iMsg,2 ;WM_DESTROY
		je wmRectDestroy ;mdidemo401C3E
	jmp defRectWndProc ;mdidemo401CCA

;case WM_CREATE :
;mdidemo4019EB:
	include 61_Create.asm

;case WM_SIZE : // If not minimized, save the window size
;mdidemo401A49:
	include 62_Size.asm

;case WM_TIMER : // Display a random rectangle
;mdidemo401A82:
	include 63_Timer.asm

;case WM_PAINT :           // Clear the window
;mdidemo401BAC:
	include 64_Paint.asm

;case WM_MDIACTIVATE : // Set the appropriate menu
;mdidemo401BE0:
	include 65_Activate.asm

;case WM_DESTROY :
;mdidemo401C3E:
	include 66_Destroy.asm

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
;mdidemo401CCA:
defRectWndProc:
	Call4 DefMDIChildProc,hwnd,iMsg,wParam,lParam
	jmp endRectWndProc ;mdidemo401CE5

errRectWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szRectTitle, szLastErr

;End Proc
;mdidemo401CE5:
endRectWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h
RectWndProc endp
