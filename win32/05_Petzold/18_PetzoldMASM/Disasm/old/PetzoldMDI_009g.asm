;============================================================================
;int WINAPI WinMain
;(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;============================================================================
;mdidemo.401000:
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
	mov dword ptr ds:[405E90h],eax ;hInst
;if (!hPrevInstance)
	cmp dword ptr ss:[ebp+0Ch],0
	jne mdidemo.40118B ;Skip RegisterClass, Jump to LoadMenu

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
	call LoadIconA
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h
	push 0
	call LoadCursorA
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) (COLOR_APPWORKSPACE + 1) ;
	mov dword ptr ss:[ebp-14h],0Dh
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szFrameClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405030
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call LoadIconA
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h]
	push eax
	call RegisterClassExA

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
	push 7F00h ;IDI_APPLICATION
	push 0
	call LoadIconA
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h ;IDC_ARROW
	push 0
	call LoadCursorA
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	push 0
	call GetStockObject
	mov dword ptr ss:[ebp-14h],eax
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szHelloClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405040
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h ;IDI_APPLICATION
	push 0
	call LoadIconA
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h] ;&wndclass
	push eax
	call RegisterClassExA

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
	call LoadIconA
	mov dword ptr ss:[ebp-1Ch],eax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	push 7F00h
	push 0
	call LoadCursorA
	mov dword ptr ss:[ebp-18h],eax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	push 0
	call GetStockObject
	mov dword ptr ss:[ebp-14h],eax
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10h],0
;wndclass.lpszClassName = szRectClass ;
	mov dword ptr ss:[ebp-0Ch],mdidemo.405050
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00
	push 0
	call LoadIconA
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34h]
	push eax
	call RegisterClassExA

;// Obtain handles to three possible menus & submenus
mdidemo.40118B:
;hMenuInit  = LoadMenu (hInst, "MdiMenuInit") ;
	push mdidemo.405074 ;szMdiMenuInit
	mov eax,dword ptr ds:[405E90] ;hInst
	push eax
	call LoadMenuA
	mov dword ptr ds:[405EAC],eax ;hMenuInit
;hMenuHello = LoadMenu (hInst, "MdiMenuHello") ;
	push mdidemo.405080 ;szMdiMenuHello
	mov eax,dword ptr ds:[405E90] ;hInst
	push eax
	call LoadMenuA
	mov dword ptr ds:[405EB8],eax ;hMenuHello
;hMenuRect = LoadMenu (hInst, "MdiMenuRect") ;
	push mdidemo.405090 ;szMdiMenuRect
	mov eax,dword ptr ds:[405E90]
	push eax
	call LoadMenuA
	mov dword ptr ds:[405E94],eax ;hMenuRect
;hMenuInitWindow = GetSubMenu (hMenuInit, INIT_MENU_POS) ;
	push 0 ;INIT_MENU_POS
	mov eax,dword ptr ds:[405EAC] ;hMenuInit
	push eax
	call GetSubMenu
	mov dword ptr ds:[405EB0],eax ;hMenuInitWindow
;hMenuHelloWindow = GetSubMenu (hMenuHello, HELLO_MENU_POS) ;
	push 2 ;HELLO_MENU_POS
	mov eax,dword ptr ds:[405EB8] ;hMenuHello
	push eax
	call GetSubMenu
	mov dword ptr ds:[405EA4],eax ;hMenuHelloWindow
;hMenuRectWindow = GetSubMenu (hMenuRect, RECT_MENU_POS) ;
	push 1 ;RECT_MENU_POS
	mov eax,dword ptr ds:[405E94] ;hMenuRect
	push eax
	call GetSubMenu
	mov dword ptr ds:[405EA8],eax ;hMenuRectWindow

;// Load accelerator table
;hAccel = LoadAccelerators (hInst, "MdiAccel") ;
	push mdidemo.40509C ;szMdiAccel
	mov eax,dword ptr ds:[405E90] ;hInst
	push eax
	call LoadAcceleratorsA
	mov dword ptr ss:[ebp-4],eax ;hAccel

;// Create the frame window
;hwndFrame = CreateWindow (szFrameClass, "MDI Demonstration",
	;WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN,
	;CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
	;NULL, hMenuInit, hInstance, NULL) ;
	push 0
	mov eax,dword ptr ss:[ebp+8] ;hInstance
	push eax
	mov eax,dword ptr ds:[405EAC] ;hMenuInit
	push eax
	push 0
	push 80000000h
	push 80000000h
	push 80000000h
	push 80000000h
	push 2CF0000h
	push mdidemo.4050A8 ;"MDI Demonstration"
	push mdidemo.405030 ;szFrameClass
	push 0
	call CreateWindowExA
	mov dword ptr ss:[ebp-58h],eax ;hwndFrame

