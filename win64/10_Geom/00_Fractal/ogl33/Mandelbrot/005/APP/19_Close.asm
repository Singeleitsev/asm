CloseWndProc proc hWnd:QWORD
PROLOG 100h

mov hWnd,rcx

;mov rcx,hWnd
lea rdx,szMsgCloseText ;"Exit?"
lea r8,szMsgCloseTitle ;"RBMK-1000 OpenGL Environment"
mov r9,24h ;MB_YESNO Or MB_ICONQUESTION
call MessageBoxA
cmp al,6 ;IDYES
jne Close_End

mov rcx,ghAccTable
call DestroyAcceleratorTable

mov rcx,hWnd
call CloseGL

mov rcx,hWnd
call DestroyWindow

Close_End:
EPILOG
CloseWndProc endp


