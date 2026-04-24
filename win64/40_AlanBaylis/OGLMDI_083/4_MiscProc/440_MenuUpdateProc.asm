MenuUpdate proc

LOCAL fFileNew:BYTE, fFileClose:BYTE, fWindow:BYTE

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer



lbl_MenuUpdate_Check0: ;No Children
cmp g_iNumChild,0
jne lbl_MenuUpdate_Check1
mov fFileNew,0 ;MF_ENABLED
mov fFileClose,1 ;MF_GRAYED
mov fWindow,1 ;MF_GRAYED
jmp lbl_MenuUpdate_Draw

lbl_MenuUpdate_Check1: ;One Child
cmp g_iNumChild,1
jne lbl_MenuUpdate_Check2
mov fFileNew,0 ;MF_ENABLED
mov fFileClose,0 ;MF_ENABLED
mov fWindow,1 ;MF_GRAYED
jmp lbl_MenuUpdate_Draw

lbl_MenuUpdate_Check2: ;More than one Child
cmp g_iNumChild,2
jne lbl_MenuUpdate_Check8
mov fFileNew,0 ;MF_ENABLED
mov fFileClose,0 ;MF_ENABLED
mov fWindow,0 ;MF_ENABLED
jmp lbl_MenuUpdate_Draw

lbl_MenuUpdate_Check8: ;Maximum Children
cmp g_iNumChild,8
jne lbl_MenuUpdate_End
mov fFileNew,1 ;MF_GRAYED
mov fFileClose,0 ;MF_ENABLED
mov fWindow,0 ;MF_ENABLED
;jmp lbl_MenuUpdate_Draw

lbl_MenuUpdate_Draw:

mov rcx,hMenuFile
mov rdx,CM_FILE_NEW_TOP
movzx r8,fFileNew
;or r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

mov rcx,hMenuFile
mov rdx,CM_FILE_NEW_FRONT
movzx r8,fFileNew
Call EnableMenuItem

mov rcx,hMenuFile
mov rdx,CM_FILE_NEW_LEFT
movzx r8,fFileNew
Call EnableMenuItem

mov rcx,hMenuFile
mov rdx,CM_FILE_NEW_3D
movzx r8,fFileNew
Call EnableMenuItem



mov rcx,hMenuFile
mov rdx,CM_FILE_CLOSE
movzx r8,fFileClose
Call EnableMenuItem



mov rcx,hMenuWindow
mov rdx,CM_WINDOW_TILEVERT
movzx r8,fWindow
Call EnableMenuItem

mov rcx,hMenuWindow
mov rdx,CM_WINDOW_TILEHORZ
movzx r8,fWindow
Call EnableMenuItem

mov rcx,hMenuWindow
mov rdx,CM_WINDOW_CASCADE
movzx r8,fWindow
Call EnableMenuItem



mov rcx,g_hWndFrame
Call DrawMenuBar

lbl_MenuUpdate_End:
;Epilogue
leave
ret
MenuUpdate endp