;hwndClient = GetWindow (hwndFrame, GW_CHILD) ;
	push 5
	mov eax,dword ptr ss:[ebp-58h] ;hwndFrame
	push eax
	call GetWindow
	mov dword ptr ss:[ebp-54h],eax
	mov eax,dword ptr ss:[ebp+14h] ;hwndClient
	push eax
	mov eax,dword ptr ss:[ebp-58h] ;hwndFrame
	push eax
	call ShowWindow
	mov eax,dword ptr ss:[ebp-58h] ;hwndFrame
	push eax
	call UpdateWindow

;// Enter the modified message loop
;mdidemo.40127D:
	push 0
	push 0
	push 0
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call GetMessageA
	test eax,eax
		je mdidemo.4012DE ;CleanUp
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-54h] ;hwndClient
	push eax
	call TranslateMDISysAccel
	test eax,eax
		jne mdidemo.4012D9 ;MsgLoop
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-4] ;hAccel
	push eax
	mov eax,dword ptr ss:[ebp-58h] ;hwndFrame
	push eax
	call TranslateAccelerator
	test eax,eax
		jne mdidemo.4012D9 ;MsgLoop
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call TranslateMessage
	lea eax,dword ptr ss:[ebp-50h] ;&msg
	push eax
	call DispatchMessageA
mdidemo.4012D9:
		jmp mdidemo.40127D ;MsgLoop

;// Clean up by deleting unattached menus
mdidemo.4012DE:
	mov eax,dword ptr ds:[405EB8h] ;hMenuHello
	push eax
	call DestroyMenu
	mov eax,dword ptr ds:[405E94h] ;hMenuRect
	push eax
	call DestroyMenu

;return msg.wParam ;
	mov eax,dword ptr ss:[ebp-48h] ;msg.wParam
	jmp mdidemo.4012FE

mdidemo.4012FE:
	pop edi
	pop esi
	pop ebx

	leave 
	ret 10h


;====================================================
;LRESULT CALLBACK FrameWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
;mdidemo.401305:
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
	jmp mdidemo.4015F5 ;Large Switch

;case WM_CREATE : // Create the client window
mdidemo.401319: ;Create
	;clientcreate.hWindowMenu = hMenuInitWindow ;
		mov eax,dword ptr ds:[405EB0h]
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
		call CreateWindowExA
		mov dword ptr ds:[405EBCh],eax ;hwndClient
	;return 0 ;
		xor eax,eax
		jmp mdidemo.401655 ;End Proc

