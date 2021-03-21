;================================================================
ChildWndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h

;Align the Stack by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA:
        mov hWnd, rcx
        mov uMsg, rdx
        mov wParam, r8
        mov lParam, r9

;Distributing with respect to uMsg
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmChildCreate
        cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
                je wmChildActivate
        cmp rdx,202h ;WM_LBUTTONUP = 0x0202
                je wmChildLButtonUp
	cmp rdx,11h ;WM_QUERYENDSESSION = 0x0011
		;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
		je wmEndSession
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmChildClose
        jmp defChildProc

include 010_ChildCreate.asm
include 020_ChildActivate.asm
include 030_ChildLButtonUp.asm
include 040_ChildSize.asm
include 050_ChildPaint.asm
include 060_ChildKeyDown.asm
include 070_EndSession.asm
include 080_ChildClose.asm
include 090_defChildProc.asm

endChildProc:
;Assembler will add this epilogue automatically:
	;leave
        ret
ChildWndProc endp