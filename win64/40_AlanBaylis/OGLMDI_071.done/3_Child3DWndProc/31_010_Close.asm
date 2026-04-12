;case WM_CLOSE:
lbl_Child3D_Close:

mov rcx,lpChildStruct
call ChildStructPurge

jmp lbl_Child3D_DefMDIChildProc  ;Must be processed by DefMDIChildProc