;case WM_COMMAND :
mdidemo.401360: ;Command
	;switch (wParam)
		mov eax,dword ptr ss:[ebp+10h]
		mov dword ptr ss:[ebp-38h],eax
		jmp mdidemo.40154B ;Small Switch

	;case IDM_NEWHELLO : // Create a Hello child window
	mdidemo.40136B:
		;mdicreate.szClass = szHelloClass ;
			mov dword ptr ss:[ebp-30h],mdidemo.405040 ;szHelloClass
		;mdicreate.szTitle = "Hello" ;
			mov dword ptr ss:[ebp-2Ch],mdidemo.4050C8 ;szHello
		;mdicreate.hOwner = hInst ;
			mov eax,dword ptr ds:[405E90h]
			mov dword ptr ss:[ebp-28h],eax
		;mdicreate.x = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-24h],80000000h
		;mdicreate.y = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-20h],80000000h
		;mdicreate.cx = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-1Ch],80000000h
		;mdicreate.cy = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-18h],80000000h
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
			mov eax,dword ptr ds:[405EBCh] ;hwndClient
			push eax
			call SendMessageA
			mov dword ptr ss:[ebp-4],eax ;hwndChild
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;case IDM_NEWRECT : // Create a Rect child window
	mdidemo.4013CC:
		;mdicreate.szClass = szRectClass ;
			mov dword ptr ss:[ebp-30h],mdidemo.405050 ;szRectClass
		;mdicreate.szTitle = "Rectangles" ;
			mov dword ptr ss:[ebp-2Ch],mdidemo.4050D0 ;szRect
		;mdicreate.hOwner = hInst ;
			mov eax,dword ptr ds:[405E90h]
			mov dword ptr ss:[ebp-28h],eax
		;mdicreate.x = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-24h],80000000h
		;mdicreate.y = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-20h],80000000h
		;mdicreate.cx = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-1Ch],80000000h
		;mdicreate.cy = CW_USEDEFAULT ;
			mov dword ptr ss:[ebp-18h],80000000h
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
			mov eax,dword ptr ds:[405EBCh] ;hwndClient
			push eax
			call SendMessageA
			mov dword ptr ss:[ebp-4],eax ;hwndChild
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;case IDM_CLOSE : // Close the active window
	mdidemo.40142D:
		;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
			push 0
			push 0
			push 229h ;WM_MDIGETACTIVE
			mov eax,dword ptr ds:[405EBCh] ;hwndClient
			push eax
			call SendMessageA
			mov dword ptr ss:[ebp-4],eax ;hwndChild
		;if (SendMessage (hwndChild, WM_QUERYENDSESSION, 0, 0))
				push 0
				push 0
				push 11h ;WM_QUERYENDSESSION
				mov eax,dword ptr ss:[ebp-4] ;hwndChild
				push eax
				call SendMessageA
				test eax,eax
				je mdidemo.401474
			;SendMessage (hwndClient, WM_MDIDESTROY, (WPARAM) hwndChild, 0) ;
				push 0
				mov eax,dword ptr ss:[ebp-4] ;(WPARAM) hwndChild
				push eax
				push 221h ;WM_MDIDESTROY
				mov eax,dword ptr ds:[405EBCh] ;hwndClient
				push eax
				call SendMessageA
		;return 0 ;
		mdidemo.401474:
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;case IDM_EXIT : // Exit the program
	mdidemo.40147B:
		;SendMessage (hwnd, WM_CLOSE, 0, 0) ;
			push 0
			push 0
			push 10h ;WM_CLOSE
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call SendMessageA
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;// messages for arranging windows
	;case IDM_TILE :
	mdidemo.401492:
		;SendMessage (hwndClient, WM_MDITILE, 0, 0) ;
			push 0
			push 0
			push 226h ;WM_MDITILE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call SendMessageA
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc
	;case IDM_CASCADE :
	mdidemo.4014AE:
		;SendMessage (hwndClient, WM_MDICASCADE, 0, 0) ;
			push 0
			push 0
			push 227h ;WM_MDICASCADE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call SendMessageA
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;case IDM_ARRANGE :
	mdidemo.4014CA:
		;SendMessage (hwndClient, WM_MDIICONARRANGE, 0, 0) ;
			push 0
			push 0
			push 228h ;WM_MDIICONARRANGE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call SendMessageA
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc
	;case IDM_CLOSEALL : // Attempt to close all children
	mdidemo.4014E6:
		;EnumChildWindows (hwndClient, &CloseEnumProc, 0) ;
			push 0
			push mdidemo.40165C ;&CloseEnumProc
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call EnumChildWindows
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	;default : // Pass to active child...
	mdidemo.401500: ;Default
		;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
			push 0
			push 0
			push 229h ;WM_MDIGETACTIVE
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call SendMessageA
 		;if (IsWindow (hwndChild)) SendMessage (hwndChild, WM_COMMAND, wParam, lParam) ;
			mov dword ptr ss:[ebp-4],eax
			mov eax,dword ptr ss:[ebp-4]
			push eax
			call IsWindow
			test eax,eax
			je mdidemo.401541 ;Break
		;SendMessage (hwndChild, WM_COMMAND, wParam, lParam) ;
			mov eax,dword ptr ss:[ebp+14h] ;lParam
			push eax
			mov eax,dword ptr ss:[ebp+10h] ;wParam
			push eax
			push 111h ;WM_COMMAND
			mov eax,dword ptr ss:[ebp-4] ;hwndChild
			push eax
			call SendMessageA

		mdidemo.401541: ;Break
			jmp mdidemo.4015A7 ;Default

		;break ; // ...and then to DefFrameProc
			jmp mdidemo.4015A7 ;Default

	mdidemo.40154B: ;Small Switch
			sub dword ptr ss:[ebp-38],0Ah ;WTF???
			cmp dword ptr ss:[ebp-38],17h ;WTF???
			ja mdidemo.401500 ;Default
	mdidemo.401559: ;Calculating Jump Address
			mov eax,dword ptr ss:[ebp-38h]
			xor ecx,ecx
			mov cl,byte ptr ds:[eax+40158Fh] ;WTF???
			jmp dword ptr ds:[ecx*4+40156Bh] ;WTF???

	;????????????????????????????????????????????????
	mdidemo.40156B:
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
	;????????????????????????????????????????????????

	mdidemo.4015A7: ;Default
			jmp mdidemo.401634 ;Default

	;case WM_QUERYENDSESSION :

	;case WM_CLOSE : // Attempt to close all children
	mdidemo.4015AC: ;Close
		;SendMessage (hwnd, WM_COMMAND, IDM_CLOSEALL, 0) ;
			push 0
			push 21h ;IDM_CLOSEALL
			push 111h ;WM_COMMAND
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call SendMessageA
		;if (NULL != GetWindow (hwndClient, GW_CHILD))
			push 5 ;GW_CHILD
			mov eax,dword ptr ds:[405EBC] ;hwndClient
			push eax
			call GetWindow
			test eax,eax
			je mdidemo.4015DC ;Break
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc
		;break ; // I.e., call DefFrameProc
		je mdidemo.4015DC:
			jmp mdidemo.401634 ;Default

	;case WM_DESTROY :
	mdidemo.4015E1: ;Destroy
		;PostQuitMessage (0) ;
			push 0
			call PostQuitMessage
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401655 ;End Proc

	jmp mdidemo.401634 ;Default

