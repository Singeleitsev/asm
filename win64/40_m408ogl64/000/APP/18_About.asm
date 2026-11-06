AboutProc proc
PROLOG 100h

mov rcx,ghWnd
lea rdx,szAboutMsgText
lea r8,szAboutMsgTitle
mov r9,40h ;MB_OK Or MB_ICONINFORMATION
call MessageBoxA

About_End:
EPILOG
AboutProc endp


