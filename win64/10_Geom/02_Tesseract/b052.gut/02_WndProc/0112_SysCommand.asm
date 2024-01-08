lbl_wmsyscommand:

;switch (wParam)

;cmp r8d, 0F140h ;SC_SCREENSAVE
;je lbl_wmSysCommandRet0

;cmp r8d,0F170h ;SC_MONITORPOWER
;je lbl_wmSysCommandRet0

jmp lbl_defwndproc ;break

;lbl_wmSysCommandRet0:
;xor eax,eax
;jmp lbl_finwndproc