mdidemo.4015F5: ;Large Switch
	cmp dword ptr ss:[ebp-34h],11h ;WM_QUERYENDSESSION
		ja mdidemo.401622 ;Command
	cmp dword ptr ss:[ebp-34h],10h ;WM_CLOSE
		jae mdidemo.4015AC ;Close if 11h or 10h
	cmp dword ptr ss:[ebp-34h],1 ;WM_CREATE
		je mdidemo.401319 ;Create
	cmp dword ptr ss:[ebp-34h],2 ;WM_DESTROY
		je mdidemo.4015E1 ;Destroy
	jmp mdidemo.401634
mdidemo.401622: ;Command
	cmp dword ptr ss:[ebp-34h],111h ;WM_COMMAND
		je mdidemo.401360 ;Command

	jmp mdidemo.401634 ;Default

	;return DefFrameProc (hwnd, hwndClient, iMsg, wParam, lParam) ;
	mdidemo.401634: ;Default
		mov eax,dword ptr ss:[ebp+14h] ;lParam
		push eax
		mov eax,dword ptr ss:[ebp+10h] ;wParam
		push eax
		mov eax,dword ptr ss:[ebp+0Ch] ;iMsg
		push eax
		mov eax,dword ptr ds:[405EBCh] ;hwndClient
		push eax
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call DefFrameProcA
		jmp mdidemo.401655 ;End Proc

jmp mdidemo.401655: ;End Proc
	pop edi
	pop esi
	pop ebx

	leave 
	ret 10h



