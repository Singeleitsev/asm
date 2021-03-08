;===================================================================
FrameWndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;===================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h

;Align the Stack by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA
        mov hWnd,rcx
        mov uMsg,rdx
        mov wParam,r8
        mov lParam,r9

;Window Messages processing
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmFrameCreate
        cmp rdx,111h ;WM_COMMAND = 0x0111
                je wmFrameCommand
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmFrameClose
        cmp rdx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        jmp defFrmProc

include 010_Create.asm
include 020_Command.asm
include 030_Close.asm
include 040_Destroy.asm
include 090_Default.asm

endFrmProc:
;Assembler will add this epilogue automatically:
	;leave 
        ret
FrameWndProc endp

