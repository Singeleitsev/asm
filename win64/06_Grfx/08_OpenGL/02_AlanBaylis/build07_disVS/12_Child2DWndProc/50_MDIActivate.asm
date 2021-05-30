;case WM_MDIACTIVATE:
;{ //3
;HMENU hMenu, hFileMenu;
;UINT uEnableFlag;

;hMenu = GetMenu(g_hMainWindow);
;if(hWnd == (HWND)lParam) //being activated
;{ //4
;uEnableFlag = MF_ENABLED;
;} //4
;else
;{ //4
;uEnableFlag = MF_GRAYED;//being de-activated
;} //4
;EnableMenuItem(hMenu, 1, MF_BYPOSITION | uEnableFlag);
;EnableMenuItem(hMenu, 2, MF_BYPOSITION | uEnableFlag);

;hFileMenu = GetSubMenu(hMenu, 0);
;EnableMenuItem(hFileMenu, CM_FILE_SAVE, MF_BYCOMMAND | uEnableFlag);
;EnableMenuItem(hFileMenu, CM_FILE_SAVEAS, MF_BYCOMMAND | uEnableFlag);

;DrawMenuBar(g_hMainWindow);
;} //3
;break;