;======================================================
;BOOL CALLBACK CloseEnumProc (HWND hwnd, LPARAM lParam)
;======================================================
;mdidemo.40165C
	push ebp
	mov ebp,esp
	
	push ebx
	push esi
	push edi

	;if (GetWindow (hwnd, GW_OWNER)) // Check for icon title
		push 4 ;GW_OWNER
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call GetWindow
		test eax,eax
		je mdidemo.401680 ;Restore
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4 ;End Proc

	mdidemo.401680:
	;SendMessage (GetParent (hwnd), WM_MDIRESTORE, (WPARAM) hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;(WPARAM) hwnd
		push eax
		push 223h ;WM_MDIRESTORE
		mov eax,dword ptr ss:[ebp+8] ;GetParent (hwnd)
		push eax
		call GetParent
		push eax
		call SendMessageA
	;if (!SendMessage (hwnd, WM_QUERYENDSESSION, 0, 0))
		push 0
		push 0
		push 11h ;WM_QUERYENDSESSION
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call SendMessageA
		test eax,eax
		jne mdidemo.4016BE ;Destroy
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4 ;End Proc

	mdidemo.4016BE:
	;SendMessage (GetParent (hwnd), WM_MDIDESTROY, (WPARAM) hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;(WPARAM) hwnd
		push eax
		push 221h ;WM_MDIDESTROY
		mov eax,dword ptr ss:[ebp+8]
		push eax
		call GetParent
		push eax
		call SendMessageA
	;return 1 ;
		mov eax,1
		jmp mdidemo.4016E4 ;End Proc

mdidemo.4016E4: ;End Proc
	pop edi
	pop esi
	pop ebx

	leave 
	ret 8



;====================================================
;LRESULT CALLBACK HelloWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
;mdidemo.4016EB:
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
;mdidemo.4016F4
	mov eax,dword ptr ss:[ebp+0Ch]
	mov dword ptr ss:[ebp-60h],eax
	jmp mdidemo.40194E ;Large Switch

	;case WM_CREATE : // Allocate memory for window private data
	mdidemo.4016FF:
		;lpHelloData = (LPHELLODATA) HeapAlloc
		;(GetProcessHeap (),HEAP_ZERO_MEMORY,sizeof (HELLODATA)) ;
			push 8 ;sizeof (HELLODATA)
			push 8 ;HEAP_ZERO_MEMORY
			call GetProcessHeap
			push eax
			call RtlAllocateHeap
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
			call SetWindowLongA
		;// Save some window handles
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call GetParent
			mov dword ptr ds:[405EA0h],eax
			mov eax,dword ptr ds:[405EA0h]
			push eax
			call GetParent
			mov dword ptr ds:[405EB4],eax
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc

	;case WM_COMMAND :
	mdidemo.40175D:
			mov eax,dword ptr ss:[ebp+10h]
			mov dword ptr ss:[ebp-64h],eax
			jmp mdidemo.4017D5 ;Small Switch

		;switch (wParam)
			;case IDM_BLACK :
			;case IDM_RED :
			;case IDM_GREEN :
			;case IDM_BLUE :
			;case IDM_WHITE :
			;// Change the text color
			mdidemo.401768:
				;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
					push 0
					mov eax,dword ptr ss:[ebp+8] ;hwnd
					push eax
					call GetWindowLongA
					mov dword ptr ss:[ebp-58h],eax ;lpHelloData
				;hMenu = GetMenu (hwndFrame) ;
					mov eax,dword ptr ds:[405EB4h]
					push eax
					call GetMenu
					mov dword ptr ss:[ebp-5Ch],eax ;hMenu
				;CheckMenuItem (hMenu, lpHelloData->iColor, MF_UNCHECKED) ;
					push 0 ;MF_UNCHECKED
					mov eax,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
					mov eax,dword ptr ds:[eax]
					push eax
					mov eax,dword ptr ss:[ebp-5Ch] ;hMenu
					push eax
					call CheckMenuItem
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
					call CheckMenuItem
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
					call InvalidateRect
			mdidemo.4017D0:
				jmp mdidemo.4017EE ;Return 0

		mdidemo.4017D5: ;Small Switch
			cmp dword ptr ss:[ebp-64h],14h
				jb mdidemo.4017EE ;Return 0
			cmp dword ptr ss:[ebp-64h],18h
				jbe mdidemo.401768
			jmp mdidemo.4017EE ;Return 0

		;return 0 ;
		mdidemo.4017EE: ;Return 0
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc

	;case WM_PAINT : // Paint the window
	mdidemo.4017F5:
		;hdc = BeginPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-50h] ;&ps
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call BeginPaint
			mov dword ptr ss:[ebp-54h],eax ;hdc
		;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetWindowLongA
			mov dword ptr ss:[ebp-58h],eax ;lpHelloData
		;SetTextColor (hdc, lpHelloData->clrText) ;
			mov eax,dword ptr ss:[ebp-58h] ;lpHelloData
			mov eax,dword ptr ds:[eax+4] ;lpHelloData->clrText
			push eax
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call SetTextColor
		;GetClientRect (hwnd, &rect) ;
			lea eax,dword ptr ss:[ebp-10h] ;&rect
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetClientRect
		;DrawText (hdc, "Hello, World!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER) ;
			push 25h ;DT_SINGLELINE | DT_CENTER | DT_VCENTER
			lea eax,dword ptr ss:[ebp-10h] ;&rect
			push eax
			push 0FFFFFFFFh ;-1
			push mdidemo.4050DC ;szHello
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call DrawTextA
		;EndPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-50h] ;&ps
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call EndPaint
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc

	;case WM_MDIACTIVATE :
	mdidemo.401860:
		;// Set the Hello menu if gaining focus
			;if (lParam == (LPARAM) hwnd)
				mov eax,dword ptr ss:[ebp+14h]
				cmp dword ptr ss:[ebp+8],eax
				jne mdidemo.401889 ;Check or UnCheck
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuHello, (LPARAM) hMenuHelloWindow) ;
				mov eax,dword ptr ds:[405EA4h] ;(LPARAM) hMenuHelloWindow
				push eax
				mov eax,dword ptr ds:[405EB8h] ;(WPARAM) hMenuHello
				push eax
				push 230h ;WM_MDISETMENU
				mov eax,dword ptr ds:[405EA0h] ;hwndClient
				push eax
				call SendMessageA
			;// Check or uncheck menu item
			mdidemo.401889:
				;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
					push 0
					mov eax,dword ptr ss:[ebp+8] ;hwnd
					push eax
					call GetWindowLongA
					mov dword ptr ss:[ebp-58h],eax ;lpHelloData
				;CheckMenuItem (hMenuHello, lpHelloData->iColor,
				;(lParam == (LPARAM) hwnd) ? MF_CHECKED : MF_UNCHECKED) ;
					mov eax,dword ptr ss:[ebp+8] ;(LPARAM) hwnd
					sub eax,dword ptr ss:[ebp+14h] ;lParam
					cmp eax,1
					sbb eax,eax
					and eax,8
					push eax
					mov eax,dword ptr ss:[ebp-58h] ;lpHelloData->iColor
					mov eax,dword ptr ds:[eax]
					push eax
					mov eax,dword ptr ds:[405EB8h] ;hMenuHello
					push eax
					call CheckMenuItem
		;// Set the Init menu if losing focus
		mdidemo.4018B9:
	               ;if (lParam != (LPARAM) hwnd)
				mov eax,dword ptr ss:[ebp+14h] ;lParam 
				cmp dword ptr ss:[ebp+8],eax ;(LPARAM) hwnd
				je mdidemo.4018E2 ;Draw Menu
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuInit, (LPARAM) hMenuInitWindow) ;
				mov eax,dword ptr ds:[405EB0h] ;(LPARAM) hMenuInitWindow
				push eax
				mov eax,dword ptr ds:[405EACh] ;(WPARAM) hMenuInit
				push eax
				push 230h ;WM_MDISETMENU
				mov eax,dword ptr ds:[405EA0h] ;hwndClient
				push eax
				call SendMessageA
		;DrawMenuBar (hwndFrame) ;
		mdidemo.4018E2:
			mov eax,dword ptr ds:[405EB4h] ;hwndFrame
			push eax
			call DrawMenuBar
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc

	;case WM_QUERYENDSESSION :
	;case WM_CLOSE :
	mdidemo.4018F5:
		;if (IDOK !=
		;MessageBox (hwnd, "OK to close window?", "Hello", MB_ICONQUESTION | MB_OKCANCEL))
			push 21h ;MB_ICONQUESTION | MB_OKCANCEL
			push mdidemo.4050EC ;szHello
			push mdidemo.4050F4 ;szClosePrompt
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call MessageBoxA
			cmp eax,1 ;IDOK
			je mdidemo.40191B ;Default
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc
		;break ;   // I.e., call DefMDIChildProc
		mdidemo.40191B:
			jmp mdidemo.4019B5 ;Default

	;case WM_DESTROY :
	mdidemo.401920:
		;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetWindowLongA
			mov dword ptr ss:[ebp-58h],eax ;lpHelloData
		;HeapFree (GetProcessHeap (), 0, lpHelloData) ;
			mov eax,dword ptr ss:[ebp-58h] ;lpHelloData
			push eax
			push 0
			call GetProcessHeap
			push eax
			call HeapFree
		;return 0 ;
			xor eax,eax
			jmp mdidemo.4019D0 ;End Proc

