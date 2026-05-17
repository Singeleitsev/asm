AboutProc proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,ghWndMain
lea rdx,szAboutMsgText
lea r8,szAboutMsgTitle
mov r9,40h ;MB_OK Or MB_ICONINFORMATION
Call MessageBoxA

lbl_AboutProc_End:
;Epilogue:
leave
ret
AboutProc endp

