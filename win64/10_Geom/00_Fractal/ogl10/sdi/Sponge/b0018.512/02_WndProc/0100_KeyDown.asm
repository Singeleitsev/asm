lbl_wmkeydown:

cmp r8d,1Bh ;VK_ESCAPE
jne lbl_defwndproc

jmp lbl_wmdestroy

