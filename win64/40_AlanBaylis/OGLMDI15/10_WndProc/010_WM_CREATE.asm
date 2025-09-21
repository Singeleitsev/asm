;case WM_CREATE:
;{ //3
;CLIENTCREATESTRUCT ccs;
;// Find window menu where children will be listed
;ccs.hWindowMenu = NULL;
;// If the menus document list for more than 9 children didn't upset the child ID then I would use the line below
;//ccs.hWindowMenu = (HMENU)GetSubMenu(GetMenu(hWnd), 2);// if you use less than 10 windows then use this line
;ccs.idFirstChild = ID_MDI_FIRSTCHILD;

;g_hMDIClient = CreateWindowEx(WS_EX_CLIENTEDGE, "MDICLIENT", NULL,
;WS_CHILD | WS_CLIPCHILDREN | WS_CLIPSIBLINGS, //WS_VSCROLL and WS_HSCROLL do not work properly yet
;CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
;hWnd, (HMENU)ID_MDI_CLIENT, g_hInst, (LPVOID)&ccs);

;ShowWindow(g_hMDIClient, SW_SHOW);
;return 0;
;} //3

