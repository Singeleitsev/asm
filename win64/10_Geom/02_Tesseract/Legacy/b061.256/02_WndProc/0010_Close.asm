lbl_wmclose:

xor rcx,rcx
call PostQuitMessage

xor eax,eax
jmp lbl_finwndproc