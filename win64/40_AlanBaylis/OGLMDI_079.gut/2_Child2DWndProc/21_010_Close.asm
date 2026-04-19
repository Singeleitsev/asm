;case WM_CLOSE:
lbl_Child2D_Close:

mov rcx,lpChildStruct
call ChildStructPurge

jmp lbl_Child2D_DefMDIChildProc  ;Must be processed by DefMDIChildProc

