AboutProc proc

push 40h ;MB_OK Or MB_ICONINFORMATION
push offset szAboutMsgTitle
push offset szAboutMsgText
push ghWnd
call MessageBoxA

About_End:
ret
AboutProc endp


