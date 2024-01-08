;Соответствие типов переменных и размеров в байтах взято из win64.inc из библиотеки hutch--
;The MASM Forum » Microsoft 64 bit MASM » MASM64 SDK » Current build of the 64 bit MASM SDK 
; http://masm32.com/board/index.php?PHPSESSID=cea7aeff3e4b0c6290d1846becec6b1e&topic=6486.0
;Комментарии см. MSDN

POINT64 STRUCT
	x dd ?
	y dd ?
POINT64 ENDS

MSG64 STRUCT
	hWnd dq ?
	message dd ?
	wParam dq ?
	lParam dq ?
	time dd ?
	pt POINT64 <>
MSG64 ENDS

WNDCLASSEX64 STRUCT
	cbSize dd ?
	style dd ?
	lpfnWndProc dq ?
	cbClsExtra dd ?
	cbWndExtra dd ?
	hInstance dq ?
	hIcon dq ?
	hCursor dq ?
	hbrBackground dq ?
	lpszMenuName dq ?
	lpszClassName dq ?
	hIconSm dq ?
WNDCLASSEX64 ENDS

MDICREATESTRUCT64 STRUCT
	szClass dq ?
	szTitle dq ?
	hOwner dq ?
	x dd ?
	y dd ?
	lx dd ?
	ly dd ?
	style dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
	lParam dq ?
MDICREATESTRUCT64 ENDS

CLIENTCREATESTRUCT64 STRUCT
	hWindowMenu dq ?
	idFirstChild dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
CLIENTCREATESTRUCT64 ENDS

RECT64 STRUCT
	left dd ?
	top dd ?
	right dd ?
	bottom dd ?
RECT64 ENDS

PAINTSTRUCT64 STRUC
	hdc dq ?
	fErase dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
	rcPaint RECT64 <>
	fRestore dd ?
	fIncUpdate dd ?
	rgbReserved db 32 dup(?)
PAINTSTRUCT64 ENDS



;F:\bin\dev\fasmw17164\INCLUDE\EQUATES\GDI64.INC
PIXELFORMATDESCRIPTOR64 STRUC
	nSize dw ?
	nVersion dw ?
	dwFlags dd ?
	iPixelType db ?
	cColorBits db ?
	cRedBits db ?
	cRedShift db ?
	cGreenBits db ?
	cGreenShift db ?
	cBlueBits db ?
	cBlueShift db ?
	cAlphaBits db ?
	cAlphaShift db ?
	cAccumBits db ?
	cAccumRedBits db ?
	cAccumGreenBits db ?
	cAccumBlueBits db ?
	cAccumAlphaBits db ?
	cDepthBits db ?
	cStencilBits db ?
	cAuxBuffers db ?
	iLayerType db ?
	bReserved db ?
	dwLayerMask dd ?
	dwVisibleMask dd ?
	dwDamageMask dd ?
PIXELFORMATDESCRIPTOR64 ENDS