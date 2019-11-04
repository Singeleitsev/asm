WNDCLASSEX32 STRUCT
	cbSize dd 0
	style dd ?
	lpfnWndProc dd ?
	cbClsExtra dd ?
	cbWndExtra dd ?
	hInstance dd ?
	hIcon dd ?
	hCursor dd ?
	hbrBackground dd ?
	lpszMenuName dd ?
	lpszClassName dd ?
	hIconSm dd 0
WNDCLASSEX32 ENDS

POINT32 STRUCT
	x dd ?
	y dd ?
POINT32 ENDS

MSG32 STRUCT
	hWnd dd ?
	message dd ?
	wParam dd ?
	lParam dd ?
	time dd ?
	pt POINT32 <>
MSG32 ENDS

RECT32 STRUCT
	left dd ?
	top dd ?
	right dd ?
	bottom dd ?
RECT32 ENDS

PAINTSTRUCT32 STRUCT
	hdc dd ?
	fErase dd ?
	rcPaint RECT32 <>
	fRestore dd ?
	fIncUpdate dd ?
	rgbReserved db 16 dup(?)
PAINTSTRUCT32 ENDS