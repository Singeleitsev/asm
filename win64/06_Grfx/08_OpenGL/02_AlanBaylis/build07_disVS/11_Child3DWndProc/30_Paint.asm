;/* The following code paints the child window when necessary but isn't needed as we
;repaint all of them each frame. */

;/*
;case WM_PAINT:
;{ //3
;int iThisChild;
;PAINTSTRUCT ps;
;BeginPaint(hWnd, &ps);
;iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;wglMakeCurrent(g_child[iThisChild].hDC, g_child[iThisChild].hRC);
;GetClientRect(hWnd, &g_rectChild);
;if(g_rectChild.right > 0 && g_rectChild.bottom > 0)
;SetProjection(g_rectChild.right, g_rectChild.bottom);
;DrawGLScene();
;glFlush();
;SwapBuffers(hDC);
;EndPaint(hWnd, &ps);
;} //3
;break;
;//*/