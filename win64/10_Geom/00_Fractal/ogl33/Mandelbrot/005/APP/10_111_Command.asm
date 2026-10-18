;wmCommand:
;mov r8,wParam

cmp r8w,IDM_FILE_EXIT
jne @f
jmp wmClose

@@:
cmp r8w,IDM_HELP_ABOUT
jne @f
Call AboutProc
jmp WndProc_Return0

@@:
;jmp WndProc_Return0