;????????????????????????????????????
	jmp mdidemo.4019B5

mdidemo.40194E: ;Large Switch
	cmp dword ptr ss:[ebp-60h],0Fh ;WM_PAINT
		ja mdidemo.401977 ;Command
		je mdidemo.4017F5 ;Paint
	cmp dword ptr ss:[ebp-60h],1 ;WM_CREATE
		je mdidemo.4016FF ;Create
	cmp dword ptr ss:[ebp-60h],2 ;WM_DESTROY
		je mdidemo.401920 ;Destroy
		jmp mdidemo.4019B5 ;Default
mdidemo.401977:
	cmp dword ptr ss:[ebp-60h],111h ;WM_COMMAND
		ja mdidemo.4019A3 ;Activate
		je mdidemo.40175D ;Command
	cmp dword ptr ss:[ebp-60h],10h ;WM_CLOSE
		jb mdidemo.4019B5 ;Default
	cmp dword ptr ss:[ebp-60h],11h ;WM_QUERYENDSESSION
		jbe mdidemo.4018F5 ;Paint
		jmp mdidemo.4019B5 ;Default
mdidemo.4019A3:
	cmp dword ptr ss:[ebp-60h],222h ;WM_MDIACTIVATE
		je mdidemo.401860 ;Activate
	jmp mdidemo.4019B5 ;Default

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
mdidemo.4019B5:
	mov eax,dword ptr ss:[ebp+14h] ;lParam
	push eax
	mov eax,dword ptr ss:[ebp+10h] ;wParam
	push eax
	mov eax,dword ptr ss:[ebp+0Ch] ;iMsg
	push eax
	mov eax,dword ptr ss:[ebp+8] ;hwnd
	push eax
	call DefMDIChildProcA
	jmp mdidemo.4019D0 ;End Proc

mdidemo.4019D0: ;End Proc
	pop edi
	pop esi
	pop ebx

	leave 
	ret 10



