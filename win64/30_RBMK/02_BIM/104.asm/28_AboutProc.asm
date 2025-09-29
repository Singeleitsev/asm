AboutProc proc hWnd:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov hWnd,rcx

;mov rcx,hWnd
lea rdx,szAboutMsgText
lea r8,szAboutMsgTitle
mov r9,40h ;MB_OK Or MB_ICONINFORMATION
Call MessageBoxA

lbl_AboutProc_End:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
AboutProc endp

