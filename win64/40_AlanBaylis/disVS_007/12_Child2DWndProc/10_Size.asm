;case WM_SIZE:
;{ //3
;if(wParam != SIZE_MINIMIZED)
;{ //4
;RECT WindowRect;
;GetClientRect(hWnd, &WindowRect);
;int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;if(g_child[iThisChild].iType == 2)
;{ //5
;TopDepth = -0.5 * WindowRect.bottom + 10;
;LeftDepth = -0.5 * WindowRect.right + 10;
;} //5
;if(g_child[iThisChild].iType == 3)
;{ //5
;FrontDepth = 0.5 * WindowRect.bottom - 10;
;LeftDepth = -0.5 * WindowRect.right + 10;
;} //5
;if(g_child[iThisChild].iType == 4)
;{ //5
;FrontDepth = -0.5 * WindowRect.right + 10;
;TopDepth = -0.5 * WindowRect.bottom + 10;
;} //5
;} //4
;} //3
;break;