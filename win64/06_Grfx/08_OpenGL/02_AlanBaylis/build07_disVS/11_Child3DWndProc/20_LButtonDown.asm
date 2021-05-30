;case WM_LBUTTONDOWN:
;g_bMouseDrag = 1;// Set mouse flag
;g_iMouseLastX = LOWORD(lParam);// Get mouse position
;g_iMouseLastY = HIWORD(lParam);
;SetCapture(hWnd);// Capture the mouse
;break;