;case WM_MOUSEMOVE:
;if(g_bMouseDrag) // If mouse flag set
;{ //3
;g_iMouseDeltaX = LOWORD(lParam) - g_iMouseLastX;// Get mouse deltas
;g_iMouseDeltaY = HIWORD(lParam) - g_iMouseLastY;
;g_iMouseLastX = LOWORD(lParam);// Get new mouse position
;g_iMouseLastY = HIWORD(lParam);
;} //3
;break;