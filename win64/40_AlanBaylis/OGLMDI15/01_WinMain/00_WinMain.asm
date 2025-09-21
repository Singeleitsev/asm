WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

LOCAL Msg:MSG64
LOCAL wc:WNDCLASSEX64

LOCAL iLoop:BYTE
LOCAL hWnd_CurrentChild

;g_hInst = hInstance;
mov g_hInst,rcx
;Store the Rest of WinMain Parameters
mov hInstance,rcx
mov hPrevInstance,rdx ;rdx:EntryPoint
mov szCmdLine,r8
mov nCmdShow,r9

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

include 10_RegisterClass.asm

include 20_InitGL

call SetVertices
call SetPolygons
;call SetTextures

include 30_MainLoop.asm

include 90_Errors.asm

lbl_WinMain_End:
xor rcx,rcx
call ExitProcess

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
leave
;ret ;Not Necessary in WinMain
WinMain endp
