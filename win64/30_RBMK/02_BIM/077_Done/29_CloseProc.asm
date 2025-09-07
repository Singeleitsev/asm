CloseWndProc proc hWnd:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov hWnd,rcx

;mov rcx,hWnd
lea rdx,szMsgCloseText ;"Close?"
lea r8,szMsgCloseTitle ;"Such A Good Application"
mov r9,24h ;MB_YESNO Or MB_ICONQUESTION
Call MessageBoxA
cmp rax,6 ;IDYES
jne lbl_CloseWndProc_End

lea rcx,hAccTable
Call DestroyAcceleratorTable

xor rcx,rcx
xor rdx,rdx
Call wglMakeCurrent

mov rcx,ghRC
Call wglDeleteContext

mov rcx,hWnd
mov rdx,ghDC
Call ReleaseDC

mov rcx,hWnd
Call DestroyWindow

lbl_CloseWndProc_End:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
CloseWndProc endp

