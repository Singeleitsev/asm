;Соответствие типов переменных и размеров в байтах
;взято из USER64.INC из пакета fasm
;Комментарии взяты из MSDN

POINT64 STRUCT		;typedef struct tagPOINT {
  x dd ?		;LONG x;
  y dd ?		;LONG y;
POINT64 ENDS		;} POINT, *PPOINT;

MSG64 STRUCT 		;typedef struct tagMSG {     // msg 
  hWnd dq ?		;HWND hWnd;		Identifies the window whose window procedure receives the message
  message dd ?		;UINT message;		Specifies the message number
  wParam dq ?		;WPARAM wParam;		Specifies additional information about the message
  lParam dq ?		;LPARAM lParam;		Specifies additional information about the message
  time dd ?		;DWORD time;		Specifies the time at which the message was posted
  pt POINT64 <?>	;POINT pt;		Specifies the cursor position, in screen coordinates, when the message was posted
MSG64 ENDS		;} MSG;

WNDCLASSEX64 STRUCT	;typedef struct tagWNDCLASSEX {
  cbSize dd ?		;UINT cbSize;		The size, in bytes, of this structure
  style dd ?		;UINT style;		The class style(s)
  lpfnWndProc dq ?	;WNDPROC lpfnWndProc;	A pointer to the window procedure
  cbClsExtra dd ?	;int cbClsExtra;	The number of extra bytes to allocate following the window-class structure
  cbWndExtra dd ?	;int cbWndExtra;	The number of extra bytes to allocate following the window instance
  hInstance dq ?	;HINSTANCE hInstance;	A handle to the instance that contains the window procedure for the class
  hIcon dq ?		;HICON hIcon;		A handle to the class icon
  hCursor dq ?		;HCURSOR hCursor;	A handle to the class cursor
  hbrBackground dq ?	;HBRUSH hbrBackground;	A handle to the class background brush
  lpszMenuName dq ?	;LPCTSTR lpszMenuName;	Pointer to a null-terminated character string that specifies the resource name of the class menu, as the name appears in the resource file
  lpszClassName dq ?	;LPCTSTR lpszClassName;	A pointer to a null-terminated string or is an atom
  hIconSm dq ?	;HICON hIconSm;		A handle to a small icon that is associated with the window class
WNDCLASSEX64 ENDS	;} WNDCLASSEX, *PWNDCLASSEX;

MDICREATESTRUCT64 STRUCT;typedef struct tagMDICREATESTRUCT {
  szClass dq ?		;LPCTSTR szClass;	The name of the window class of the MDI child window
  szTitle dq ?		;LPCTSTR szTitle;	The title of the MDI child window
  hOwner dq ?		;HANDLE  hOwner;	A handle to the instance of the application creating the MDI client window
  x dd ?		;int     x;		The initial horizontal position, in client coordinates, of the MDI child window
  y dd ?		;int     y;		The initial vertical position, in client coordinates, of the MDI child window
  cx dd ?		;int     cx;		The initial width, in device units, of the MDI child window
  cy dd ?		;int     cy;		The initial height, in device units, of the MDI child window
  style dd ?		;DWORD   style;		The style of the MDI child window
  lParam dd ?		;LPARAM  lParam;
MDICREATESTRUCT64 ENDS	;} MDICREATESTRUCT, *LPMDICREATESTRUCT;

CLIENTCREATESTRUCT64	;typedef struct tagCLIENTCREATESTRUCT {
  hWindowMenu dq ?	;HANDLE hWindowMenu;
  idFirstChild dq ?	;UINT   idFirstChild;
CLIENTCREATESTRUCT64 ENDS	;} CLIENTCREATESTRUCT, *LPCLIENTCREATESTRUCT;