;====================================================
;LRESULT CALLBACK RectWndProc
;(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;====================================================
;mdidemo.4019D7:
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
mdidemo.4019E0:
	mov eax,dword ptr ss:[ebp+0Ch]
	mov dword ptr ss:[ebp-6Ch],eax
	jmp mdidemo.401C78 ;Large Switch

	;case WM_CREATE :
	mdidemo.4019EB:
		;// Allocate memory for window private data
		;lpRectData = (LPRECTDATA) HeapAlloc
		;(GetProcessHeap (), HEAP_ZERO_MEMORY, sizeof (RECTDATA)) ;
			push 4 ;sizeof (RECTDATA)
			push 8 ;HEAP_ZERO_MEMORY
			call GetProcessHeap
			push eax
			call RtlAllocateHeap
			mov dword ptr ss:[ebp-48h],eax ;lpRectData
		;SetWindowLong (hwnd, 0, (long) lpRectData) ;
			mov eax,dword ptr ss:[ebp-48h]
			push eax
			push 0
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call SetWindowLongA
		;// Start the timer going
		;SetTimer (hwnd, 1, 250, NULL) ;
			push 0
			push 0FAh ;250
			push 1
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call SetTimer
		;// Save some window handles
		;hwndClient = GetParent (hwnd) ;
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetParent
			mov dword ptr ds:[405E9C],eax ;hwndClient
		;hwndFrame = GetParent (hwndClient) ;
			mov eax,dword ptr ds:[405E9C] ;hwndClient
			push eax
			call GetParent
			mov dword ptr ds:[405E98],eax ;hwndFrame
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5 ;End Proc

	;case WM_SIZE : // If not minimized, save the window size
	mdidemo.401A49:
		;if (wParam != SIZE_MINIMIZED)
			cmp dword ptr ss:[ebp+10h],1
			je mdidemo.401A7D
			;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
				push 0
				mov eax,dword ptr ss:[ebp+8] ;hwnd
				push eax
				call GetWindowLongA
				mov dword ptr ss:[ebp-48h],eax ;lpRectData
			;lpRectData->cxClient = LOWORD (lParam) ;
				mov dword ptr ss:[ebp-48h],eax
				mov eax,dword ptr ss:[ebp+14h] ;lParam
				mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
				mov word ptr ds:[ecx],ax ;lpRectData->cxClient
			;lpRectData->cyClient = HIWORD (lParam) ;
				mov eax,dword ptr ss:[ebp+14h] ;lParam
				shr eax,10h ;HIWORD (lParam)
				and eax,0FFFFh
				mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
				mov word ptr ds:[ecx+2],ax ;lpRectData->cyClient
		;break ; // WM_SIZE must be processed by DefMDIChildProc
			jmp mdidemo.401CCA ;Default

	;case WM_TIMER : // Display a random rectangle
	mdidemo.401A82:
		;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
			push 0
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetWindowLongA
			mov dword ptr ss:[ebp-48h],eax ;lpRectData
		;xLeft = rand () % lpRectData->cxClient ;
			call mdidemo.401CF0 ;<--- Random Proc?
			mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
			movsx ecx,word ptr ds:[ecx] ;lpRectData->cxClient
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-64h],edx ;xLeft
		;xRight = rand () % lpRectData->cxClient ;
			call mdidemo.401CF0 ;<--- Random Proc?
			mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
			movsx ecx,word ptr ds:[ecx] ;lpRectData->cxClient
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-50h],edx ;xRight
		;yTop = rand () % lpRectData->cyClient ;
			call mdidemo.401CF0 ;<--- Random Proc?
			mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
			movsx ecx,word ptr ds:[ecx+2] ;lpRectData->cyClient
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-68h],edx ;yTop
		;yBottom = rand () % lpRectData->cyClient ;
			call mdidemo.401CF0 ;<--- Random Proc?
			mov ecx,dword ptr ss:[ebp-48h] ;lpRectData
			movsx ecx,word ptr ds:[ecx+2] ;lpRectData->cyClient
			cdq 
			idiv ecx
			mov dword ptr ss:[ebp-44h],edx ;yBottom
		;nRed = rand () & 255 ;
			call mdidemo.401CF0 ;<--- Random Proc?
			and eax,0FFh
			mov word ptr ss:[ebp-58h],ax ;nRed
		;nGreen = rand () & 255 ;
			call mdidemo.401CF0 ;<--- Random Proc?
			and eax,0FFh
			mov word ptr ss:[ebp-4Ch],ax ;nGreen
		;nBlue = rand () & 255 ;
			call mdidemo.401CF0 ;<--- Random Proc?
			and eax,0FFh
			mov word ptr ss:[ebp-60h],ax ;nBlue
		;hdc = GetDC (hwnd) ;
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call GetDC
		;hBrush = CreateSolidBrush (RGB (nRed, nGreen, nBlue)) ;
			mov dword ptr ss:[ebp-54h],eax ;hdc
			xor eax,eax
			mov al,byte ptr ss:[ebp-4Ch] ;nGreen
			shl eax,8
			xor ecx,ecx
			mov cl,byte ptr ss:[ebp-58h] ;nRed
			or eax,ecx
			xor ecx,ecx
			mov cl,byte ptr ss:[ebp-60h] ;nBlue
			shl ecx,10h
			or eax,ecx
			push eax
			call CreateSolidBrush
			mov dword ptr ss:[ebp-5Ch],eax ;hBrush
		;SelectObject (hdc, hBrush) ;
			mov eax,dword ptr ss:[ebp-5Ch] ;hBrush
			push eax
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call SelectObject
		;Rectangle (hdc,
		;min (xLeft, xRight), min (yTop, yBottom), max (xLeft, xRight), max (yTop, yBottom)) ;
		mdidemo.401B3F:
			mov eax,dword ptr ss:[ebp-68h] ;yTop
			mov ecx,dword ptr ss:[ebp-44h] ;yBottom
			cmp eax,ecx
			jg mdidemo.401B4F
			mov eax,ecx
		mdidemo.401B4F:
			push eax
			mov eax,dword ptr ss:[ebp-50h] ;xRight
			mov ecx,dword ptr ss:[ebp-64h] ;xLeft
			cmp eax,ecx
			jg mdidemo.401B60
			mov eax,ecx
		mdidemo.401B60:
			push eax
			mov eax,dword ptr ss:[ebp-68h] ;yTop
			mov ecx,dword ptr ss:[ebp-44h] ;yBottom
			cmp eax,ecx
			jl mdidemo.401B71
			mov eax,ecx
		mdidemo.401B71:
			push eax
			mov eax,dword ptr ss:[ebp-50h] ;xRight
			mov ecx,dword ptr ss:[ebp-64h] ;xLeft
			cmp eax,ecx
			jl mdidemo.401B82
			mov eax,ecx
		mdidemo.401B82:
			push eax
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			call Rectangle
		;ReleaseDC (hwnd, hdc) ;
			mov eax,dword ptr ss:[ebp-54h] ;hdc
			push eax
			mov eax,dword ptr ss:[ebp+8] ;hwnd
			push eax
			call ReleaseDC
		;DeleteObject (hBrush) ;
			mov eax,dword ptr ss:[ebp-5Ch] ;hBrush
			push eax
			call DeleteObject
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5 ;End Proc

	;case WM_PAINT :           // Clear the window
	mdidemo.401BAC:
		;InvalidateRect (hwnd, NULL, TRUE) ;
			push 1
			push 0
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call InvalidateRect
		;hdc = BeginPaint (hwnd, &ps) ;
			lea eax,dword ptr ss:[ebp-40h]
			push eax
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call BeginPaint
		;EndPaint (hwnd, &ps) ;
			mov dword ptr ss:[ebp-54h],eax
			lea eax,dword ptr ss:[ebp-40h]
			push eax
			mov eax,dword ptr ss:[ebp+8]
			push eax
			call EndPaint
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5 ;End Proc

	;case WM_MDIACTIVATE : // Set the appropriate menu
	mdidemo.401BE0:
		;if (lParam == (LPARAM) hwnd)
			mov eax,dword ptr ss:[ebp+8]
			cmp dword ptr ss:[ebp+14h],eax
			jne mdidemo.401C0E
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuRect, (LPARAM) hMenuRectWindow) ;
				mov eax,dword ptr ds:[405EA8h]
				push eax
				mov eax,dword ptr ds:[405E94h]
				push eax
				push 230h
				mov eax,dword ptr ds:[405E9Ch]
				push eax
				call SendMessageA
				jmp mdidemo.401C2B ;Draw Menu
		;else
		mdidemo.401C0E:
			;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuInit,
			;(LPARAM) hMenuInitWindow) ;
				mov eax,dword ptr ds:[405EB0h]
				push eax
				mov eax,dword ptr ds:[405EACh]
				push eax
				push 230h
				mov eax,dword ptr ds:[405E9Ch]
				push eax
				call SendMessageA
		;DrawMenuBar (hwndFrame) ;
		mdidemo.401C2B:
			mov eax,dword ptr ds:[405E98h]
			push eax
			call DrawMenuBar
		;return 0 ;
			xor eax,eax
			jmp mdidemo.401CE5 ;End Proc

