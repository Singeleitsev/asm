WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

LOCAL lpChildStruct:QWORD
LOCAL iLoop:BYTE,dummy1:BYTE,dummy2:BYTE,dummy3:BYTE,dummy4:BYTE,dummy5:BYTE,dummy6:BYTE,dummy7:BYTE

;Stack Usage: 8(return address)+20h(parameters)+8(push)+10h(locals) = 40h

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store the Rest of WinMain Parameters
;mov hInstance,rcx
;mov hPrevInstance,rdx ;rdx:EntryPoint
;mov szCmdLine,r8
;mov iCmdShow,r9

xor rcx,rcx
Call GetModuleHandleA
mov g_hInst,rax

include 010_RegisterClass.asm

;Initialize the Object
Call SetVertices
Call SetPolygons
Call SetTextures

;sphere for vertex selection
call gluNewQuadric
mov sphere,rax ;GLUquadricObj

include 030_MainLoop.asm
include 090_Errors.asm

lbl_WinMain_End:
xor rcx,rcx
call ExitProcess

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
;ret ;Not Necessary in WinMain
WinMain endp
