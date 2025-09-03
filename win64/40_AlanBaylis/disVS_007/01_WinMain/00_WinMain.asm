;==============================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int nCmdShow)
WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD
;==============================================================================
;{

;0000.0001.3F12.8210:
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;MSG Msg;
LOCAL msg:MSG64
;WNDCLASSEX wc;
LOCAL wc:WNDCLASSEX64

mov hInstance,rcx ;rsp+8
mov hPrevInstance,rdx ;rsp+10h ;rdx:EntryPoint
mov szCmdLine,r8 ;rsp+18h
mov nCmdShow,r9 ;rsp+20h

;Align the Stack by 10h
and rsp,-16 ;sub rsp,F8

;g_hInst = hInstance;
mov rax,hInstance ;qword ptr ss:[rsp+100] ;[rsp+8+0F8h]
mov g_hInst,rax ;qword ptr ds:[13F14CBF8]


include 10_RegChild3D.asm
include 11_RegChild2D.asm
include 12_RegCreateShowFrame.asm

;SetVertices();
call SetVertices
;SetPolygons();
call SetPolygons

include 20_MainLoop.asm


endWinMain:
;Assembler will add this epilogue automatically
;leave
ret

;}
WinMain endp


