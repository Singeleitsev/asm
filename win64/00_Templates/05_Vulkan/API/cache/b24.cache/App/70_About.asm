AboutProc proc
PROLOG_PUSH 100h

mov rcx,ghWndMain
lea rdx,szAboutMsgText
lea r8,szAboutMsgTitle
mov r9,40h ;MB_OK Or MB_ICONINFORMATION
Call MessageBoxA

lbl_AboutProc_End:
EPILOG_POP
AboutProc endp