;case WM_DESTROY :
mdidemo.401C3E:
	;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call GetWindowLongA
		mov dword ptr ss:[ebp-48h],eax
	;HeapFree (GetProcessHeap (), 0, lpRectData) ;
		mov eax,dword ptr ss:[ebp-48h] ;lpRectData
		push eax
		push 0
		call GetProcessHeap
		push eax
		call HeapFree
	;KillTimer (hwnd, 1) ;
		push 1
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call KillTimer
	;return 0 ;
		xor eax,eax
		jmp mdidemo.401CE5 ;End Proc

	jmp mdidemo.401CCA ;Default

mdidemo.401C78: ;Large Switch
	cmp dword ptr ss:[ebp-6Ch],0Fh ;WM_PAINT
		ja mdidemo.401CAB ;Timer
		je mdidemo.401BAC ;Paint
	cmp dword ptr ss:[ebp-6Ch],1 ;WM_CREATE
		je mdidemo.4019EB ;Create
	cmp dword ptr ss:[ebp-6Ch],2 ;WM_DESTROY
		je mdidemo.401C3E ;Destroy
	cmp dword ptr ss:[ebp-6Ch],5 ;WM_SIZE ?
		je mdidemo.401A49 ;Size
	jmp mdidemo.401CCA ;Default
mdidemo.401CAB:
	cmp dword ptr ss:[ebp-6Ch],113h ;WM_TIMER ?
		je mdidemo.401A82 ;Timer
	cmp dword ptr ss:[ebp-6Ch],222h ;WM_MDIACTIVATE
		je mdidemo.401BE0 ;Activate
	jmp mdidemo.401CCA ;Default

;// Pass unprocessed message to DefMDIChildProc
;return DefMDIChildProc (hwnd, iMsg, wParam, lParam) ;
mdidemo.401CCA:
	mov eax,dword ptr ss:[ebp+14h] ;lParam
	push eax
	mov eax,dword ptr ss:[ebp+10h] ;wParam
	push eax
	mov eax,dword ptr ss:[ebp+0Ch] ;iMsg
	push eax
	mov eax,dword ptr ss:[ebp+8] ;hwnd
	push eax
	call DefMDIChildProcA
	jmp mdidemo.401CE5 ;End Proc

mdidemo.401CE5:
	pop edi
	pop esi
	pop ebx
	leave 
	ret 10h


;=============================================
mdidemo.401CF0:
	mov eax,dword ptr ds:[405108] ;???
	lea ecx,dword ptr ds:[eax+eax*4]
	lea ecx,dword ptr ds:[ecx+ecx*4]
	add ecx,eax
	lea ecx,dword ptr ds:[eax+ecx*8]
	shl ecx,8
	sub ecx,eax
	lea eax,dword ptr ds:[eax+ecx*4+269EC3] ;???
	mov dword ptr ds:[405108],eax
	and eax,7FFF0000h
	shr eax,10h
	ret 
;==============================================
