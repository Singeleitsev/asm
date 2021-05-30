;case WM_MDIACTIVATE:
;{ //2
;HMENU hMenu, hFileMenu;
;UINT uEnableFlag;

;hMenu = GetMenu(g_hMainWindow);
;if(hWnd == (HWND)lParam) //being activated
;{ //3
;uEnableFlag = MF_ENABLED;
;} //3
;else
;{ //3
;uEnableFlag = MF_GRAYED;//being de-activated
;} //3
;EnableMenuItem(hMenu, 1, MF_BYPOSITION | uEnableFlag);
;EnableMenuItem(hMenu, 2, MF_BYPOSITION | uEnableFlag);

;hFileMenu = GetSubMenu(hMenu, 0);
;EnableMenuItem(hFileMenu, CM_FILE_SAVE, MF_BYCOMMAND | uEnableFlag);
;EnableMenuItem(hFileMenu, CM_FILE_SAVEAS, MF_BYCOMMAND | uEnableFlag);

;DrawMenuBar(g_hMainWindow);
;} //2
;break;