;============================================================================
;int WINAPI WinMain
;(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;============================================================================
	push ebp
	mov ebp,esp
;HACCEL hAccel;
;HWND hwndFrame, hwndClient;
;MSG msg;
;WNDCLASSEX wndclass;
	;LOCAL hAccel:DWORD
	;LOCAL hwndFrame:DWORD, hwndClient:DWORD
	;LOCAL MSG:msg
	;LOCAL WNDCLASSEX:wndclass
	sub esp,58h

	push ebx
	push esi
	push edi

;hInst = hInstance ;
	mov eax,dword ptr ss:[ebp+8]
	mov dword ptr ds:[405E90],eax
;if (!hPrevInstance)
	cmp dword ptr ss:[ebp+0Ch],0
	jne mdidemo.40118B

;// Register the frame window class
;wndclass.cbSize = sizeof (wndclass) ;
	mov dword ptr ss:[ebp-34h],30h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	mov dword ptr ss:[ebp-30h],3
;wndclass.lpfnWndProc = FrameWndProc ;
	mov dword ptr ss:[ebp-2Ch],mdidemo.401305
;wndclass.cbClsExtra = 0 ;
	mov dword ptr ss:[ebp-28h],0
;wndclass.cbWndExtra = 0 ;
	mov dword ptr ss:[ebp-24h],0
;wndclass.hInstance = hInstance ;
	mov eax,dword ptr ss:[ebp+8]
	mov dword ptr ss:[ebp-20h],eax
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadCursorA>]
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) (COLOR_APPWORKSPACE + 1) ;
	mov dword ptr ss:[ebp-14h],D
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szFrameClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405030
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h]
	push eax
	call dword ptr ds:[<&RegisterClassExA>]

;// Register the Hello child window class
;wndclass.cbSize = sizeof (wndclass) ;
	mov dword ptr ss:[ebp-34h],30h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	mov dword ptr ss:[ebp-30h],3
;wndclass.lpfnWndProc   = HelloWndProc ;
	mov dword ptr ss:[ebp-2Ch],mdidemo.4016EB
;wndclass.cbClsExtra    = 0 ;
	mov dword ptr ss:[ebp-28h],0
;wndclass.cbWndExtra    = sizeof (HANDLE) ;
	mov dword ptr ss:[ebp-24h],4
;wndclass.hInstance     = hInstance ;
	mov eax,dword ptr ss:[ebp+8]
	mov dword ptr ss:[ebp-20h],eax
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadCursorA>]
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	push 0
	call dword ptr ds:[<&GetStockObject>]
	mov dword ptr ss:[ebp-14h],eax
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szHelloClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405040
;wndclass.hIconSm       = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h]
	push eax
	call dword ptr ds:[<&RegisterClassExA>]

;// Register the Rect child window class
;wndclass.cbSize = sizeof (wndclass) ;
	mov dword ptr ss:[ebp-34h],30h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	mov dword ptr ss:[ebp-30h],3
;wndclass.lpfnWndProc = RectWndProc ;
	mov dword ptr ss:[ebp-2Ch],mdidemo.4019D7
;wndclass.cbClsExtra = 0 ;
	mov dword ptr ss:[ebp-28h],0
;wndclass.cbWndExtra = sizeof (HANDLE) ;
	mov dword ptr ss:[ebp-24h],4
;wndclass.hInstance = hInstance ;
	mov eax,dword ptr ss:[ebp+8]
	mov dword ptr ss:[ebp-20h],eax
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadCursorA>]
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	push 0
	call dword ptr ds:[<&GetStockObject>]
	mov dword ptr ss:[ebp-14h],eax
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szRectClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405050
;wndclass.hIconSm       = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h]
	push eax
	call dword ptr ds:[<&RegisterClassExA>]

;// Obtain handles to three possible menus & submenus
;hMenuInit  = LoadMenu (hInst, "MdiMenuInit") ;
	push mdidemo.405074
	mov eax,dword ptr ds:[405E90]
	push eax
	call dword ptr ds:[<&LoadMenuA>]
	mov dword ptr ds:[405EAC],eax
;hMenuHello = LoadMenu (hInst, "MdiMenuHello") ;
	push mdidemo.405080
	mov eax,dword ptr ds:[405E90]
	push eax
	call dword ptr ds:[<&LoadMenuA>]
	mov dword ptr ds:[405EB8],eax
;hMenuRect = LoadMenu (hInst, "MdiMenuRect") ;
	push mdidemo.405090
	mov eax,dword ptr ds:[405E90]
	push eax
	call dword ptr ds:[<&LoadMenuA>]
	mov dword ptr ds:[405E94],eax
;hMenuInitWindow = GetSubMenu (hMenuInit, INIT_MENU_POS) ;
	push 0
	mov eax,dword ptr ds:[405EAC]
	push eax
	call dword ptr ds:[<&GetSubMenu>]
	mov dword ptr ds:[405EB0],eax
;hMenuHelloWindow = GetSubMenu (hMenuHello, HELLO_MENU_POS) ;
	push 2
	mov eax,dword ptr ds:[405EB8]
	push eax
	call dword ptr ds:[<&GetSubMenu>]
	mov dword ptr ds:[405EA4],eax
