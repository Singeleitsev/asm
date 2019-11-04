;Соответствие типов переменных и размеров в байтах взято из win64.inc из библиотеки hutch--
;The MASM Forum » Microsoft 64 bit MASM » MASM64 SDK » Current build of the 64 bit MASM SDK 
; http://masm32.com/board/index.php?PHPSESSID=cea7aeff3e4b0c6290d1846becec6b1e&topic=6486.0
;Комментарии см. MSDN

POINT64 STRUCT
	x dd ?
	y dd ?
POINT64 ENDS

RECT64 STRUCT
    left dd ?
    top dd ?
    right dd ?
    bottom dd ?
RECT64 ENDS

CLIENTCREATESTRUCT64 STRUCT
	hWindowMenu dq ?
	idFirstChild dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
CLIENTCREATESTRUCT64 ENDS

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

MSG64 STRUCT
	hWnd dq ?
	message dd ?
	wParam dq ?
	lParam dq ?
	time dd ?
	pt POINT64 <>
MSG64 ENDS

OSVERSIONINFO64 STRUCT
	dwOSVersionInfoSize dd 0 ;ULONG
	dwMajorVersion dd 0 ;ULONG
	dwMinorVersion dd 0 ;ULONG
	dwBuildNumber dd 0 ;ULONG
	dwPlatformId dd 0 ;ULONG
	szCSDVersion db 128 dup (0) ;WCHAR
	wServicePackMajor dd 0 ;USHORT
	wServicePackMinor dd 0 ;USHORT
	wSuiteMask dd 0 ;USHORT
	wProductType db 0 ;UCHAR
	wReserved db 0 ;UCHAR
OSVERSIONINFO64 ends

PAINTSTRUCT64 STRUCT
	hdc dq ?
	fErase dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
	rcPaint RECT64 <>
	fRestore dd ?
	fIncUpdate dd ?
	rgbReserved db 32 dup(?)
PAINTSTRUCT64 ENDS

STARTUPINFO64 STRUCT
	cb dd ?,? ;DWORD
	lpReserved dq ? ;LPSTR
	lpDesktop dq ? ;LPSTR
	lpTitle dq ? ;LPSTR
	dwX dd ? ;DWORD
	dwY dd ? ;DWORD
	dwXSize dd ? ;DWORD
	dwYSize dd ? ;DWORD
	dwXCountChars dd ? ;DWORD
	dwYCountChars dd ? ;DWORD
	dwFillAttribute dd ? ;DWORD
	dwFlags dd ? ;DWORD
	wShowWindow dw ? ;WORD
	cbReserved2 dw ?,?,? ;WORD
	lpReserved2 dq ? ;LPBYTE
	hStdInput dq ? ;HANDLE
	hStdOutput dq ? ;HANDLE
	hStdError dq ? ;HANDLE
STARTUPINFO64 ends

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

