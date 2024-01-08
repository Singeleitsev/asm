;case WM_COMMAND:
;{ //3
;switch(LOWORD(wParam))
;{ //4
;case CM_FILE_EXIT:
;PostMessage(hWnd, WM_CLOSE, 0, 0);
;break;

;case CM_FILE_NEW_3D:
;{ //5
;HWND hChild;

;if(g_iNumChild < g_iMaxChild) // If the number of children hasn't reached the maximum
;g_iNumChild++;// Increment the number of children
;else
;break;// Otherwise break out of the routine

;char szWindowTitle[] = "3D";
;//sprintf(szWindowTitle, "%d", g_iNumChild - 1);

;/* One way to create a child window is to send a WM_MDICREATE message to the client
;window and pass it a pointer to a MDICREATESTRUCT. */

;/*
;MDICREATESTRUCT mcs;
;mcs.szTitle = szWindowTitle;
;mcs.szClass = g_szChildClassName;
;mcs.hOwner = g_hInst;
;mcs.x = mcs.cx = CW_USEDEFAULT;
;mcs.y = mcs.cy = CW_USEDEFAULT;
;mcs.style = MDIS_ALLCHILDSTYLES;

;hChild = (HWND)SenduMessage(g_hMDIClient, WM_MDICREATE, 0, (LONG)&mcs);
;//*/

;/* Another way to create a child window is to use CreateWindowEx and set the extended
;windows style to WS_EX_MDICHILD. I prefer this method as it will allow each child to be created in
;seperate threads in the future. */

;//*
;CREATESTRUCT cs;
;ZeroMemory(&cs, sizeof(CREATESTRUCT));

;hChild = CreateWindowEx(
;WS_EX_MDICHILD,
;g_szChild3DClassName,
;szWindowTitle,
;WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;g_hMDIClient,
;NULL,
;g_hInst,
;&cs
;);
;//*/
;if(!hChild)
;{ //6
;MessageBox(NULL, "3D Child creation failed.", "Error",
;MB_ICONEXCLAMATION | MB_OK);
;} //6

;g_child[g_iNumChild - 1].iType = 1;// Set child windows type
;g_child[g_iNumChild - 1].hWnd = hChild;// Set child windows handle
;g_child[g_iNumChild - 1].hDC = GetDC(hChild);// Set child windows device context

;PIXELFORMATDESCRIPTOR pfd;
;ZeroMemory(&pfd, sizeof(pfd));
;pfd.nSize = sizeof(pfd);
;pfd.nVersion = 1;
;pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
;pfd.iPixelType = PFD_TYPE_RGBA;
;pfd.cColorBits = 24;
;pfd.cDepthBits = 16;
;pfd.iLayerType = PFD_MAIN_PLANE;
;int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
;SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);// Set pixel format for this child

;g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);// Set childs rendering context
;wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);// Make this child the current DC and RC
;InitGL();// Initialize the rendering defaults for this child
;} //5
;break;

;case CM_FILE_NEW_FRONT:
;{ //5
;HWND hChild;

;if(g_iNumChild < g_iMaxChild) // If the number of children hasn't reached the maximum
;g_iNumChild++;// Increment the number of children
;else
;break;// Otherwise break out of the routine

;char szWindowTitle[] = "Front";
;//sprintf(szWindowTitle, "%d", g_iNumChild - 1);

;CREATESTRUCT cs;
;ZeroMemory(&cs, sizeof(CREATESTRUCT));

;hChild = CreateWindowEx(
;WS_EX_MDICHILD,
;g_szChild2DClassName,
;szWindowTitle,
;WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;g_hMDIClient,
;NULL,
;g_hInst,
;&cs
;);

;if(!hChild)
;{ //6
;MessageBox(NULL, "2D Child creation failed.", "Error",
;MB_ICONEXCLAMATION | MB_OK);
;} //6

;g_child[g_iNumChild - 1].iType = 2;// Set child windows type
;g_child[g_iNumChild - 1].hWnd = hChild;// Set child windows handle
;g_child[g_iNumChild - 1].hDC = GetDC(hChild);// Set child windows device context

;PIXELFORMATDESCRIPTOR pfd;
;ZeroMemory(&pfd, sizeof(pfd));
;pfd.nSize = sizeof(pfd);
;pfd.nVersion = 1;
;pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
;pfd.iPixelType = PFD_TYPE_RGBA;
;pfd.cColorBits = 24;
;pfd.cDepthBits = 16;
;pfd.iLayerType = PFD_MAIN_PLANE;
;int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
;SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);// Set pixel format for this child

;g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);// Set childs rendering context
;wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);// Make this child the current DC and RC
;InitGL();// Initialize the rendering defaults for this child
;} //5
;break;

