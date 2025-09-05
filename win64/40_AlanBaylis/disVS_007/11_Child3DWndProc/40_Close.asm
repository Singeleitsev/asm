;case WM_CLOSE:
;g_iNumChild--;// Decrement the number of child windows
;if(g_iNumChild == 0) // If this is the last child window then just free the DC and RC
;{ //3
;wglMakeCurrent( NULL, NULL );
;ReleaseDC(g_child[0].hWnd, g_child[0].hDC);
;wglDeleteContext(g_child[0].hRC);
;} //3
;else
;{ //3
;int iLoop;
;int iThisChild;
;char szWindowTitle[20];
;iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;ReleaseDC(g_child[iThisChild].hWnd, g_child[iThisChild].hDC);// Free this childs DC and RC
;wglDeleteContext(g_child[iThisChild].hRC);
;if(iThisChild != g_iNumChild) // If this child isn't the last in the array of children
;{ //4
;for (iLoop = iThisChild;iLoop < (g_iNumChild);iLoop++) // Loop from this child to the end of the array
;{ //5
;g_child[iLoop] = g_child[iLoop + 1];// Shift the children forward in the array
;sprintf(szWindowTitle, "%d", iLoop);
;SetWindowText(g_child[iLoop].hWnd, szWindowTitle);// Renumber the children
;} //5
;} //4
;} //3
;break;