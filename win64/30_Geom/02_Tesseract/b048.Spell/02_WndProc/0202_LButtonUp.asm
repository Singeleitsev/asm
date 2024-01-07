lbl_wmlbuttonup:

;Spell wParam
mov rax,msg.lParam
Spell64rax hWnd,szWinMain,sz_lParam

xor eax,eax
jmp lbl_finwndproc