;hMenuRectWindow = GetSubMenu (hMenuRect, RECT_MENU_POS) ;
	push 1
	mov eax,dword ptr ds:[405E94]
	push eax
	call dword ptr ds:[<&GetSubMenu>]
	mov dword ptr ds:[405EA8],eax

;// Load accelerator table
	push mdidemo.40509C
	mov eax,dword ptr ds:[405E90]
	push eax
	call dword ptr ds:[<&LoadAcceleratorsA>]
	mov dword ptr ss:[ebp-4],eax

;// Create the frame window
	push 0
	mov eax,dword ptr ss:[ebp+8] ;hInstance
	push eax
	mov eax,dword ptr ds:[405EAC] ;hMenuInit
	push eax
	push 0
	push 80000000
	push 80000000
	push 80000000
	push 80000000
	push 2CF0000
	push mdidemo.4050A8 ;MDI Demonstration
	push mdidemo.405030 ;szFrameClass
	push 0
	call dword ptr ds:[<&CreateWindowExA>]
	mov dword ptr ss:[ebp-58h],eax

;hwndClient = GetWindow (hwndFrame, GW_CHILD) ;
	push 5
	mov eax,dword ptr ss:[ebp-58h]
	push eax
	call dword ptr ds:[<&GetWindow>]
	mov dword ptr ss:[ebp-54h],eax
	mov eax,dword ptr ss:[ebp+14h]
	push eax
	mov eax,dword ptr ss:[ebp-58h]
	push eax
	call dword ptr ds:[<&ShowWindow>]
	mov eax,dword ptr ss:[ebp-58h]
	push eax
	call dword ptr ds:[<&UpdateWindow>]

;// Enter the modified message loop
	push 0
	push 0
	push 0
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call dword ptr ds:[<&GetMessageA>]
	test eax,eax
		je mdidemo.4012DE
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-54h] ;hwndClient
	push eax
	call dword ptr ds:[<&TranslateMDISysAccel>]
	test eax,eax
		jne mdidemo.4012D9
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-4] ;hAccel
	push eax
	mov eax,dword ptr ss:[ebp-58h] ;hwndFrame
	push eax
	call dword ptr ds:[<&TranslateAccelerator>]
	test eax,eax
		jne mdidemo.4012D9
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call dword ptr ds:[<&TranslateMessage>]
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call dword ptr ds:[<&DispatchMessageA>]
		jmp mdidemo.40127D

;// Clean up by deleting unattached menus
	mov eax,dword ptr ds:[405EB8] ;hMenuHello
	push eax
	call dword ptr ds:[<&DestroyMenu>]
	mov eax,dword ptr ds:[405E94] ;hMenuRect
	push eax
	call dword ptr ds:[<&DestroyMenu>]

;return msg.wParam ;
	mov eax,dword ptr ss:[ebp-48h]
	jmp mdidemo.4012FE

	pop edi
	pop esi
	pop ebx

	leave 
	ret 10h


;====================================================
;LRESULT CALLBACK FrameWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
	push ebp
	mov ebp,esp
;static HWND hwndClient ;
;CLIENTCREATESTRUCT clientcreate ;
;HWND hwndChild ;
;MDICREATESTRUCT mdicreate ;
	sub esp,38h

	push ebx
	push esi
	push edi

;switch (iMsg)
	mov eax,dword ptr ss:[ebp+0Ch]
	mov dword ptr ss:[ebp-34h],eax
	jmp mdidemo.4015F5 ;?????????????

;case WM_CREATE : // Create the client window
	;clientcreate.hWindowMenu = hMenuInitWindow ;
		mov eax,dword ptr ds:[405EB0]
		mov dword ptr ss:[ebp-0Ch],eax
	;clientcreate.idFirstChild = IDM_FIRSTCHILD ;
		mov dword ptr ss:[ebp-8h],64h 
	
		lea eax,dword ptr ss:[ebp-0Ch] ;(LPSTR) &clientcreate
		push eax
		mov eax,dword ptr ds:[405E90] ;hInst
		push eax
		push 1 ;(HMENU) 1
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		push 0
		push 0
		push 0
		push 0
		push 52000000h ;WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE
		push 0
		push mdidemo.4050BC ;"MDICLIENT"
		push 0
		call dword ptr ds:[<&CreateWindowExA>]
		mov dword ptr ds:[405EBC],eax
	;return 0 ;
		xor eax,eax
		jmp mdidemo.401655

