;case WM_MDIACTIVATE:
lbl_Child3D_MDIActivate:

;Restore the Parameters
mov rcx,hWnd
mov r9,lParam

;hMenu = GetMenu(g_hMainWindow);
mov rcx,g_hMainWindow
Call GetMenu
mov hChild3DMenu,rax

;if(hWnd == (HWND)lParam) //being activated
cmp rcx,r9
jne lbl_Child3D_SetGrayedFlag

;uEnableFlag = MF_ENABLED;
mov uEnableFlag,0 ;MF_ENABLED
jmp lbl_Child3D_SetMenu

;else
lbl_Child3D_SetGrayedFlag:
;uEnableFlag = MF_GRAYED ;being de-activated
mov uEnableFlag,1 ;MF_GRAYED

lbl_Child3D_SetMenu:
;EnableMenuItem(hMenu, 1, MF_BYPOSITION | uEnableFlag);
mov rcx,rax ;hChild3DMenu is still in rax
mov rdx,1
mov r8,uEnableFlag
add r8,400h ;MF_BYPOSITION
Call EnableMenuItem

;EnableMenuItem(hMenu, 2, MF_BYPOSITION | uEnableFlag);
mov rcx,hChild3DMenu
mov rdx,2
mov r8,uEnableFlag
add r8,400h ;MF_BYPOSITION
Call EnableMenuItem

;hFileMenu = GetSubMenu(hMenu, 0);
mov rcx,hChild3DMenu
xor rdx,rdx
Call GetSubMenu
mov rax,hChild3DMenuFile

;EnableMenuItem(hFileMenu, CM_FILE_SAVE, MF_BYCOMMAND | uEnableFlag);
mov rcx,hChild3DMenuFile
mov rdx,CM_FILE_SAVE
mov r8,uEnableFlag
add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

;EnableMenuItem(hFileMenu, CM_FILE_SAVEAS, MF_BYCOMMAND | uEnableFlag);
mov rcx,hChild3DMenuFile
mov rdx,CM_FILE_SAVEAS
mov r8,uEnableFlag
add r8,0 ;MF_BYCOMMAND
Call EnableMenuItem

;DrawMenuBar(g_hMainWindow);
mov rcx,g_hMainWindow
Call DrawMenuBar

jmp lbl_Child3D_Return0

