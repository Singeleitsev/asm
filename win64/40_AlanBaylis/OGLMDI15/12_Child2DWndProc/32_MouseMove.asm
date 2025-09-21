;case WM_MOUSEMOVE:
;{ //3
;RECT WindowRect;
;GetClientRect(hWnd, &WindowRect);
;MouseX = LOWORD(lParam);
;MouseY = HIWORD(lParam);
;int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;if(g_bMouseDrag2) // If mouse flag set
;{ //4
;if (MouseX < WindowRect.left || MouseX > WindowRect.right)
;{ //5
;MouseX = g_iMouseLastX2;
;} //5
;if (MouseY < WindowRect.top || MouseY > WindowRect.bottom)
;{ //5
;MouseY = g_iMouseLastY2;
;} //5
;g_iMouseDeltaX2 = MouseX - g_iMouseLastX2;// Get mouse deltas
;g_iMouseDeltaY2 = MouseY - g_iMouseLastY2;
;g_iMouseLastX2 = MouseX;// Get new mouse position
;g_iMouseLastY2 = MouseY;
;if(g_child[iThisChild].iType == 2)
;{ //5
;vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0;// Apply mouse deltas to cube rotation values
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0;
;} //5
;if(g_child[iThisChild].iType == 3)
;{ //5
;vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0;// Apply mouse deltas to cube rotation values
;vertex[VertexNumber].z += (float)g_iMouseDeltaY2 * 1.0;
;} //5
;if(g_child[iThisChild].iType == 4)
;{ //5
;vertex[VertexNumber].z += (float)g_iMouseDeltaX2 * 1.0;// Apply mouse deltas to cube rotation values
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0;
;} //5
;SetPolygons();
;} //4

;if(!g_bMouseDrag2)
;{ //4
;MouseX = (int)(LOWORD(lParam) + (-0.5 * WindowRect.right));
;if(g_child[iThisChild].iType == 3)
;MouseY = (int)(HIWORD(lParam) + (-0.5 * WindowRect.bottom));
;else
;MouseY = (int)(-1 * (HIWORD(lParam) + (-0.5 * WindowRect.bottom)));
;ShortestDistance = 10000;
;int Loop;
;int TempX;
;int TempY;
;for(Loop = 0;Loop < 8;Loop++)
;{ //5
;iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;if(g_child[iThisChild].iType == 2)
;{ //6
;TempX = (int)(MouseX - vertex[Loop].x);
;TempY = (int)(MouseY - vertex[Loop].y);
;} //6
;if(g_child[iThisChild].iType == 3)
;{ //6
;TempX = (int)(MouseX - vertex[Loop].x);
;TempY = (int)(MouseY - vertex[Loop].z);
;} //6
;if(g_child[iThisChild].iType == 4)
;{ //6
;TempX = (int)(MouseX - vertex[Loop].z);
;TempY = (int)(MouseY - vertex[Loop].y);
;} //6
;if(sqrt((TempX * TempX) + (TempY * TempY)) < ShortestDistance)
;{ //6
;ShortestDistance = (int)(sqrt((TempX * TempX) + (TempY * TempY)));
;VertexNumber = Loop;
;} //6
;} //5

;//int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;//DrawWin32Text(g_child[iThisChild].hDC, WindowRect.right, WindowRect.bottom, 1, 1);
;} //4
;} //3
;break;