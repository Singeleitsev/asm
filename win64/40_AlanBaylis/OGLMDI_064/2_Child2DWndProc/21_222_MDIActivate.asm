;case WM_MDIACTIVATE:
lbl_Child2D_MDIActivate:

;hMenu = GetMenu(g_hMainWindow);
mov rcx,g_hMainWindow
Call GetMenu
mov hChild2DMenu,rax

mov rcx,rax ;hChild2DMenu
mov rdx,2 ;MenuWindow Position = 2
Call GetSubMenu
mov hChild2DSubMenu,rax

;if(hWnd == (HWND)lParam)
mov rcx,hWnd
mov r9,lParam
cmp rcx,r9
jne lbl_Child2D_SetGrayedFlag

;If Only one Child then Skip
cmp g_iNumChild,1 ;iNumChild has not been increased yet
jl lbl_Child2D_SetGrayedFlag

;uEnableFlag = MF_ENABLED;
mov uEnableFlag,0 ;MF_ENABLED
jmp lbl_Child2D_SetMenu

;else
lbl_Child2D_SetGrayedFlag:
;uEnableFlag = MF_GRAYED;//being de-activated
mov uEnableFlag,1 ;MF_GRAYED


lbl_Child2D_SetMenu:

mov rcx,hChild2DSubMenu
mov rdx,CM_WINDOW_TILEVERT
mov r8,uEnableFlag
;add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

mov rcx,hChild2DSubMenu
mov rdx,CM_WINDOW_TILEHORZ
mov r8,uEnableFlag
;add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

mov rcx,hChild2DSubMenu
mov rdx,CM_WINDOW_CASCADE
mov r8,uEnableFlag
;add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

mov rcx,hChild2DSubMenu
mov rdx,CM_WINDOW_ARRANGE
mov r8,uEnableFlag
;add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem


mov rcx,g_hMainWindow
Call DrawMenuBar

jmp lbl_Child2D_DefMDIChildProc

