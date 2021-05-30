;case WM_LBUTTONDOWN:
;g_bMouseDrag2 = 1;// Set mouse flag
;g_iMouseLastX2 = LOWORD(lParam);// Get mouse position
;g_iMouseLastY2 = HIWORD(lParam);
;SetCapture(hWnd);// Capture the mouse
;break;