;/*
;//This msg isn't posted if the mouse is captured
;case WM_NCMOUSEMOVE:
;{ //3
;POINTS pts;
;if(g_bMouseDrag)
;{ //4
;pts = MAKEPOINTS(lParam);
;g_iMouseDeltaX = pts.x - g_iMouseLastX;
;g_iMouseDeltaY = pts.y - g_iMouseLastY;
;g_iMouseLastX = pts.x;
;g_iMouseLastY = pts.y;
;} //4
;} //3
;break;
;//*/