;case WM_COMMAND :
	;switch (wParam)
		mov eax,dword ptr ss:[ebp+10h]
		mov dword ptr ss:[ebp-38h],eax
		jmp mdidemo.40154B

	;case IDM_NEWHELLO : // Create a Hello child window
		;mdicreate.szClass = szHelloClass ;
			mov dword ptr ss:[ebp-30h],mdidemo.405040
		;mdicreate.szTitle = "Hello" ;
			mov dword ptr ss:[ebp-2Ch],mdidemo.4050C8 ;szHello
		;mdicreate.hOwner = hInst ;
			mov eax,dword ptr ds:[405E90]
			mov dword ptr ss:[ebp-28h],eax
		;mdicreate.x = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-24h],80000000
		;mdicreate.y = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-20h],80000000
		;mdicreate.cx = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-1Ch],80000000
		;mdicreate.cy = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-18h],80000000
		;mdicreate.style = 0 ;
			mov dword ptr ss:[ebp-14h],0
		;mdicreate.lParam = 0 ;
			mov dword ptr ss:[ebp-10h],0
		;hwndChild = (HWND) SendMessage
		;(hwndClient, WM_MDICREATE, 0, (LPARAM) (LPMDICREATESTRUCT) &mdicreate) ;
			lea eax,dword ptr ss:[ebp-30h] ;&mdicreate
			push eax
			push 0
			push 220h ;WM_MDICREATE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
			mov dword ptr ss:[ebp-4],eax ;hwndChild
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;case IDM_NEWRECT : // Create a Rect child window
		;mdicreate.szClass = szRectClass ;
			mov dword ptr ss:[ebp-30],mdidemo.405050
		;mdicreate.szTitle = "Rectangles" ;
			mov dword ptr ss:[ebp-2C],mdidemo.4050D0 ;szRect
		;mdicreate.hOwner = hInst ;
			mov eax,dword ptr ds:[405E90]
			mov dword ptr ss:[ebp-28h],eax
		;mdicreate.x = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-24h],80000000
		;mdicreate.y = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-20h],80000000
		;mdicreate.cx = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-1Ch],80000000
		;mdicreate.cy = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-18h],80000000
		;mdicreate.style = 0 ;
			mov dword ptr ss:[ebp-14h],0
		;mdicreate.lParam = 0 ;
			mov dword ptr ss:[ebp-10h],0
		;hwndChild = (HWND) SendMessage
		;(hwndClient, WM_MDICREATE, 0, (LPARAM) (LPMDICREATESTRUCT) &mdicreate) ;
			lea eax,dword ptr ss:[ebp-30h] ;&mdicreate
			push eax
			push 0
			push 220h ;WM_MDICREATE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
			mov dword ptr ss:[ebp-4],eax
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;case IDM_CLOSE : // Close the active window
		;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
			push 0
			push 0
			push 229h ;WM_MDIGETACTIVE
			mov eax,dword ptr ds:[405EBC]
			push eax
			call dword ptr ds:[<&SendMessageA>]
			mov dword ptr ss:[ebp-4],eax ;hwndChild
		;if (SendMessage (hwndChild, WM_QUERYENDSESSION, 0, 0))
				push 0
				push 0
				push 11h ;WM_QUERYENDSESSION
				mov eax,dword ptr ss:[ebp-4] ;hwndChild
				push eax
				call dword ptr ds:[<&SendMessageA>]
				test eax,eax
				je mdidemo.401474
			;SendMessage (hwndClient, WM_MDIDESTROY, (WPARAM) hwndChild, 0) ;
				push 0
				mov eax,dword ptr ss:[ebp-4] ;(WPARAM) hwndChild
				push eax
				push 221h ;WM_MDIDESTROY
				mov eax,dword ptr ds:[405EBC] ;hwndClient
				push eax
				call dword ptr ds:[<&SendMessageA>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;case IDM_EXIT : // Exit the program
		;SendMessage (hwnd, WM_CLOSE, 0, 0) ;
			push 0
			push 0
			push 10h ;WM_CLOSE
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&SendMessageA>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;// messages for arranging windows
	;case IDM_TILE :
		;SendMessage (hwndClient, WM_MDITILE, 0, 0) ;
			push 0
			push 0
			push 226h ;WM_MDITILE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655
	;case IDM_CASCADE :
		;SendMessage (hwndClient, WM_MDICASCADE, 0, 0) ;
			push 0
			push 0
			push 227h ;WM_MDICASCADE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;case IDM_ARRANGE :
		;SendMessage (hwndClient, WM_MDIICONARRANGE, 0, 0) ;
			push 0
			push 0
			push 228h ;WM_MDIICONARRANGE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655
	;case IDM_CLOSEALL : // Attempt to close all children
		;EnumChildWindows (hwndClient, &CloseEnumProc, 0) ;
			push 0
			push mdidemo.40165C ;&CloseEnumProc
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&EnumChildWindows>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	;default : // Pass to active child...
		;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
			push 0
			push 0
			push 229h ;WM_MDIGETACTIVE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&SendMessageA>]
 		;if (IsWindow (hwndChild)) SendMessage (hwndChild, WM_COMMAND, wParam, lParam) ;
			mov dword ptr ss:[ebp-4],eax
			mov eax,dword ptr ss:[ebp-4]
			push eax
			call dword ptr ds:[<&IsWindow>]
			test eax,eax
			je mdidemo.401541
		;SendMessage (hwndChild, WM_COMMAND, wParam, lParam) ;
			mov eax,dword ptr ss:[ebp+14h] ;lParam
			push eax
			mov eax,dword ptr ss:[ebp+10h] ;wParam
			push eax
			push 111h ;WM_COMMAND
			mov eax,dword ptr ss:[ebp-4] ;hwndChild
			push eax
			call dword ptr ds:[<&SendMessageA>]
			jmp mdidemo.4015A7

		;break ; // ...and then to DefFrameProc
			jmp mdidemo.4015A7

	;????????????????????????????????????
	;????????????????????????????????????
	;????????????????????????????????????
			sub dword ptr ss:[ebp-38],0Ah
			cmp dword ptr ss:[ebp-38],17h
			ja mdidemo.401500
			mov eax,dword ptr ss:[ebp-38h]
			xor ecx,ecx
			mov cl,byte ptr ds:[eax+40158Fh]
			jmp dword ptr ds:[ecx*4+40156Bh]
			imul edx,dword ptr ds:[ebx],40h
			add ah,cl
			adc eax,dword ptr ds:[eax]
			sub eax,7B004014h
			adc al,40h
			add byte ptr ds:[edx-51FFBFECh],dl
			adc al,40h
			add dl,cl
			adc al,40h
			add dh,ah
			adc al,40h
			add byte ptr ds:[eax],al
			adc eax,1000040h
			add al,byte ptr ds:[ebx]
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			or byte ptr ds:[eax],cl
			add al,5
			push es
			pop es
			jmp mdidemo.401634
	;????????????????????????????????????
	;????????????????????????????????????
	;????????????????????????????????????

	;case WM_QUERYENDSESSION :

	;case WM_CLOSE : // Attempt to close all children
		;SendMessage (hwnd, WM_COMMAND, IDM_CLOSEALL, 0) ;
			push 0
			push 21h ;IDM_CLOSEALL
			push 111h ;WM_COMMAND
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&SendMessageA>]
		;if (NULL != GetWindow (hwndClient, GW_CHILD))
			push 5 ;GW_CHILD
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call dword ptr ds:[<&GetWindow>]
			test eax,eax
			je mdidemo.4015DC
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655
		;break ; // I.e., call DefFrameProc 
			jmp mdidemo.401634

	;case WM_DESTROY :
		;PostQuitMessage (0) ;
			push 0
			call dword ptr ds:[<&PostQuitMessage>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655

	jmp mdidemo.401634
	
	cmp dword ptr ss:[ebp-34h],11h ;WM_QUERYENDSESSION
		ja mdidemo.401622
	cmp dword ptr ss:[ebp-34h],10h ;WM_CLOSE
		jae mdidemo.4015AC
	cmp dword ptr ss:[ebp-34h],1 ;WM_CREATE
		je mdidemo.401319
	cmp dword ptr ss:[ebp-34h],2 ;WM_DESTROY
		je mdidemo.4015E1
	jmp mdidemo.401634

	cmp dword ptr ss:[ebp-34h],111h ;WM_COMMAND
		je mdidemo.401360

	jmp mdidemo.401634

	;return DefFrameProc (hwnd, hwndClient, iMsg, wParam, lParam) ;
		mov eax,dword ptr ss:[ebp+14h] ;lParam
		push eax
		mov eax,dword ptr ss:[ebp+10h] ;wParam
		push eax
		mov eax,dword ptr ss:[ebp+0Ch] ;iMsg
		push eax
		mov eax,dword ptr ds:[405EBC] ;hwndClient
		push eax
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call dword ptr ds:[<&DefFrameProcA>]
		jmp mdidemo.401655

	pop edi
	pop esi
	pop ebx

	leave 
	ret 10



;======================================================
;BOOL CALLBACK CloseEnumProc (HWND hwnd, LPARAM lParam)
;======================================================
	push ebp
	mov ebp,esp
	
	push ebx
	push esi
	push edi

	;if (GetWindow (hwnd, GW_OWNER)) // Check for icon title
		push 4 ;GW_OWNER
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call dword ptr ds:[<&GetWindow>]
		test eax,eax
		je mdidemo.401680
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4

	;SendMessage (GetParent (hwnd), WM_MDIRESTORE, (WPARAM) hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;(WPARAM) hwnd
		push eax
		push 223h ;WM_MDIRESTORE
		mov eax,dword ptr ss:[ebp+8] ;GetParent (hwnd)
		push eax
		call dword ptr ds:[<&GetParent>]
		push eax
		call dword ptr ds:[<&SendMessageA>]
	;if (!SendMessage (hwnd, WM_QUERYENDSESSION, 0, 0))
		push 0
		push 0
		push 11h ;WM_QUERYENDSESSION
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call dword ptr ds:[<&SendMessageA>]
		test eax,eax
		jne mdidemo.4016BE
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4

	;SendMessage (GetParent (hwnd), WM_MDIDESTROY, (WPARAM) hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;(WPARAM) hwnd
		push eax
		push 221h ;WM_MDIDESTROY
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call dword ptr ds:[<&GetParent>]
		push eax
		call dword ptr ds:[<&SendMessageA>]
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4
	
	pop edi
	pop esi
	pop ebx

	leave 
	ret 8



;====================================================
;LRESULT CALLBACK HelloWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
	push ebp
	mov ebp,esp
;static COLORREF clrTextArray[] = 
;{RGB (0, 0, 0), RGB (255, 0, 0), RGB (0, 255, 0), RGB (0, 0, 255), RGB (255, 255, 255)} ;
;static HWND hwndClient, hwndFrame ;
;HDC hdc ;
;HMENU hMenu ;
;LPHELLODATA lpHelloData ;
;PAINTSTRUCT ps ;
;RECT rect ;
	sub esp,64h

	push ebx
	push esi
	push edi

;switch (iMsg)
	mov eax,dword ptr ss:[ebp+0Ch]
	mov dword ptr ss:[ebp-60h],eax
	jmp mdidemo.40194E

	;case WM_CREATE : // Allocate memory for window private data
		;lpHelloData = (LPHELLODATA) HeapAlloc
		;(GetProcessHeap (),HEAP_ZERO_MEMORY,sizeof (HELLODATA)) ;
			push 8 ;sizeof (HELLODATA)
			push 8 ;HEAP_ZERO_MEMORY
			call dword ptr ds:[<&GetProcessHeap>]
			push eax
			call dword ptr ds:[<&RtlAllocateHeap>]
			mov dword ptr ss:[ebp-58h],eax ;lpHelloData
		;lpHelloData->iColor  = IDM_BLACK ;
			mov eax,dword ptr ss:[ebp-58h]
			mov dword ptr ds:[eax],14h ;lpHelloData+0
		;lpHelloData->clrText = RGB (0, 0, 0) ;
			mov eax,dword ptr ss:[ebp-58h]
			mov dword ptr ds:[eax+4],0 ;lpHelloData+4
		;SetWindowLong (hwnd, 0, (long) lpHelloData) ;
			mov eax,dword ptr ss:[ebp-58h] ;(long) lpHelloData
			push eax
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&SetWindowLongA>]
		;// Save some window handles
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&GetParent>]
			mov dword ptr ds:[405EA0],eax
			mov eax,dword ptr ds:[405EA0]
			push eax
			call dword ptr ds:[<&GetParent>]
			mov dword ptr ds:[405EB4],eax
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0

	;case WM_COMMAND :
			mov eax,dword ptr ss:[ebp+10h]
			mov dword ptr ss:[ebp-64h],eax
			jmp mdidemo.4017D5

		;switch (wParam)
			;case IDM_BLACK :
			;case IDM_RED :
			;case IDM_GREEN :
			;case IDM_BLUE :
			;case IDM_WHITE :
			;// Change the text color
				;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
					push 0
					mov eax,dword ptr ss:[ebp+8] ;hwnd
					push eax
					call dword ptr ds:[<&GetWindowLongA>]
					mov dword ptr ss:[ebp-58h],eax ;lpHelloData
				;hMenu = GetMenu (hwndFrame) ;
					mov eax,dword ptr ds:[405EB4]
					push eax
					call dword ptr ds:[<&GetMenu>]
					mov dword ptr ss:[ebp-5Ch],eax ;hMenu
				;CheckMenuItem (hMenu, lpHelloData->iColor, MF_UNCHECKED) ;
					push 0 ;MF_UNCHECKED
					mov eax,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
					mov eax,dword ptr ds:[eax]
					push eax
					mov eax,dword ptr ss:[ebp-5Ch] ;hMenu
					push eax
					call dword ptr ds:[<&CheckMenuItem>]
				;lpHelloData->iColor = wParam ;
					mov eax,dword ptr ss:[ebp+10h] ;wParam
					mov ecx,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
					mov dword ptr ds:[ecx],eax
				;CheckMenuItem (hMenu, lpHelloData->iColor, MF_CHECKED) ;
					push 8 ;MF_CHECKED
					mov eax,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
					mov eax,dword ptr ds:[eax]
					push eax
					mov eax,dword ptr ss:[ebp-5Ch] ;hMenu
					push eax
					call dword ptr ds:[<&CheckMenuItem>]
				;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK] ;
					mov eax,dword ptr ss:[ebp+10h]
					mov eax,dword ptr ds:[eax*4+405010h]
					mov ecx,dword ptr ss:[ebp-58h]
					mov dword ptr ds:[ecx+4],eax
				;InvalidateRect (hwnd, NULL, FALSE) ;
					push 0
					push 0
					mov eax,dword ptr ss:[ebp+8]
					push eax
					call dword ptr ds:[<&InvalidateRect>]

			jmp mdidemo.4017EE

			cmp dword ptr ss:[ebp-64h],14h
				jb mdidemo.4017EE
			cmp dword ptr ss:[ebp-64h],18h
				jbe mdidemo.401768
			jmp mdidemo.4017EE

			;return 0 ;
				xor eax,eax
				jmp mdidemo.4019D0

	;case WM_PAINT : // Paint the window
		;hdc = BeginPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-50h] ;&ps
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&BeginPaint>]
			mov dword ptr ss:[ebp-54h],eax ;hdc
		;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetWindowLongA>]
			mov dword ptr ss:[ebp-58h],eax ;lpHelloData
		;SetTextColor (hdc, lpHelloData->clrText) ;
			mov eax,dword ptr ss:[ebp-58h] ;lpHelloData
			mov eax,dword ptr ds:[eax+4] ;lpHelloData->clrText
			push eax
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call dword ptr ds:[<&SetTextColor>]
		;GetClientRect (hwnd, &rect) ;
			lea eax,dword ptr ss:[ebp-10h] ;&rect
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetClientRect>]
		;DrawText (hdc, "Hello, World!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER) ;
			push 25h ;DT_SINGLELINE | DT_CENTER | DT_VCENTER
			lea eax,dword ptr ss:[ebp-10h] ;&rect
			push eax
			push 0FFFFFFFFh ;-1
			push mdidemo.4050DC ;szHello
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call dword ptr ds:[<&DrawTextA>]
		;EndPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-50h] ;&ps
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&EndPaint>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0

	;case WM_MDIACTIVATE :
		;// Set the Hello menu if gaining focus
			;if (lParam == (LPARAM) hwnd)
				mov eax,dword ptr ss:[ebp+14h]
				cmp dword ptr ss:[ebp+8],eax
				jne mdidemo.401889
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuHello, (LPARAM) hMenuHelloWindow) ;
				mov eax,dword ptr ds:[405EA4] ;(LPARAM) hMenuHelloWindow
				push eax
				mov eax,dword ptr ds:[405EB8] ;(WPARAM) hMenuHello
				push eax
				push 230h ;WM_MDISETMENU
				mov eax,dword ptr ds:[405EA0] ;hwndClient
				push eax
				call dword ptr ds:[<&SendMessageA>]
			;// Check or uncheck menu item
			;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
				push 0
				mov eax,dword ptr ss:[ebp+8] ;hwnd
				push eax
				call dword ptr ds:[<&GetWindowLongA>]
				mov dword ptr ss:[ebp-58h],eax ;lpHelloData
			;CheckMenuItem (hMenuHello, lpHelloData->iColor,
			;(lParam == (LPARAM) hwnd) ? MF_CHECKED : MF_UNCHECKED) ;
				mov eax,dword ptr ss:[ebp+8]
				sub eax,dword ptr ss:[ebp+14h]
				cmp eax,1
				sbb eax,eax
				and eax,8
				push eax
				mov eax,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
				mov eax,dword ptr ds:[eax]
				push eax
				mov eax,dword ptr ds:[405EB8] ;hMenuHello
				push eax
				call dword ptr ds:[<&CheckMenuItem>]
		;// Set the Init menu if losing focus
	               ;if (lParam != (LPARAM) hwnd)
				mov eax,dword ptr ss:[ebp+14h]
				cmp dword ptr ss:[ebp+8],eax
				je mdidemo.4018E2
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuInit, (LPARAM) hMenuInitWindow) ;
				mov eax,dword ptr ds:[405EB0] ;(LPARAM) hMenuInitWindow
				push eax
				mov eax,dword ptr ds:[405EAC] ;(WPARAM) hMenuInit
				push eax
				push 230h ;WM_MDISETMENU
				mov eax,dword ptr ds:[405EA0] ;hwndClient
				push eax
				call dword ptr ds:[<&SendMessageA>]
			;DrawMenuBar (hwndFrame) ;
				mov eax,dword ptr ds:[405EB4] ;hwndFrame
				push eax
				call dword ptr ds:[<&DrawMenuBar>]
			;return 0 ;
				xor eax,eax
				jmp mdidemo.4019D0

	;case WM_QUERYENDSESSION :
	;case WM_CLOSE :
		;if (IDOK !=
		;MessageBox (hwnd, "OK to close window?", "Hello", MB_ICONQUESTION | MB_OKCANCEL))
			push 21h ;MB_ICONQUESTION | MB_OKCANCEL
			push mdidemo.4050EC ;szHello
			push mdidemo.4050F4 ;szClosePrompt
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&MessageBoxA>]
			cmp eax,1 ;IDOK
			je mdidemo.40191B
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0
		;break ;   // I.e., call DefMDIChildProc
			jmp mdidemo.4019B5

	;case WM_DESTROY :
		;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetWindowLongA>]
			mov dword ptr ss:[ebp-58h],eax ;lpHelloData
		;HeapFree (GetProcessHeap (), 0, lpHelloData) ;
			mov eax,dword ptr ss:[ebp-58h] ;lpHelloData
			push eax
			push 0
			call dword ptr ds:[<&GetProcessHeap>]
			push eax
			call dword ptr ds:[<&HeapFree>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0
;????????????????????????????????????
	jmp mdidemo.4019B5

;????????????????????????????????????
;????????????????????????????????????
;????????????????????????????????????
	cmp dword ptr ss:[ebp-60h],0Fh
		ja mdidemo.401977
		je mdidemo.4017F5
	cmp dword ptr ss:[ebp-60h],1 ;WM_CREATE
		je mdidemo.4016FF
	cmp dword ptr ss:[ebp-60h],2 ;WM_DESTROY
		je mdidemo.401920
		jmp mdidemo.4019B5
	cmp dword ptr ss:[ebp-60h],111h
		ja mdidemo.4019A3
		je mdidemo.40175D
	cmp dword ptr ss:[ebp-60h],10h
		jb mdidemo.4019B5
	cmp dword ptr ss:[ebp-60h],11h
		jbe mdidemo.4018F5
		jmp mdidemo.4019B5
	cmp dword ptr ss:[ebp-60h],222h
		je mdidemo.401860

	jmp mdidemo.4019B5
;????????????????????????????????????
;????????????????????????????????????
;????????????????????????????????????

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
	mov eax,dword ptr ss:[ebp+14h]
	push eax
	mov eax,dword ptr ss:[ebp+10h]
	push eax
	mov eax,dword ptr ss:[ebp+0Ch]
	push eax
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&DefMDIChildProcA>]
	jmp mdidemo.4019D0

	pop edi
	pop esi
	pop ebx

	leave 
	ret 10



