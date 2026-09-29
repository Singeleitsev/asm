;wmCommand:
mov eax,wParam

cmp ax,IDM_FILE_EXIT
jne @f
jmp wmClose

@@:
cmp ax,IDM_HELP_ABOUT
jne @f
Call AboutProc

@@:
;jmp WndProc_Return0