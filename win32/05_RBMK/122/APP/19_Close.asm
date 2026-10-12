CloseWndProc proc hWnd:DWORD

push 24h ;MB_YESNO Or MB_ICONQUESTION
push offset szMsgCloseTitle ;"RBMK-1000 OpenGL Environment"
push offset szMsgCloseText ;"Exit?"
push hWnd
call MessageBoxA
cmp al,6 ;IDYES
jne Close_End

invoke DestroyAcceleratorTable,ghAccTable

invoke CloseGL,hWnd

invoke DestroyWindow,hWnd

Close_End:
ret
CloseWndProc endp

