CHIILD64 STRUCT
iType dq ? ;Type of child window (1 = 3D, 2 = XY (Front) ortho view, 3 = XZ (Top) ortho view, 4 = ZY (Left) ortho view)
hDC dq ? ;Individual device context
hRC dq ? ;Individual rendering context
hWND dq ? ;Handle to child window
CHILD64 ENDS