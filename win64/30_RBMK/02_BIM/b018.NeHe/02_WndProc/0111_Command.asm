lbl_wmcommand:

;switch (wParam)

cmp r8w, IDM_EXIT
je lbl_wmdestroy

cmp r8w, IDM_ABOUT
jmp lbl_wmSysCommandRet0

;None of the Above
jmp lbl_defwndproc ;break

lbl_wmCommandRet0:
xor eax,eax
jmp lbl_finish

