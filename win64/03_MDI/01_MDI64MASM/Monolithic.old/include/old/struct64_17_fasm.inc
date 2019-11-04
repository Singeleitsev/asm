POINT64 STRUCT
  x dd ?
  y dd ?
POINT64 ENDS

MSG64 STRUCT
  hwnd	  dq ?
  message dd ?,?
  wParam  dq ?
  lParam  dq ?
  time	  dd ?
  pt	  POINT64 <>
	  dd ?
MSG64 ENDS

WNDCLASSEX64 STRUCT
  cbSize	dd ?
  style 	dd ?
  lpfnWndProc	dq ?
  cbClsExtra	dd ?
  cbWndExtra	dd ?
  hInstance	dq ?
  hIcon 	dq ?
  hCursor	dq ?
  hbrBackground dq ?
  lpszMenuName	dq ?
  lpszClassName dq ?
  hIconSm	dq ?
WNDCLASSEX64 ENDS

MDICREATESTRUCT64 STRUCT
  szClass dq ?
  szTitle dq ?
  hOwner  dq ?
  x	  dd ?
  y	  dd ?
  lx	  dd ?
  ly	  dd ?
  style   dd ?
  lParam  dd ?
MDICREATESTRUCT64 ENDS

CLIENTCREATESTRUCT64 STRUCT
  hWindowMenu  dq ?
  idFirstChild dd ?
CLIENTCREATESTRUCT64 ENDS