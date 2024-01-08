lbl_wmlbuttonup:

;Spell wParam
mov rcx,msg.lParam
mov rdx,hWnd
lea r8,szWinMain
lea r9,sz_lParam
call Spell64

xor eax,eax
jmp lbl_finwndproc