;case CM_FILE_NEW_TOP:
;{ //5
;HWND hChild;

;if(g_iNumChild < g_iMaxChild) // If the number of children hasn't reached the maximum
;g_iNumChild++;// Increment the number of children
;else
;break;// Otherwise break out of the routine

;char szWindowTitle[] = "Top";
;//sprintf(szWindowTitle, "%d", g_iNumChild - 1);

;CREATESTRUCT cs;
;ZeroMemory(&cs, sizeof(CREATESTRUCT));

;hChild = CreateWindowEx(
;WS_EX_MDICHILD,
;g_szChild2DClassName,
;szWindowTitle,
;WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;g_hMDIClient,
;NULL,
;g_hInst,
;&cs
;);

;if(!hChild)
;{ //6
;MessageBox(NULL, "2D Child creation failed.", "Error",
;MB_ICONEXCLAMATION | MB_OK);
;} //6

;g_child[g_iNumChild - 1].iType = 3;// Set child windows type
;g_child[g_iNumChild - 1].hWnd = hChild;// Set child windows handle
;g_child[g_iNumChild - 1].hDC = GetDC(hChild);// Set child windows device context

;PIXELFORMATDESCRIPTOR pfd;
;ZeroMemory(&pfd, sizeof(pfd));
;pfd.nSize = sizeof(pfd);
;pfd.nVersion = 1;
;pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
;pfd.iPixelType = PFD_TYPE_RGBA;
;pfd.cColorBits = 24;
;pfd.cDepthBits = 16;
;pfd.iLayerType = PFD_MAIN_PLANE;
;int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
;SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);// Set pixel format for this child

;g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);// Set childs rendering context
;wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);// Make this child the current DC and RC
;InitGL();// Initialize the rendering defaults for this child
;} //5
;break;

;case CM_FILE_NEW_LEFT:
;{ //5
;HWND hChild;

;if(g_iNumChild < g_iMaxChild) // If the number of children hasn't reached the maximum
;g_iNumChild++;// Increment the number of children
;else
;break;// Otherwise break out of the routine

;char szWindowTitle[] = "Left";
;//sprintf(szWindowTitle, "%d", g_iNumChild - 1);

;CREATESTRUCT cs;
;ZeroMemory(&cs, sizeof(CREATESTRUCT));

;hChild = CreateWindowEx(
;WS_EX_MDICHILD,
;g_szChild2DClassName,
;szWindowTitle,
;WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;CW_USEDEFAULT,
;g_hMDIClient,
;NULL,
;g_hInst,
;&cs
;);

;if(!hChild)
;{
;MessageBox(NULL, "2D Child creation failed.", "Error",
;MB_ICONEXCLAMATION | MB_OK);
;}

;g_child[g_iNumChild - 1].iType = 4;// Set child windows type
;g_child[g_iNumChild - 1].hWnd = hChild;// Set child windows handle
;g_child[g_iNumChild - 1].hDC = GetDC(hChild);// Set child windows device context

;PIXELFORMATDESCRIPTOR pfd;
;ZeroMemory(&pfd, sizeof(pfd));
;pfd.nSize = sizeof(pfd);
;pfd.nVersion = 1;
;pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
;pfd.iPixelType = PFD_TYPE_RGBA;
;pfd.cColorBits = 24;
;pfd.cDepthBits = 16;
;pfd.iLayerType = PFD_MAIN_PLANE;
;int iFormat = ChoosePixelFormat(g_child[g_iNumChild - 1].hDC, &pfd);
;SetPixelFormat(g_child[g_iNumChild - 1].hDC, iFormat, &pfd);// Set pixel format for this child

;g_child[g_iNumChild - 1].hRC = wglCreateContext(g_child[g_iNumChild - 1].hDC);// Set childs rendering context
;wglMakeCurrent(g_child[g_iNumChild - 1].hDC, g_child[g_iNumChild - 1].hRC);// Make this child the current DC and RC
;InitGL();// Initialize the rendering defaults for this child
;} //5
;break;

;case CM_WINDOW_TILEHORZ:
;PostMessage(g_hMDIClient, WM_MDITILE, MDITILE_HORIZONTAL, 0);
;break;

;case CM_WINDOW_TILEVERT:
;PostMessage(g_hMDIClient, WM_MDITILE, MDITILE_VERTICAL, 0);
;break;

;case CM_WINDOW_CASCADE:
;PostMessage(g_hMDIClient, WM_MDICASCADE, 0, 0);
;break;

;case CM_WINDOW_ARRANGE:
;PostMessage(g_hMDIClient, WM_MDIICONARRANGE, 0, 0);
;break;

;default:
;{ //5
;if(LOWORD(wParam) >= ID_MDI_FIRSTCHILD)
;{ //6
;DefFrameProc(hWnd, g_hMDIClient, uMessage, wParam, lParam);
;} //6
;else
;{ //6
;HWND hChild;
;hChild = (HWND)SendMessage(g_hMDIClient, WM_MDIGETACTIVE, 0, 0);
;if(hChild)
;{ //7
;SendMessage(hChild, WM_COMMAND, wParam, lParam);
;} //7
;} //6
;} //5
;} //4
;} //3
;break;