;====================================================
;LRESULT CALLBACK RectWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
	push ebp
	mov ebp,esp
;static HWND hwndClient, hwndFrame ;
;HBRUSH hBrush ;
;HDC hdc ;
;LPRECTDATA lpRectData ;
;PAINTSTRUCT ps ;
;int xLeft, xRight, yTop, yBottom ;
;short nRed, nGreen, nBlue ;
	sub esp,6Ch
	push ebx
	push esi
	push edi

;switch (iMsg)
	mov eax,dword ptr ss:[ebp+0Ch]
	mov dword ptr ss:[ebp-6Ch],eax
	jmp mdidemo.401C78

	;case WM_CREATE :
		;// Allocate memory for window private data
		;lpRectData = (LPRECTDATA) HeapAlloc
		;(GetProcessHeap (), HEAP_ZERO_MEMORY, sizeof (RECTDATA)) ;
			push 4 ;sizeof (RECTDATA)
			push 8 ;HEAP_ZERO_MEMORY
			call dword ptr ds:[<&GetProcessHeap>]
			push eax
			call dword ptr ds:[<&RtlAllocateHeap>]
			mov dword ptr ss:[ebp-48h],eax ;lpRectData
		;SetWindowLong (hwnd, 0, (long) lpRectData) ;
			mov eax,dword ptr ss:[ebp-48h]
			push eax
			push 0
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&SetWindowLongA>]
		;// Start the timer going
		;SetTimer (hwnd, 1, 250, NULL) ;
			push 0
			push 0FAh ;250
			push 1
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&SetTimer>]
		;// Save some window handles
		;hwndClient = GetParent (hwnd) ;
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetParent>]
			mov dword ptr ds:[405E9C],eax ;hwndClient
		;hwndFrame  = GetParent (hwndClient) ;
			mov eax,dword ptr ds:[405E9C] ;hwndClient
			push eax
			call dword ptr ds:[<&GetParent>]
			mov dword ptr ds:[405E98],eax ;hwndFrame
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5

	;case WM_SIZE : // If not minimized, save the window size
		;if (wParam != SIZE_MINIMIZED)
			cmp dword ptr ss:[ebp+10h],1
			je mdidemo.401A7D
			;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
				push 0
				mov eax,dword ptr ss:[ebp+8] ;hwnd
				push eax
				call dword ptr ds:[<&GetWindowLongA>]
				mov dword ptr ss:[ebp-48h],eax ;lpRectData
			;lpRectData->cxClient = LOWORD (lParam) ;
				mov dword ptr ss:[ebp-48h],eax
				mov eax,dword ptr ss:[ebp+14h] ;lParam
				mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
				mov word ptr ds:[ecx],ax ;lpRectData->cxClient
			;lpRectData->cyClient = HIWORD (lParam) ;
				mov eax,dword ptr ss:[ebp+14h] ;lParam
				shr eax,10h
				and eax,0FFFFh
				mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
				mov word ptr ds:[ecx+2],ax ;lpRectData->cyClient
				jmp mdidemo.401CCA
		;break ; // WM_SIZE must be processed by DefMDIChildProc

	;case WM_TIMER : // Display a random rectangle
		;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetWindowLongA>]
			mov dword ptr ss:[ebp-48],eax ;lpRectData
		;xLeft = rand () % lpRectData->cxClient ;
			call mdidemo.401CF0
			mov ecx,dword ptr ss:[ebp-48]
			movsx ecx,word ptr ds:[ecx]
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-64],edx
		;xRight = rand () % lpRectData->cxClient ;
			call mdidemo.401CF0
			mov ecx,dword ptr ss:[ebp-48]
			movsx ecx,word ptr ds:[ecx]
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-50],edx
		;yTop = rand () % lpRectData->cyClient ;
			call mdidemo.401CF0
			mov ecx,dword ptr ss:[ebp-48]
			movsx ecx,word ptr ds:[ecx+2]
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-68],edx
		;yBottom = rand () % lpRectData->cyClient ;
			call mdidemo.401CF0
			mov ecx,dword ptr ss:[ebp-48]
			movsx ecx,word ptr ds:[ecx+2]
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-44],edx
		;nRed = rand () & 255 ;
			call mdidemo.401CF0
			and eax,FF
			mov word ptr ss:[ebp-58],ax
		;nGreen = rand () & 255 ;
			call mdidemo.401CF0
			and eax,FF
			mov word ptr ss:[ebp-4C],ax
		;nBlue = rand () & 255 ;
			call mdidemo.401CF0
			and eax,FF
			mov word ptr ss:[ebp-60],ax
		;hdc = GetDC (hwnd) ;
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&GetDC>]
		;hBrush = CreateSolidBrush (RGB (nRed, nGreen, nBlue)) ;
			mov dword ptr ss:[ebp-54],eax
			xor eax,eax
			mov al,byte ptr ss:[ebp-4C]
			shl eax,8
			xor ecx,ecx
			mov cl,byte ptr ss:[ebp-58]
			or eax,ecx
			xor ecx,ecx
			mov cl,byte ptr ss:[ebp-60]
			shl ecx,10
			or eax,ecx
			push eax
			call dword ptr ds:[<&CreateSolidBrush>]
			mov dword ptr ss:[ebp-5C],eax
		;SelectObject (hdc, hBrush) ;
			mov eax,dword ptr ss:[ebp-5C] ;hBrush
			push eax
			mov eax,dword ptr ss:[ebp-54] ;hdc
			push eax
			call dword ptr ds:[<&SelectObject>]
		;Rectangle (hdc,
		;min (xLeft, xRight), min (yTop, yBottom), max (xLeft, xRight), max (yTop, yBottom)) ;
			mov eax,dword ptr ss:[ebp-68]
			mov ecx,dword ptr ss:[ebp-44]
			cmp eax,ecx
			jg mdidemo.401B4F
			mov eax,ecx
			push eax
			mov eax,dword ptr ss:[ebp-50]
			mov ecx,dword ptr ss:[ebp-64]
			cmp eax,ecx
			jg mdidemo.401B60
			mov eax,ecx
			push eax
			mov eax,dword ptr ss:[ebp-68]
			mov ecx,dword ptr ss:[ebp-44]
			cmp eax,ecx
			jl mdidemo.401B71
			mov eax,ecx
			push eax
			mov eax,dword ptr ss:[ebp-50]
			mov ecx,dword ptr ss:[ebp-64]
			cmp eax,ecx
			jl mdidemo.401B82
			mov eax,ecx
			push eax
			mov eax,dword ptr ss:[ebp-54]
			push eax
			call dword ptr ds:[<&Rectangle>]
		;ReleaseDC (hwnd, hdc) ;
			mov eax,dword ptr ss:[ebp-54] ;hdc
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call dword ptr ds:[<&ReleaseDC>]
		;DeleteObject (hBrush) ;
			mov eax,dword ptr ss:[ebp-5C] ;hBrush
			push eax
			call dword ptr ds:[<&DeleteObject>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5
	;case WM_PAINT :           // Clear the window
		;InvalidateRect (hwnd, NULL, TRUE) ;
			push 1
			push 0
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&InvalidateRect>]
		;hdc = BeginPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-40]
			push eax
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&BeginPaint>]
		;EndPaint (hwnd, &ps) ;
			mov dword ptr ss:[ebp-54],eax
			lea eax,dword ptr ss:[ebp-40]
			push eax
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call dword ptr ds:[<&EndPaint>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5

	;case WM_MDIACTIVATE : // Set the appropriate menu
		;if (lParam == (LPARAM) hwnd)
			mov eax,dword ptr ss:[ebp+8]
			cmp dword ptr ss:[ebp+14],eax
			jne mdidemo.401C0E
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuRect, (LPARAM) hMenuRectWindow) ;
				mov eax,dword ptr ds:[405EA8]
				push eax
				mov eax,dword ptr ds:[405E94]
				push eax
				push 230
				mov eax,dword ptr ds:[405E9C]
				push eax
				call dword ptr ds:[<&SendMessageA>]
				jmp mdidemo.401C2B
		;else
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuInit,
			;(LPARAM) hMenuInitWindow) ;
				mov eax,dword ptr ds:[405EB0]
				push eax
				mov eax,dword ptr ds:[405EAC]
				push eax
				push 230
				mov eax,dword ptr ds:[405E9C]
				push eax
				call dword ptr ds:[<&SendMessageA>]
		;DrawMenuBar (hwndFrame) ;
			mov eax,dword ptr ds:[405E98]
			push eax
			call dword ptr ds:[<&DrawMenuBar>]
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5

