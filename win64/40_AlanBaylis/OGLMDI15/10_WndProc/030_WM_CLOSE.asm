;case WM_CLOSE:
;{
;int iLoop;
;if(g_iNumChild) // If there are any children
;{
;for(iLoop = 0;iLoop < g_iNumChild;iLoop++) // Send all children the WM_CLOSE to free up their DC and RC
;{
;SendMessage(g_child[iLoop].hWnd, WM_CLOSE, 0, 0);
;}
;}
;delete[] g_child;// Delete the array of children
;delete[] texture;
;delete[] vertex;
;delete[] polygon;
;DestroyWindow(hWnd);
;}
;break;