;case WM_DESTROY :
	;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call dword ptr ds:[<&GetWindowLongA>]
		mov dword ptr ss:[ebp-48],eax
		mov eax,dword ptr ss:[ebp-48]
		push eax
		push 0
		call dword ptr ds:[<&GetProcessHeap>]
		push eax
		call dword ptr ds:[<&HeapFree>]
		push 1
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call dword ptr ds:[<&KillTimer>]
		xor eax,eax
		jmp mdidemo.401CE5

jmp mdidemo.401CCA

cmp dword ptr ss:[ebp-6C],0Fh
ja mdidemo.401CAB
je mdidemo.401BAC
cmp dword ptr ss:[ebp-6C],1
je mdidemo.4019EB
cmp dword ptr ss:[ebp-6C],2
je mdidemo.401C3E
cmp dword ptr ss:[ebp-6C],5
je mdidemo.401A49
jmp mdidemo.401CCA
cmp dword ptr ss:[ebp-6C],113h
je mdidemo.401A82
cmp dword ptr ss:[ebp-6C],222h
je mdidemo.401BE0
jmp mdidemo.401CCA

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
	mov eax,dword ptr ss:[ebp+14]
	push eax
	mov eax,dword ptr ss:[ebp+10]
	push eax
	mov eax,dword ptr ss:[ebp+C]
	push eax
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&DefMDIChildProcA>]

jmp mdidemo.401CE5
pop edi
pop esi
pop ebx
leave 
ret 10