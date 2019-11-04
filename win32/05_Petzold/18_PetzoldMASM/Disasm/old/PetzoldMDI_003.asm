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
	mov dword ptr ss:[ebp-18],eax
;wndclass.hbrBackground = (HBRUSH) (COLOR_APPWORKSPACE + 1) ;
	mov dword ptr ss:[ebp-14],D
;wndclass.lpszMenuName = NULL ;
	mov dword ptr ss:[ebp-10],0
;wndclass.lpszClassName = szFrameClass ;
	mov dword ptr ss:[ebp-C],mdidemo.405030
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	push 7F00h
	push 0
	call dword ptr ds:[<&LoadIconA>]
	mov dword ptr ss:[ebp-8],eax
;RegisterClassEx (&wndclass) ;
	lea eax,dword ptr ss:[ebp-34]
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
	mov dword ptr ss:[ebp-58],eax

;hwndClient = GetWindow (hwndFrame, GW_CHILD) ;
	push 5
	mov eax,dword ptr ss:[ebp-58]
	push eax
	call dword ptr ds:[<&GetWindow>]
	mov dword ptr ss:[ebp-54],eax
	mov eax,dword ptr ss:[ebp+14]
	push eax
	mov eax,dword ptr ss:[ebp-58]
	push eax
	call dword ptr ds:[<&ShowWindow>]
	mov eax,dword ptr ss:[ebp-58]
	push eax
	call dword ptr ds:[<&UpdateWindow>]

;// Enter the modified message loop
	push 0
	push 0
	push 0
	lea eax,dword ptr ss:[ebp-50] ;&msg
	push eax
	call dword ptr ds:[<&GetMessageA>]
	test eax,eax
		je mdidemo.4012DE
	lea eax,dword ptr ss:[ebp-50] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-54] ;hwndClient
	push eax
	call dword ptr ds:[<&TranslateMDISysAccel>]
	test eax,eax
		jne mdidemo.4012D9
	lea eax,dword ptr ss:[ebp-50] ;&msg
	push eax
	mov eax,dword ptr ss:[ebp-4] ;hAccel
	push eax
	mov eax,dword ptr ss:[ebp-58] ;hwndFrame
	push eax
	call dword ptr ds:[<&TranslateAccelerator>]
	test eax,eax
		jne mdidemo.4012D9
	lea eax,dword ptr ss:[ebp-50] ;&msg
	push eax
	call dword ptr ds:[<&TranslateMessage>]
	lea eax,dword ptr ss:[ebp-50] ;&msg
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

;????????????????????????????????????
	mov eax,dword ptr ss:[ebp-48]
	jmp mdidemo.4012FE

;return msg.wParam ;
	pop edi
	pop esi
	pop ebx
	leave 
	ret 10


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
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-38],eax
jmp mdidemo.40154B
mov dword ptr ss:[ebp-30],mdidemo.405040
mov dword ptr ss:[ebp-2C],mdidemo.4050C8
mov eax,dword ptr ds:[405E90]
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],80000000
mov dword ptr ss:[ebp-20],80000000
mov dword ptr ss:[ebp-1C],80000000
mov dword ptr ss:[ebp-18],80000000
mov dword ptr ss:[ebp-14],0
mov dword ptr ss:[ebp-10],0
lea eax,dword ptr ss:[ebp-30]
push eax
push 0
push 220
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
jmp mdidemo.401655
mov dword ptr ss:[ebp-30],mdidemo.405050
mov dword ptr ss:[ebp-2C],mdidemo.4050D0
mov eax,dword ptr ds:[405E90]
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],80000000
mov dword ptr ss:[ebp-20],80000000
mov dword ptr ss:[ebp-1C],80000000
mov dword ptr ss:[ebp-18],80000000
mov dword ptr ss:[ebp-14],0
mov dword ptr ss:[ebp-10],0
lea eax,dword ptr ss:[ebp-30]
push eax
push 0
push 220
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 229
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
push 0
push 0
push 11
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&SendMessageA>]
test eax,eax
je mdidemo.401474
push 0
mov eax,dword ptr ss:[ebp-4]
push eax
push 221
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 10
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 226
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 227
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 228
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push mdidemo.40165C
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&EnumChildWindows>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 229
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&IsWindow>]
test eax,eax
je mdidemo.401541
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
push 111
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&SendMessageA>]
jmp mdidemo.4015A7
jmp mdidemo.4015A7
sub dword ptr ss:[ebp-38],A
cmp dword ptr ss:[ebp-38],17
ja mdidemo.401500
mov eax,dword ptr ss:[ebp-38]
xor ecx,ecx
mov cl,byte ptr ds:[eax+40158F]
jmp dword ptr ds:[ecx*4+40156B]
imul edx,dword ptr ds:[ebx],40
add ah,cl
adc eax,dword ptr ds:[eax]
sub eax,7B004014
adc al,40
add byte ptr ds:[edx-51FFBFEC],dl
adc al,40
add dl,cl
adc al,40
add dh,ah
adc al,40
add byte ptr ds:[eax],al
adc eax,1000040
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
push 0
push 21
push 111
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SendMessageA>]
push 5
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&GetWindow>]
test eax,eax
je mdidemo.4015DC
xor eax,eax
jmp mdidemo.401655
jmp mdidemo.401634
push 0
call dword ptr ds:[<&PostQuitMessage>]
xor eax,eax
jmp mdidemo.401655
jmp mdidemo.401634
cmp dword ptr ss:[ebp-34],11
ja mdidemo.401622
cmp dword ptr ss:[ebp-34],10
jae mdidemo.4015AC
cmp dword ptr ss:[ebp-34],1
je mdidemo.401319
cmp dword ptr ss:[ebp-34],2
je mdidemo.4015E1
jmp mdidemo.401634
cmp dword ptr ss:[ebp-34],111
je mdidemo.401360
jmp mdidemo.401634
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
mov eax,dword ptr ss:[ebp+C]
push eax
mov eax,dword ptr ds:[405EBC]
push eax
mov eax,dword ptr ss:[ebp+8]
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
	
	push 4
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&GetWindow>]
	test eax,eax
	je mdidemo.401680
	mov eax,1
	jmp mdidemo.4016E4
	
	push 0
	mov eax,dword ptr ss:[ebp+8]
	push eax
	push 223
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&GetParent>]
	push eax
	call dword ptr ds:[<&SendMessageA>]
	push 0
	push 0
	push 11
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&SendMessageA>]
	test eax,eax
	jne mdidemo.4016BE
	mov eax,1
	jmp mdidemo.4016E4
	
	push 0
	mov eax,dword ptr ss:[ebp+8]
	push eax
	push 221
	mov eax,dword ptr ss:[ebp+8]
	push eax
	call dword ptr ds:[<&GetParent>]
	push eax
	call dword ptr ds:[<&SendMessageA>]
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
;static COLORREF clrTextArray[] = { RGB (0,   0, 0), RGB (255, 0,   0),
;                                   RGB (0, 255, 0), RGB (  0, 0, 255),
;                                   RGB (255, 255, 255) } ;
;static HWND     hwndClient, hwndFrame ;
;HDC             hdc ;
;HMENU           hMenu ;
;LPHELLODATA     lpHelloData ;
;PAINTSTRUCT     ps ;
;RECT            rect ;
	sub esp,64h

	push ebx
	push esi
	push edi

;switch (iMsg)
	mov eax,dword ptr ss:[ebp+C]
	mov dword ptr ss:[ebp-60],eax
	jmp mdidemo.40194E

	;case WM_CREATE : // Allocate memory for window private data
		;lpHelloData = (LPHELLODATA) HeapAlloc
		;(GetProcessHeap (),HEAP_ZERO_MEMORY,sizeof (HELLODATA)) ;
			push 8 ;sizeof (HELLODATA)
			push 8 ;HEAP_ZERO_MEMORY
			call dword ptr ds:[<&GetProcessHeap>]
			push eax
			call dword ptr ds:[<&RtlAllocateHeap>]
			mov dword ptr ss:[ebp-58],eax ;lpHelloData
		;lpHelloData->iColor  = IDM_BLACK ;
			mov eax,dword ptr ss:[ebp-58]
			mov dword ptr ds:[eax],14 ;lpHelloData+0
		;lpHelloData->clrText = RGB (0, 0, 0) ;
			mov eax,dword ptr ss:[ebp-58]
			mov dword ptr ds:[eax+4],0 ;lpHelloData+4
		;SetWindowLong (hwnd, 0, (long) lpHelloData) ;
			mov eax,dword ptr ss:[ebp-58] ;(long) lpHelloData
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






mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-64],eax
jmp mdidemo.4017D5
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ds:[405EB4]
push eax
call dword ptr ds:[<&GetMenu>]
mov dword ptr ss:[ebp-5C],eax
push 0
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+10]
mov ecx,dword ptr ss:[ebp-58]
mov dword ptr ds:[ecx],eax
push 8
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax*4+405010]
mov ecx,dword ptr ss:[ebp-58]
mov dword ptr ds:[ecx+4],eax
push 0
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&InvalidateRect>]
jmp mdidemo.4017EE
cmp dword ptr ss:[ebp-64],14
jb mdidemo.4017EE
cmp dword ptr ss:[ebp-64],18
jbe mdidemo.401768
jmp mdidemo.4017EE
xor eax,eax
jmp mdidemo.4019D0
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&BeginPaint>]
mov dword ptr ss:[ebp-54],eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax+4]
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&SetTextColor>]
lea eax,dword ptr ss:[ebp-10]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetClientRect>]
push 25
lea eax,dword ptr ss:[ebp-10]
push eax
push FFFFFFFF
push mdidemo.4050DC
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&DrawTextA>]
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&EndPaint>]
xor eax,eax
jmp mdidemo.4019D0
mov eax,dword ptr ss:[ebp+14]
cmp dword ptr ss:[ebp+8],eax
jne mdidemo.401889
mov eax,dword ptr ds:[405EA4]
push eax
mov eax,dword ptr ds:[405EB8]
push eax
push 230
mov eax,dword ptr ds:[405EA0]
push eax
call dword ptr ds:[<&SendMessageA>]
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp+8]
sub eax,dword ptr ss:[ebp+14]
cmp eax,1
sbb eax,eax
and eax,8
push eax
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ds:[405EB8]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+14]
cmp dword ptr ss:[ebp+8],eax
je mdidemo.4018E2
mov eax,dword ptr ds:[405EB0]
push eax
mov eax,dword ptr ds:[405EAC]
push eax
push 230
mov eax,dword ptr ds:[405EA0]
push eax
call dword ptr ds:[<&SendMessageA>]
mov eax,dword ptr ds:[405EB4]
push eax
call dword ptr ds:[<&DrawMenuBar>]
xor eax,eax
jmp mdidemo.4019D0
push 21
push mdidemo.4050EC
push mdidemo.4050F4
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&MessageBoxA>]
cmp eax,1
je mdidemo.40191B
xor eax,eax
jmp mdidemo.4019D0
jmp mdidemo.4019B5



;case WM_DESTROY :
	;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
		push 0
		mov eax,dword ptr ss:[ebp+8] ;hwnd
		push eax
		call dword ptr ds:[<&GetWindowLongA>]
		mov dword ptr ss:[ebp-58],eax ;lpHelloData
		mov eax,dword ptr ss:[ebp-58]
		push eax
	;HeapFree (GetProcessHeap (), 0, lpHelloData) ;
		push 0
		call dword ptr ds:[<&GetProcessHeap>]
		push eax
		call dword ptr ds:[<&HeapFree>]
	;return 0 ;
		xor eax,eax
		jmp mdidemo.4019D0



jmp mdidemo.4019B5



cmp dword ptr ss:[ebp-60],F
	ja mdidemo.401977
	je mdidemo.4017F5
cmp dword ptr ss:[ebp-60],1
	je mdidemo.4016FF
cmp dword ptr ss:[ebp-60],2
	je mdidemo.401920
	jmp mdidemo.4019B5
cmp dword ptr ss:[ebp-60],111
	ja mdidemo.4019A3
	je mdidemo.40175D
cmp dword ptr ss:[ebp-60],10
	jb mdidemo.4019B5
cmp dword ptr ss:[ebp-60],11
	jbe mdidemo.4018F5
	jmp mdidemo.4019B5
cmp dword ptr ss:[ebp-60],222
	je mdidemo.401860
	jmp mdidemo.4019B5


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
sub esp,6C
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-6C],eax
jmp mdidemo.401C78
push 4
push 8
call dword ptr ds:[<&GetProcessHeap>]
push eax
call dword ptr ds:[<&RtlAllocateHeap>]
mov dword ptr ss:[ebp-48],eax
mov eax,dword ptr ss:[ebp-48]
push eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SetWindowLongA>]
push 0
push FA
push 1
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SetTimer>]
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405E9C],eax
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405E98],eax
xor eax,eax
jmp mdidemo.401CE5
cmp dword ptr ss:[ebp+10],1
je mdidemo.401A7D
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-48],eax
mov eax,dword ptr ss:[ebp+14]
mov ecx,dword ptr ss:[ebp-48]
mov word ptr ds:[ecx],ax
mov eax,dword ptr ss:[ebp+14]
shr eax,10
and eax,FFFF
mov ecx,dword ptr ss:[ebp-48]
mov word ptr ds:[ecx+2],ax
jmp mdidemo.401CCA
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-48],eax
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx]
cdq 
idiv ecx
mov dword ptr ss:[ebp-64],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx]
cdq 
idiv ecx
mov dword ptr ss:[ebp-50],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx+2]
cdq 
idiv ecx
mov dword ptr ss:[ebp-68],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx+2]
cdq 
idiv ecx
mov dword ptr ss:[ebp-44],edx
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-58],ax
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-4C],ax
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-60],ax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetDC>]
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
mov eax,dword ptr ss:[ebp-5C]
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&SelectObject>]
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
mov eax,dword ptr ss:[ebp-54]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&ReleaseDC>]
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&DeleteObject>]
xor eax,eax
jmp mdidemo.401CE5
push 1
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&InvalidateRect>]
lea eax,dword ptr ss:[ebp-40]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&BeginPaint>]
mov dword ptr ss:[ebp-54],eax
lea eax,dword ptr ss:[ebp-40]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&EndPaint>]
xor eax,eax
jmp mdidemo.401CE5
mov eax,dword ptr ss:[ebp+8]
cmp dword ptr ss:[ebp+14],eax
jne mdidemo.401C0E
mov eax,dword ptr ds:[405EA8]
push eax
mov eax,dword ptr ds:[405E94]
push eax
push 230
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&SendMessageA>]
jmp mdidemo.401C2B
mov eax,dword ptr ds:[405EB0]
push eax
mov eax,dword ptr ds:[405EAC]
push eax
push 230
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&SendMessageA>]
mov eax,dword ptr ds:[405E98]
push eax
call dword ptr ds:[<&DrawMenuBar>]
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

cmp dword ptr ss:[ebp-6C],F
ja mdidemo.401CAB
je mdidemo.401BAC
cmp dword ptr ss:[ebp-6C],1
je mdidemo.4019EB
cmp dword ptr ss:[ebp-6C],2
je mdidemo.401C3E
cmp dword ptr ss:[ebp-6C],5
je mdidemo.401A49
jmp mdidemo.401CCA
cmp dword ptr ss:[ebp-6C],113
je mdidemo.401A82
cmp dword ptr ss:[ebp-6C],222
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



;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
;=====================================================================
int3 
int3 
int3 
int3 
mov eax,dword ptr ds:[405108]
lea ecx,dword ptr ds:[eax+eax*4]
lea ecx,dword ptr ds:[ecx+ecx*4]
add ecx,eax
lea ecx,dword ptr ds:[eax+ecx*8]
shl ecx,8
sub ecx,eax
lea eax,dword ptr ds:[eax+ecx*4+269EC3]
mov dword ptr ds:[405108],eax
and eax,7FFF0000
shr eax,10
ret 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr fs:[0]
push ebp
mov ebp,esp
push FFFFFFFF
push mdidemo.404000
push mdidemo.402CA0
push eax
mov dword ptr fs:[0],esp
sub esp,60
push ebx
push esi
push edi
mov dword ptr ss:[ebp-18],esp
call dword ptr ds:[<&GetVersion>]
mov dword ptr ds:[40512C],eax
xor eax,eax
mov al,byte ptr ds:[40512D]
mov dword ptr ds:[405138],eax
mov eax,dword ptr ds:[40512C]
shr dword ptr ds:[40512C],10
and eax,FF
mov dword ptr ds:[405134],eax
shl eax,8
add eax,dword ptr ds:[405138]
mov dword ptr ds:[405130],eax
call mdidemo.402C80
mov dword ptr ss:[ebp-4],0
call mdidemo.402AA0
call mdidemo.402A90
call dword ptr ds:[<&GetCommandLineA>]
mov dword ptr ds:[4070EC],eax
call mdidemo.402630
mov dword ptr ds:[40510C],eax
test eax,eax
je mdidemo.401DB9
cmp dword ptr ds:[4070EC],0
jne mdidemo.401DC3
push FFFFFFFF
call mdidemo.401F10
add esp,4
call mdidemo.4023B0
call mdidemo.4022D0
call mdidemo.401EE0
mov esi,dword ptr ds:[4070EC]
mov al,byte ptr ds:[esi]
cmp al,22
je mdidemo.401DEA
cmp al,20
jbe mdidemo.401E17
inc esi
cmp byte ptr ds:[esi],20
ja mdidemo.401DE2
jmp mdidemo.401E17
inc esi
cmp byte ptr ds:[esi],22
je mdidemo.401E16
mov bl,byte ptr ss:[ebp-28]
mov bl,byte ptr ds:[esi]
test bl,bl
je mdidemo.401E11
xor eax,eax
mov al,bl
push eax
call mdidemo.402270
add esp,4
test eax,eax
je mdidemo.401E0B
inc esi
inc esi
cmp byte ptr ds:[esi],22
jne mdidemo.401DF3
cmp byte ptr ds:[esi],22
jne mdidemo.401E17
inc esi
cmp byte ptr ds:[esi],0
je mdidemo.401E27
cmp byte ptr ds:[esi],20
ja mdidemo.401E27
inc esi
cmp byte ptr ds:[esi],0
jne mdidemo.401E1C
mov dword ptr ss:[ebp-44],0
lea eax,dword ptr ss:[ebp-70]
push eax
call dword ptr ds:[<&GetStartupInfoA>]
test byte ptr ss:[ebp-44],1
mov eax,A
je mdidemo.401E4B
mov eax,dword ptr ss:[ebp-40]
and eax,FFFF
push eax
push esi
push 0
push 0
call dword ptr ds:[<&GetModuleHandleA>]
push eax
call mdidemo.401000
push eax
call mdidemo.401F10
jmp mdidemo.401E8C
mov eax,dword ptr ss:[ebp-14]
mov eax,dword ptr ds:[eax]
mov eax,dword ptr ds:[eax]
mov dword ptr ss:[ebp-20],eax
mov eax,dword ptr ss:[ebp-14]
push eax
mov eax,dword ptr ss:[ebp-20]
push eax
call mdidemo.4020E0
add esp,8
ret 
mov esp,dword ptr ss:[ebp-18]
mov eax,dword ptr ss:[ebp-20]
push eax
call mdidemo.401F30
add esp,4
mov dword ptr ss:[ebp-4],FFFFFFFF
mov eax,dword ptr ss:[ebp-10]
pop edi
mov dword ptr fs:[0],eax
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
cmp dword ptr ds:[405118],1
jne mdidemo.401EBE
call mdidemo.402D80
mov eax,dword ptr ss:[esp+4]
push eax
call mdidemo.402DC0
add esp,4
push FF
call dword ptr ds:[405114]
add esp,4
ret 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ds:[4070E4]
test eax,eax
je mdidemo.401EEB
call eax
push mdidemo.405010
push mdidemo.405008
call mdidemo.401FD0
add esp,8
push mdidemo.405004
push mdidemo.405000
call mdidemo.401FD0
add esp,8
ret 
mov eax,dword ptr ss:[esp+4]
push 0
push 0
push eax
call mdidemo.401F50
add esp,C
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ss:[esp+4]
push 0
push 1
push eax
call mdidemo.401F50
add esp,C
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov dword ptr ds:[405164],1
cmp dword ptr ss:[esp+8],0
push ebx
push esi
mov ebx,dword ptr ss:[esp+14]
mov byte ptr ds:[405160],bl
jne mdidemo.401FAC
cmp dword ptr ds:[4070E8],0
je mdidemo.401F9A
mov esi,dword ptr ds:[4070E0]
sub esi,4
cmp esi,dword ptr ds:[4070E8]
jb mdidemo.401F9A
mov eax,dword ptr ds:[esi]
test eax,eax
je mdidemo.401F8F
call eax
sub esi,4
cmp esi,dword ptr ds:[4070E8]
jae mdidemo.401F87
push mdidemo.40501C
push mdidemo.405014
call mdidemo.401FD0
add esp,8
push mdidemo.405024
push mdidemo.405020
call mdidemo.401FD0
add esp,8
test ebx,ebx
jne mdidemo.401FCD
mov eax,dword ptr ss:[esp+C]
push eax
call dword ptr ds:[<&ExitProcess>]
pop esi
pop ebx
ret 
push esi
push edi
mov esi,dword ptr ss:[esp+10]
mov edi,dword ptr ss:[esp+C]
cmp esi,edi
jbe mdidemo.401FED
mov eax,dword ptr ds:[edi]
test eax,eax
je mdidemo.401FE6
call eax
add edi,4
cmp esi,edi
ja mdidemo.401FDE
pop edi
pop esi
ret 
push ebp
mov ebp,esp
push ebx
push esi
push edi
push ebp
push 0
push 0
push mdidemo.402008
push dword ptr ss:[ebp+8]
call <mdidemo.RtlUnwind>
pop ebp
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 
mov ecx,dword ptr ss:[esp+4]
test dword ptr ds:[ecx+4],6
mov eax,1
je mdidemo.402031
mov eax,dword ptr ss:[esp+8]
mov edx,dword ptr ss:[esp+10]
mov dword ptr ds:[edx],eax
mov eax,3
ret 
push ebx
push esi
push edi
mov eax,dword ptr ss:[esp+10]
push eax
push FFFFFFFE
push mdidemo.402010
push dword ptr fs:[0]
mov dword ptr fs:[0],esp
mov eax,dword ptr ss:[esp+20]
mov ebx,dword ptr ds:[eax+8]
mov esi,dword ptr ds:[eax+C]
cmp esi,FFFFFFFF
je mdidemo.40208C
cmp esi,dword ptr ss:[esp+24]
je mdidemo.40208C
lea esi,dword ptr ds:[esi+esi*2]
mov ecx,dword ptr ds:[ebx+esi*4]
mov dword ptr ss:[esp+8],ecx
mov dword ptr ds:[eax+C],ecx
cmp dword ptr ds:[ebx+esi*4+4],0
jne mdidemo.40208A
push 101
mov eax,dword ptr ds:[ebx+esi*4+8]
call mdidemo.4020C6
call dword ptr ds:[ebx+esi*4+8]
jmp mdidemo.40204F
pop dword ptr fs:[0]
add esp,C
pop edi
pop esi
pop ebx
ret 
xor eax,eax
mov ecx,dword ptr fs:[0]
cmp dword ptr ds:[ecx+4],mdidemo.402010
jne mdidemo.4020BC
mov edx,dword ptr ds:[ecx+C]
mov edx,dword ptr ds:[edx+C]
cmp dword ptr ds:[ecx+8],edx
jne mdidemo.4020BC
mov eax,1
ret 
push ebx
push ecx
mov ebx,mdidemo.405168
jmp mdidemo.4020D0
push ebx
push ecx
mov ebx,mdidemo.405168
mov ecx,dword ptr ss:[ebp+8]
mov dword ptr ds:[ebx+8],ecx
mov dword ptr ds:[ebx+4],eax
mov dword ptr ds:[ebx+C],ebp
pop ecx
pop ebx
ret 4
int3 
int3 
mov eax,dword ptr ss:[esp+4]
push esi
push edi
push eax
call mdidemo.402240
add esp,4
test eax,eax
je mdidemo.402231
mov edx,dword ptr ds:[eax+8]
test edx,edx
je mdidemo.402231
cmp edx,5
jne mdidemo.402116
mov dword ptr ds:[eax+8],0
mov eax,1
pop edi
pop esi
ret 
cmp edx,1
jne mdidemo.402123
mov eax,FFFFFFFF
pop edi
pop esi
ret 
mov esi,dword ptr ds:[405200]
mov ecx,dword ptr ss:[esp+10]
mov dword ptr ds:[405200],ecx
cmp dword ptr ds:[eax+4],8
jne mdidemo.402213
mov ecx,dword ptr ds:[4051F4]
add ecx,dword ptr ds:[4051F0]
cmp dword ptr ds:[4051F0],ecx
jge mdidemo.402173
mov ecx,dword ptr ds:[4051F0]
lea ecx,dword ptr ds:[ecx+ecx*2]
lea edi,dword ptr ds:[ecx*4+405180]
mov ecx,dword ptr ds:[4051F4]
mov dword ptr ds:[edi],0
add edi,C
dec ecx
jne mdidemo.402167
mov edi,dword ptr ds:[4051FC]
mov eax,dword ptr ds:[eax]
cmp eax,C000008E
jne mdidemo.40218E
mov dword ptr ds:[4051FC],83
jmp mdidemo.4021FE
cmp eax,C0000090
jne mdidemo.4021A1
mov dword ptr ds:[4051FC],81
jmp mdidemo.4021FE
cmp eax,C0000091
jne mdidemo.4021B4
mov dword ptr ds:[4051FC],84
jmp mdidemo.4021FE
cmp eax,C0000093
jne mdidemo.4021C7
mov dword ptr ds:[4051FC],85
jmp mdidemo.4021FE
cmp eax,C000008D
jne mdidemo.4021DA
mov dword ptr ds:[4051FC],82
jmp mdidemo.4021FE
cmp eax,C000008F
jne mdidemo.4021ED
mov dword ptr ds:[4051FC],86
jmp mdidemo.4021FE
cmp eax,C0000092
jne mdidemo.4021FE
mov dword ptr ds:[4051FC],8A
mov eax,dword ptr ds:[4051FC]
push eax
push 8
call edx
add esp,8
mov dword ptr ds:[4051FC],edi
jmp mdidemo.402223
mov dword ptr ds:[eax+8],0
mov eax,dword ptr ds:[eax+4]
push eax
call edx
add esp,4
mov eax,FFFFFFFF
pop edi
mov dword ptr ds:[405200],esi
pop esi
ret 
mov ecx,dword ptr ss:[esp+10]
push ecx
call dword ptr ds:[<&UnhandledExceptionFilter>]
pop edi
pop esi
ret 
int3 
mov edx,mdidemo.405178
mov ecx,dword ptr ss:[esp+4]
cmp dword ptr ds:[edx],ecx
je mdidemo.402263
add edx,C
mov eax,dword ptr ds:[4051F8]
lea eax,dword ptr ds:[eax+eax*2]
lea eax,dword ptr ds:[eax*4+405178]
cmp eax,edx
ja mdidemo.402249
mov eax,dword ptr ds:[edx]
sub eax,ecx
cmp eax,1
sbb eax,eax
and eax,edx
ret 
int3 
mov eax,dword ptr ss:[esp+4]
push 4
push 0
push eax
call mdidemo.402290
add esp,C
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
xor edx,edx
xor ecx,ecx
mov dl,byte ptr ss:[esp+4]
mov cl,byte ptr ds:[edx+405211]
test dword ptr ss:[esp+C],ecx
jne mdidemo.4022C4
mov eax,dword ptr ss:[esp+8]
mov ecx,0
test eax,eax
je mdidemo.4022BD
xor ecx,ecx
mov cx,word ptr ds:[edx*2+405792]
and ecx,eax
test ecx,ecx
jne mdidemo.4022C4
xor eax,eax
ret 
mov eax,1
ret 
int3 
int3 
int3 
int3 
int3 
int3 
sub esp,4
mov edx,dword ptr ds:[40510C]
push ebx
push esi
push edi
xor esi,esi
push ebp
cmp byte ptr ds:[edx],0
je mdidemo.4022FE
cmp byte ptr ds:[edx],3D
je mdidemo.4022EA
inc esi
mov edi,edx
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
add edx,ecx
cmp byte ptr ds:[edx],0
jne mdidemo.4022E4
lea eax,dword ptr ds:[esi*4+4]
push eax
call mdidemo.402FD0
mov dword ptr ds:[405148],eax
add esp,4
mov ebx,eax
test ebx,ebx
jne mdidemo.402323
push 9
call mdidemo.401EB0
add esp,4
mov ebp,dword ptr ds:[40510C]
mov eax,ebp
cmp byte ptr ss:[ebp],0
je mdidemo.40238F
mov edi,ebp
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
mov dword ptr ss:[esp+10],ecx
cmp byte ptr ss:[ebp],3D
je mdidemo.402385
push ecx
call mdidemo.402FD0
add esp,4
mov dword ptr ds:[ebx],eax
test eax,eax
jne mdidemo.402361
push 9
call mdidemo.401EB0
add esp,4
mov edi,ebp
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
sub edi,ecx
mov eax,ecx
shr ecx,2
mov esi,edi
mov edi,dword ptr ds:[ebx]
add ebx,4
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,eax
and ecx,3
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
add ebp,dword ptr ss:[esp+10]
cmp byte ptr ss:[ebp],0
jne mdidemo.402331
mov eax,dword ptr ds:[40510C]
push eax
call mdidemo.402FB0
add esp,4
mov dword ptr ds:[ebx],0
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
int3 
int3 
int3 
int3 
int3 
sub esp,8
push esi
push edi
push 104
mov esi,mdidemo.405EC0
push esi
push 0
call dword ptr ds:[<&GetModuleFileNameA>]
mov eax,dword ptr ds:[4070EC]
mov dword ptr ds:[405158],esi
cmp byte ptr ds:[eax],0
je mdidemo.4023DE
mov esi,dword ptr ds:[4070EC]
lea eax,dword ptr ss:[esp+C]
lea ecx,dword ptr ss:[esp+8]
push eax
push ecx
push 0
push 0
push esi
call mdidemo.402450
mov eax,dword ptr ss:[esp+1C]
add esp,14
shl eax,2
add eax,dword ptr ss:[esp+C]
push eax
call mdidemo.402FD0
add esp,4
mov edi,eax
test edi,edi
jne mdidemo.402419
push 8
call mdidemo.401EB0
add esp,4
lea eax,dword ptr ss:[esp+C]
lea ecx,dword ptr ss:[esp+8]
mov edx,dword ptr ss:[esp+8]
push eax
push ecx
lea eax,dword ptr ds:[edi+edx*4]
push eax
push edi
push esi
call mdidemo.402450
mov eax,dword ptr ss:[esp+1C]
add esp,14
dec eax
mov dword ptr ds:[405140],edi
pop edi
mov dword ptr ds:[40513C],eax
pop esi
add esp,8
ret 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[esp+14]
push ebx
mov edx,dword ptr ss:[esp+14]
push esi
mov esi,dword ptr ss:[esp+C]
push edi
mov eax,dword ptr ss:[esp+18]
push ebp
cmp dword ptr ss:[esp+18],0
mov dword ptr ds:[ecx],0
mov dword ptr ds:[edx],1
je mdidemo.402482
mov edx,dword ptr ss:[esp+18]
add dword ptr ss:[esp+18],4
mov dword ptr ds:[edx],eax
cmp byte ptr ds:[esi],22
je mdidemo.4024CD
inc dword ptr ds:[ecx]
test eax,eax
je mdidemo.402492
mov dl,byte ptr ds:[esi]
mov byte ptr ds:[eax],dl
inc eax
mov dl,byte ptr ds:[esi]
inc esi
xor ebx,ebx
mov bl,dl
test byte ptr ds:[ebx+405211],4
je mdidemo.4024AE
inc dword ptr ds:[ecx]
test eax,eax
je mdidemo.4024AD
mov bl,byte ptr ds:[esi]
mov byte ptr ds:[eax],bl
inc eax
inc esi
cmp dl,20
je mdidemo.4024BC
test dl,dl
je mdidemo.4024C0
cmp dl,9
jne mdidemo.402487
test dl,dl
jne mdidemo.4024C3
dec esi
jmp mdidemo.402513
test eax,eax
je mdidemo.402513
mov byte ptr ds:[eax-1],0
jmp mdidemo.402513
inc esi
cmp byte ptr ds:[esi],22
je mdidemo.402503
mov bl,byte ptr ds:[esi]
test bl,bl
je mdidemo.402503
xor edx,edx
mov dl,bl
test byte ptr ds:[edx+405211],4
je mdidemo.4024F2
inc dword ptr ds:[ecx]
test eax,eax
je mdidemo.4024F2
mov dl,byte ptr ds:[esi]
inc esi
mov byte ptr ds:[eax],dl
inc eax
inc dword ptr ds:[ecx]
test eax,eax
je mdidemo.4024FD
mov dl,byte ptr ds:[esi]
mov byte ptr ds:[eax],dl
inc eax
inc esi
cmp byte ptr ds:[esi],22
jne mdidemo.4024D3
inc dword ptr ds:[ecx]
test eax,eax
je mdidemo.40250D
mov byte ptr ds:[eax],0
inc eax
cmp byte ptr ds:[esi],22
jne mdidemo.402513
inc esi
xor edi,edi
cmp byte ptr ds:[esi],0
je mdidemo.402606
mov dl,byte ptr ds:[esi]
cmp dl,20
je mdidemo.40252A
cmp dl,9
jne mdidemo.40252D
inc esi
jmp mdidemo.40251E
cmp byte ptr ds:[esi],0
je mdidemo.402606
cmp dword ptr ss:[esp+18],0
je mdidemo.402548
mov edx,dword ptr ss:[esp+18]
add dword ptr ss:[esp+18],4
mov dword ptr ds:[edx],eax
mov edx,dword ptr ss:[esp+20]
inc dword ptr ds:[edx]
mov ebx,1
xor ebp,ebp
cmp byte ptr ds:[esi],5C
jne mdidemo.402561
inc esi
inc ebp
cmp byte ptr ds:[esi],5C
je mdidemo.40255A
cmp byte ptr ds:[esi],22
jne mdidemo.40258A
test ebp,1
jne mdidemo.402587
test edi,edi
je mdidemo.40257E
lea edx,dword ptr ds:[esi+1]
cmp byte ptr ds:[edx],22
jne mdidemo.40257E
mov esi,edx
jmp mdidemo.402580
xor ebx,ebx
cmp edi,1
sbb edi,edi
neg edi
shr ebp,1
mov edx,ebp
dec ebp
test edx,edx
je mdidemo.4025A2
test eax,eax
je mdidemo.402599
mov byte ptr ds:[eax],5C
inc eax
mov edx,ebp
inc dword ptr ds:[ecx]
dec ebp
test edx,edx
jne mdidemo.402591
mov dl,byte ptr ds:[esi]
test dl,dl
je mdidemo.4025F7
test edi,edi
jne mdidemo.4025B6
cmp dl,20
je mdidemo.4025F7
cmp dl,9
je mdidemo.4025F7
test ebx,ebx
je mdidemo.4025F1
test eax,eax
je mdidemo.4025DF
xor ebx,ebx
mov bl,dl
test byte ptr ds:[ebx+405211],4
je mdidemo.4025D1
mov byte ptr ds:[eax],dl
inc esi
inc eax
inc dword ptr ds:[ecx]
mov dl,byte ptr ds:[esi]
inc eax
inc esi
mov byte ptr ds:[eax-1],dl
inc dword ptr ds:[ecx]
jmp mdidemo.40254E
xor ebx,ebx
mov bl,dl
test byte ptr ds:[ebx+405211],4
je mdidemo.4025EF
inc esi
inc dword ptr ds:[ecx]
inc dword ptr ds:[ecx]
inc esi
jmp mdidemo.40254E
test eax,eax
je mdidemo.4025FF
mov byte ptr ds:[eax],0
inc eax
inc dword ptr ds:[ecx]
jmp mdidemo.402515
cmp dword ptr ss:[esp+18],0
je mdidemo.402617
mov edx,dword ptr ss:[esp+18]
mov dword ptr ds:[edx],0
mov edx,dword ptr ss:[esp+20]
pop ebp
pop edi
pop esi
pop ebx
inc dword ptr ds:[edx]
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
sub esp,4
cmp dword ptr ds:[405208],0
push ebx
push esi
push edi
push ebp
jne mdidemo.402680
mov esi,dword ptr ds:[<&GetEnvironmentStringsW>]
call esi
mov edi,eax
test edi,edi
je mdidemo.40265E
mov dword ptr ds:[405208],1
mov ebx,dword ptr ss:[esp+10]
jmp mdidemo.40268E
call dword ptr ds:[<&GetEnvironmentStrings>]
mov ebx,eax
test ebx,ebx
je mdidemo.402676
mov dword ptr ds:[405208],2
jmp mdidemo.40268E
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
mov edi,dword ptr ss:[esp+10]
mov ebx,dword ptr ss:[esp+10]
mov esi,dword ptr ds:[<&GetEnvironmentStringsW>]
cmp dword ptr ds:[405208],1
jne mdidemo.40273D
test edi,edi
jne mdidemo.4026B1
call esi
mov edi,eax
test edi,edi
jne mdidemo.4026B1
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
cmp word ptr ds:[edi],0
mov esi,edi
je mdidemo.4026CB
add esi,2
cmp word ptr ds:[esi],0
jne mdidemo.4026B9
add esi,2
cmp word ptr ds:[esi],0
jne mdidemo.4026B9
sub esi,edi
push 0
sar esi,1
push 0
inc esi
push 0
push 0
push esi
push edi
push 0
push 0
call dword ptr ds:[<&WideCharToMultiByte>]
mov ebp,eax
test ebp,ebp
je mdidemo.40272C
push ebp
call mdidemo.402FD0
add esp,4
mov ebx,eax
test ebx,ebx
je mdidemo.40272C
push 0
push 0
push ebp
push ebx
push esi
push edi
push 0
push 0
call dword ptr ds:[<&WideCharToMultiByte>]
test eax,eax
jne mdidemo.40271B
push ebx
call mdidemo.402FB0
add esp,4
xor ebx,ebx
push edi
call dword ptr ds:[<&FreeEnvironmentStringsW>]
mov eax,ebx
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
push edi
call dword ptr ds:[<&FreeEnvironmentStringsW>]
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
cmp dword ptr ds:[405208],2
jne mdidemo.4027C1
test ebx,ebx
jne mdidemo.402760
call dword ptr ds:[<&GetEnvironmentStrings>]
mov ebx,eax
test ebx,ebx
jne mdidemo.402760
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
mov ebp,ebx
cmp byte ptr ds:[ebx],0
je mdidemo.402775
inc ebp
cmp byte ptr ss:[ebp],0
jne mdidemo.402767
inc ebp
cmp byte ptr ss:[ebp],0
jne mdidemo.402767
sub ebp,ebx
inc ebp
push ebp
call mdidemo.402FD0
mov dword ptr ss:[esp+14],eax
add esp,4
test eax,eax
jne mdidemo.40279A
push ebx
call dword ptr ds:[<&FreeEnvironmentStringsA>]
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
mov edi,dword ptr ss:[esp+10]
mov esi,ebx
mov ecx,ebp
shr ecx,2
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,ebp
push ebx
and ecx,3
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
call dword ptr ds:[<&FreeEnvironmentStringsA>]
mov eax,dword ptr ss:[esp+10]
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,4
ret 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ss:[esp+4]
sub esp,18
push ebx
push esi
push edi
push ebp
push eax
call mdidemo.4029B0
add esp,4
mov ebp,eax
cmp dword ptr ds:[405314],ebp
jne mdidemo.4027F8
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,18
ret 
test ebp,ebp
jne mdidemo.40280B
call mdidemo.402A60
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,18
ret 
mov dword ptr ss:[esp+10],0
mov eax,mdidemo.405338
cmp dword ptr ds:[eax],ebp
je mdidemo.4028BB
add eax,30
inc dword ptr ss:[esp+10]
cmp eax,mdidemo.405428
jb mdidemo.402818
lea eax,dword ptr ss:[esp+14]
push eax
push ebp
call dword ptr ds:[<&GetCPInfo>]
cmp eax,1
jne mdidemo.402986
mov edi,mdidemo.405210
xor eax,eax
mov ecx,40
rep stosd dword ptr es:[edi],eax
stosb byte ptr es:[edi],al
cmp dword ptr ss:[esp+14],1
jbe mdidemo.402963
lea esi,dword ptr ss:[esp+1A]
cmp byte ptr ss:[esp+1A],al
je mdidemo.402893
mov cl,byte ptr ds:[esi+1]
test cl,cl
je mdidemo.402893
xor eax,eax
xor edx,edx
mov al,byte ptr ds:[esi]
mov dl,cl
cmp edx,eax
jb mdidemo.40288B
or byte ptr ds:[eax+405211],4
inc eax
xor ecx,ecx
mov cl,byte ptr ds:[esi+1]
cmp ecx,eax
jae mdidemo.40287A
add esi,2
cmp byte ptr ds:[esi],0
jne mdidemo.402867
mov eax,1
or byte ptr ds:[eax+405211],8
inc eax
cmp eax,FF
jb mdidemo.402898
push ebp
mov dword ptr ds:[405314],ebp
call mdidemo.402A00
add esp,4
jmp mdidemo.40296A
mov edi,mdidemo.405210
xor eax,eax
mov ecx,40
rep stosd dword ptr es:[edi],eax
stosb byte ptr es:[edi],al
mov ecx,dword ptr ss:[esp+10]
lea edx,dword ptr ds:[ecx+ecx*2]
lea edi,dword ptr ds:[edx*2]
lea ecx,dword ptr ds:[eax+edi]
lea esi,dword ptr ds:[ecx*8+405348]
cmp byte ptr ds:[esi],0
je mdidemo.402918
mov cl,byte ptr ds:[esi+1]
test cl,cl
je mdidemo.402918
xor edx,edx
xor ebx,ebx
mov dl,byte ptr ds:[esi]
mov bl,cl
cmp ebx,edx
jb mdidemo.402910
mov cl,byte ptr ds:[eax+405330]
or byte ptr ds:[edx+405211],cl
inc edx
xor ebx,ebx
mov bl,byte ptr ds:[esi+1]
cmp ebx,edx
jae mdidemo.402900
add esi,2
cmp byte ptr ds:[esi],0
jne mdidemo.4028E7
inc eax
cmp eax,4
jb mdidemo.4028D8
push ebp
mov dword ptr ds:[405314],ebp
call mdidemo.402A00
mov dword ptr ds:[405318],eax
mov eax,dword ptr ss:[esp+14]
shl eax,4
mov ebx,dword ptr ds:[eax+eax*2+405340]
add esp,4
mov edx,mdidemo.405320
lea ecx,dword ptr ds:[eax+eax*2+40533C]
pop ebp
pop edi
pop esi
mov eax,dword ptr ds:[ecx]
mov ecx,dword ptr ds:[ecx+8]
mov dword ptr ds:[edx],eax
xor eax,eax
mov dword ptr ds:[edx+4],ebx
pop ebx
mov dword ptr ds:[edx+8],ecx
add esp,18
ret 
xor eax,eax
mov dword ptr ds:[405314],eax
mov ecx,mdidemo.405320
pop ebp
pop edi
mov dword ptr ds:[405318],eax
xor eax,eax
pop esi
pop ebx
mov dword ptr ds:[ecx],eax
mov dword ptr ds:[ecx+4],eax
mov dword ptr ds:[ecx+8],eax
add esp,18
ret 
cmp dword ptr ds:[40532C],0
je mdidemo.40299E
call mdidemo.402A60
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,18
ret 
mov eax,FFFFFFFF
pop ebp
pop edi
pop esi
pop ebx
add esp,18
ret 
int3 
int3 
int3 
int3 
int3 
mov dword ptr ds:[40532C],0
mov eax,dword ptr ss:[esp+4]
cmp eax,FFFFFFFE
jne mdidemo.4029D3
mov dword ptr ds:[40532C],1
jmp dword ptr ds:[<&GetOEMCP>]
cmp eax,FFFFFFFD
jne mdidemo.4029E8
mov dword ptr ds:[40532C],1
jmp dword ptr ds:[<&GetACP>]
cmp eax,FFFFFFFC
jne mdidemo.4029FC
mov dword ptr ds:[40532C],1
mov eax,dword ptr ds:[4059B0]
ret 
int3 
int3 
int3 
mov eax,dword ptr ss:[esp+4]
sub eax,3A4
cmp eax,12
ja mdidemo.402A1D
xor ecx,ecx
mov cl,byte ptr ds:[eax+402A4C]
jmp dword ptr ds:[ecx*4+402A38]
xor eax,eax
ret 
mov eax,411
ret 
mov eax,804
ret 
mov eax,412
ret 
mov eax,404
ret 
and byte ptr ds:[edx],ch
inc eax
add byte ptr ds:[esi],ah
sub al,byte ptr ds:[eax]
sub al,2A
inc eax
add byte ptr ds:[edx],dh
sub al,byte ptr ds:[eax]
sbb eax,402A
add al,4
add al,1
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,byte ptr ds:[ebx]
int3 
push edi
xor eax,eax
mov edi,mdidemo.405210
mov ecx,40
rep stosd dword ptr es:[edi],eax
stosb byte ptr es:[edi],al
mov dword ptr ds:[405320],eax
mov ecx,mdidemo.405320
pop edi
mov dword ptr ds:[405314],eax
mov dword ptr ds:[405318],eax
mov dword ptr ds:[ecx+4],eax
mov dword ptr ds:[ecx+8],eax
ret 
int3 
int3 
int3 
int3 
push FFFFFFFD
call mdidemo.4027D0
add esp,4
ret 
int3 
int3 
int3 
int3 
int3 
sub esp,44
push ebx
push esi
push edi
push ebp
push 100
call mdidemo.402FD0
add esp,4
mov esi,eax
test esi,esi
jne mdidemo.402AC4
push 1B
call mdidemo.401EB0
add esp,4
lea eax,dword ptr ds:[esi+100]
mov dword ptr ds:[406FE0],esi
mov dword ptr ds:[406FD4],20
cmp eax,esi
jbe mdidemo.402B03
xor ecx,ecx
mov edx,A
mov byte ptr ds:[esi+4],cl
add esi,8
mov dword ptr ds:[esi-8],FFFFFFFF
mov byte ptr ds:[esi-3],dl
mov eax,dword ptr ds:[406FE0]
add eax,100
cmp eax,esi
ja mdidemo.402AE5
lea eax,dword ptr ss:[esp+10]
push eax
call dword ptr ds:[<&GetStartupInfoA>]
cmp word ptr ss:[esp+42],0
je mdidemo.402BE8
cmp dword ptr ss:[esp+44],0
je mdidemo.402BE8
mov eax,dword ptr ss:[esp+44]
mov edi,dword ptr ds:[eax]
lea ebx,dword ptr ds:[eax+4]
cmp edi,800
lea esi,dword ptr ds:[edi+ebx]
jl mdidemo.402B3E
mov edi,800
cmp edi,dword ptr ds:[406FD4]
jle mdidemo.402BA3
mov ebp,mdidemo.406FE4
push 100
call mdidemo.402FD0
add esp,4
test eax,eax
je mdidemo.402B9D
lea ecx,dword ptr ds:[eax+100]
mov dword ptr ss:[ebp],eax
add dword ptr ds:[406FD4],20
cmp ecx,eax
jbe mdidemo.402B90
xor ecx,ecx
mov byte ptr ds:[eax+4],cl
add eax,8
mov dword ptr ds:[eax-8],FFFFFFFF
mov byte ptr ds:[eax-3],A
mov edx,dword ptr ss:[ebp]
add edx,100
cmp edx,eax
ja mdidemo.402B72
add ebp,4
cmp edi,dword ptr ds:[406FD4]
jg mdidemo.402B4B
jmp mdidemo.402BA3
mov edi,dword ptr ds:[406FD4]
xor ebp,ebp
test edi,edi
jle mdidemo.402BE8
mov eax,dword ptr ds:[esi]
cmp eax,FFFFFFFF
je mdidemo.402BDF
test byte ptr ds:[ebx],1
je mdidemo.402BDF
push eax
call dword ptr ds:[<&GetFileType>]
test eax,eax
je mdidemo.402BDF
mov eax,ebp
mov ecx,ebp
and eax,FFFFFFE7
and ecx,1F
sar eax,3
mov edx,dword ptr ds:[eax+406FE0]
mov eax,dword ptr ds:[esi]
lea ecx,dword ptr ds:[edx+ecx*8]
mov dword ptr ds:[ecx],eax
mov dl,byte ptr ds:[ebx]
mov byte ptr ds:[ecx+4],dl
inc ebp
inc ebx
add esi,4
cmp ebp,edi
jl mdidemo.402BA9
xor esi,esi
mov edi,dword ptr ds:[<&GetStdHandle>]
lea ebx,dword ptr ds:[esi*8]
add ebx,dword ptr ds:[406FE0]
cmp dword ptr ds:[ebx],FFFFFFFF
jne mdidemo.402C55
mov eax,FFFFFFF6
test esi,esi
mov byte ptr ds:[ebx+4],81
je mdidemo.402C1D
lea eax,dword ptr ds:[esi-1]
cmp eax,1
mov eax,FFFFFFF5
adc eax,FFFFFFFF
push eax
call edi
cmp eax,FFFFFFFF
mov ebp,eax
je mdidemo.402C4F
push ebp
call dword ptr ds:[<&GetFileType>]
test eax,eax
je mdidemo.402C4F
and eax,FF
mov dword ptr ds:[ebx],ebp
cmp eax,2
jne mdidemo.402C44
or byte ptr ds:[ebx+4],40
jmp mdidemo.402C59
cmp eax,3
jne mdidemo.402C59
or byte ptr ds:[ebx+4],8
jmp mdidemo.402C59
or byte ptr ds:[ebx+4],40
jmp mdidemo.402C59
or byte ptr ds:[ebx+4],80
inc esi
cmp esi,3
jl mdidemo.402BF0
mov eax,dword ptr ds:[406FD4]
push eax
call dword ptr ds:[<&SetHandleCount>]
pop ebp
pop edi
pop esi
pop ebx
add esp,44
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push 0
push 1000
push 1
call dword ptr ds:[<&HeapCreate>]
mov dword ptr ds:[406FD0],eax
ret 
int3 
int3 
int3 
push esi
inc ebx
xor dh,byte ptr ds:[eax]
pop eax
inc ebx
xor byte ptr ds:[eax],dh
push ebp
mov ebp,esp
sub esp,8
push ebx
push esi
push edi
push ebp
cld 
mov ebx,dword ptr ss:[ebp+C]
mov eax,dword ptr ss:[ebp+8]
test dword ptr ds:[eax+4],6
jne mdidemo.402D40
mov dword ptr ss:[ebp-8],eax
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-8]
mov dword ptr ds:[ebx-4],eax
mov esi,dword ptr ds:[ebx+C]
mov edi,dword ptr ds:[ebx+8]
cmp esi,FFFFFFFF
je mdidemo.402D39
lea ecx,dword ptr ds:[esi+esi*2]
cmp dword ptr ds:[edi+ecx*4+4],0
je mdidemo.402D27
push esi
push ebp
lea ebp,dword ptr ds:[ebx+10]
call dword ptr ds:[edi+ecx*4+4]
pop ebp
pop esi
mov ebx,dword ptr ss:[ebp+C]
or eax,eax
je mdidemo.402D27
js mdidemo.402D32
mov edi,dword ptr ds:[ebx+8]
push ebx
call mdidemo.401FF0
add esp,4
lea ebp,dword ptr ds:[ebx+10]
push esi
push ebx
call mdidemo.402032
add esp,8
lea ecx,dword ptr ds:[esi+esi*2]
push 1
mov eax,dword ptr ds:[edi+ecx*4+8]
call mdidemo.4020C6
mov eax,dword ptr ds:[edi+ecx*4]
mov dword ptr ds:[ebx+C],eax
call dword ptr ds:[edi+ecx*4+8]
mov edi,dword ptr ds:[ebx+8]
lea ecx,dword ptr ds:[esi+esi*2]
mov esi,dword ptr ds:[edi+ecx*4]
jmp mdidemo.402CD3
mov eax,0
jmp mdidemo.402D55
mov eax,1
jmp mdidemo.402D55
push ebp
lea ebp,dword ptr ds:[ebx+10]
push FFFFFFFF
push ebx
call mdidemo.402032
add esp,8
pop ebp
mov eax,1
pop ebp
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 
push ebp
mov ecx,dword ptr ss:[esp+8]
mov ebp,dword ptr ds:[ecx]
mov eax,dword ptr ds:[ecx+1C]
push eax
mov eax,dword ptr ds:[ecx+18]
push eax
call mdidemo.402032
add esp,8
pop ebp
ret 4
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ds:[405118]
cmp eax,1
je mdidemo.402D97
test eax,eax
jne mdidemo.402DBC
cmp dword ptr ds:[40511C],1
jne mdidemo.402DBC
push FC
call mdidemo.402DC0
add esp,4
mov eax,dword ptr ds:[405720]
test eax,eax
je mdidemo.402DAF
call eax
push FF
call mdidemo.402DC0
add esp,4
ret 
int3 
int3 
int3 
sub esp,1A8
xor eax,eax
mov ecx,mdidemo.405698
push ebx
mov edx,dword ptr ss:[esp+1B0]
push esi
push edi
push ebp
cmp dword ptr ds:[ecx],edx
je mdidemo.402DE8
add ecx,8
inc eax
cmp ecx,mdidemo.405720
jb mdidemo.402DD8
cmp dword ptr ds:[eax*8+405698],edx
lea ebx,dword ptr ds:[eax*8]
jne mdidemo.402FA3
cmp dword ptr ds:[405118],1
je mdidemo.402F68
cmp dword ptr ds:[405118],0
jne mdidemo.402E1F
cmp dword ptr ds:[40511C],1
je mdidemo.402F68
cmp edx,FC
je mdidemo.402FA3
lea eax,dword ptr ss:[esp+B4]
push 104
push eax
mov ebp,dword ptr ds:[<&GetModuleFileNameA>]
push 0
call ebp
test eax,eax
jne mdidemo.402E5C
mov esi,mdidemo.405770
lea edi,dword ptr ss:[esp+B4]
mov ecx,5
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
movsw word ptr es:[edi],word ptr ds:[esi]
movsb byte ptr es:[edi],byte ptr ds:[esi]
lea ebp,dword ptr ss:[esp+B4]
lea edi,dword ptr ss:[esp+B4]
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
cmp ecx,3C
jbe mdidemo.402EA0
lea edi,dword ptr ss:[esp+B4]
mov ecx,FFFFFFFF
sub eax,eax
push 3
repne scasb al,byte ptr es:[edi]
not ecx
lea ebp,dword ptr ss:[esp+ecx+7C]
push mdidemo.40576C
push ebp
call mdidemo.4030F0
add esp,C
mov esi,mdidemo.405750
lea edi,dword ptr ss:[esp+14]
mov ecx,6
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
movsw word ptr es:[edi],word ptr ds:[esi]
mov edi,ebp
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
sub edi,ecx
mov edx,ecx
mov esi,edi
mov ecx,FFFFFFFF
lea edi,dword ptr ss:[esp+14]
sub eax,eax
repne scasb al,byte ptr es:[edi]
dec edi
mov ecx,edx
shr ecx,2
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,edx
and ecx,3
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
mov edi,mdidemo.40574C
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
sub edi,ecx
mov edx,ecx
mov esi,edi
mov ecx,FFFFFFFF
lea edi,dword ptr ss:[esp+14]
sub eax,eax
repne scasb al,byte ptr es:[edi]
dec edi
mov ecx,edx
shr ecx,2
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,edx
and ecx,3
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
mov edi,dword ptr ds:[ebx+40569C]
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
sub edi,ecx
mov esi,edi
mov edx,ecx
lea edi,dword ptr ss:[esp+14]
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
dec edi
mov ecx,edx
shr ecx,2
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,edx
push 12010
and ecx,3
push mdidemo.405724
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
lea eax,dword ptr ss:[esp+1C]
push eax
call mdidemo.403050
add esp,C
pop ebp
pop edi
pop esi
pop ebx
add esp,1A8
ret 
mov eax,dword ptr ds:[406FE0]
mov esi,dword ptr ds:[eax+10]
cmp esi,FFFFFFFF
jne mdidemo.402F7F
push FFFFFFF4
call dword ptr ds:[<&GetStdHandle>]
mov esi,eax
mov edx,dword ptr ds:[ebx+40569C]
push 0
lea eax,dword ptr ss:[esp+14]
mov edi,edx
push eax
mov ecx,FFFFFFFF
sub eax,eax
repne scasb al,byte ptr es:[edi]
not ecx
dec ecx
push ecx
push edx
push esi
call dword ptr ds:[<&WriteFile>]
pop ebp
pop edi
pop esi
pop ebx
add esp,1A8
ret 
int3 
int3 
mov eax,dword ptr ss:[esp+4]
test eax,eax
je mdidemo.402FC7
push eax
push 0
mov eax,dword ptr ds:[406FD0]
push eax
call dword ptr ds:[<&HeapFree>]
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ds:[4059FC]
mov ecx,dword ptr ss:[esp+4]
push eax
push ecx
call mdidemo.402FF0
add esp,8
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push esi
push edi
mov esi,dword ptr ss:[esp+C]
cmp esi,FFFFFFE0
jbe mdidemo.403000
xor eax,eax
pop edi
pop esi
ret 
test esi,esi
jne mdidemo.403009
mov esi,1
mov edi,dword ptr ss:[esp+10]
push esi
call mdidemo.403030
add esp,4
test eax,eax
jne mdidemo.40302D
test edi,edi
je mdidemo.40302D
push esi
call mdidemo.403120
add esp,4
test eax,eax
jne mdidemo.40300D
xor eax,eax
pop edi
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
mov ecx,dword ptr ds:[406FD0]
push eax
push 0
push ecx
call dword ptr ds:[<&RtlAllocateHeap>]
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebx
push esi
push edi
xor esi,esi
cmp dword ptr ds:[4059B4],esi
jne mdidemo.40309F
push mdidemo.4059F0
call dword ptr ds:[<&LoadLibraryA>]
mov ebx,eax
test ebx,ebx
je mdidemo.4030DC
push mdidemo.4059E4
mov edi,dword ptr ds:[<&GetProcAddress>]
push ebx
call edi
mov dword ptr ds:[4059B4],eax
test eax,eax
je mdidemo.4030DC
push mdidemo.4059D4
push ebx
call edi
push mdidemo.4059C0
mov dword ptr ds:[4059B8],eax
push ebx
call edi
mov dword ptr ds:[4059BC],eax
mov eax,dword ptr ds:[4059B8]
test eax,eax
je mdidemo.4030AC
call eax
mov esi,eax
test esi,esi
je mdidemo.4030C2
cmp dword ptr ds:[4059BC],0
je mdidemo.4030C2
push esi
call dword ptr ds:[4059BC]
mov esi,eax
mov eax,dword ptr ss:[esp+18]
mov ecx,dword ptr ss:[esp+14]
mov edx,dword ptr ss:[esp+10]
push eax
push ecx
push edx
push esi
call dword ptr ds:[4059B4]
pop edi
pop esi
pop ebx
ret 
xor eax,eax
pop edi
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
mov edi,dword ptr ss:[ebp+8]
mov esi,dword ptr ss:[ebp+C]
mov edx,edi
mov ecx,dword ptr ss:[ebp+10]
jecxz mdidemo.40310E
lodsb al,byte ptr ds:[esi]
or al,al
je mdidemo.40310A
stosb byte ptr es:[edi],al
loop mdidemo.403102
xor al,al
rep stosb byte ptr es:[edi],al
mov eax,edx
pop esi
pop edi
leave 
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ds:[405FC4]
test ecx,ecx
je mdidemo.40313E
mov eax,dword ptr ss:[esp+4]
push eax
call ecx
add esp,4
test eax,eax
je mdidemo.40313E
mov eax,1
ret 
xor eax,eax
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push esi
mov esi,dword ptr ss:[esp+8]
test esi,esi
jne mdidemo.403165
push 0
call mdidemo.403220
add esp,4
pop esi
ret 
push esi
call mdidemo.4031A0
add esp,4
test eax,eax
je mdidemo.403179
mov eax,FFFFFFFF
pop esi
ret 
test byte ptr ds:[esi+D],40
je mdidemo.403198
mov eax,dword ptr ds:[esi+10]
push eax
call mdidemo.4033C0
add esp,4
cmp eax,1
mov eax,0
pop esi
adc eax,FFFFFFFF
ret 
xor eax,eax
pop esi
ret 
int3 
int3 
int3 
int3 
push ebx
push esi
mov esi,dword ptr ss:[esp+C]
push edi
xor edi,edi
mov eax,dword ptr ds:[esi+C]
mov ecx,eax
and cl,3
cmp cl,2
jne mdidemo.4031F2
test eax,108
je mdidemo.4031F2
mov eax,dword ptr ds:[esi+8]
mov ebx,dword ptr ds:[esi]
sub ebx,eax
test ebx,ebx
jle mdidemo.4031F2
push ebx
push eax
mov eax,dword ptr ds:[esi+10]
push eax
call mdidemo.403430
add esp,C
cmp eax,ebx
jne mdidemo.4031E9
mov eax,dword ptr ds:[esi+C]
test al,80
je mdidemo.4031F2
and eax,FFFFFFFD
mov dword ptr ds:[esi+C],eax
jmp mdidemo.4031F2
or dword ptr ds:[esi+C],20
mov edi,FFFFFFFF
mov eax,dword ptr ds:[esi+8]
mov dword ptr ds:[esi],eax
mov eax,edi
mov dword ptr ds:[esi+4],0
pop edi
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push 1
call mdidemo.403220
add esp,4
ret 
int3 
int3 
int3 
int3 
int3 
push ebx
push esi
push edi
xor ebx,ebx
push ebp
xor esi,esi
xor ebp,ebp
mov edi,dword ptr ss:[esp+14]
mov eax,dword ptr ds:[405FCC]
mov ecx,dword ptr ds:[eax+esi]
test ecx,ecx
je mdidemo.403272
mov eax,dword ptr ds:[ecx+C]
test al,83
je mdidemo.403272
cmp edi,1
jne mdidemo.403257
push ecx
call mdidemo.403150
add esp,4
cmp eax,FFFFFFFF
je mdidemo.403272
inc ebx
jmp mdidemo.403272
test edi,edi
jne mdidemo.403272
test al,2
je mdidemo.403272
push ecx
call mdidemo.403150
add esp,4
cmp eax,FFFFFFFF
jne mdidemo.403272
mov ebp,FFFFFFFF
add esi,4
cmp esi,800
jl mdidemo.40322E
mov eax,ebx
cmp edi,1
je mdidemo.403286
mov eax,ebp
pop ebp
pop edi
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
int3 
cmp dword ptr ds:[405FC8],0
push esi
jne mdidemo.4032A6
mov dword ptr ds:[405FC8],200
jmp mdidemo.4032B9
cmp dword ptr ds:[405FC8],14
jge mdidemo.4032B9
mov dword ptr ds:[405FC8],14
push 4
mov eax,dword ptr ds:[405FC8]
push eax
call mdidemo.403660
add esp,8
mov dword ptr ds:[405FCC],eax
test eax,eax
jne mdidemo.4032FB
mov dword ptr ds:[405FC8],14
push 4
push 14
call mdidemo.403660
add esp,8
mov dword ptr ds:[405FCC],eax
test eax,eax
jne mdidemo.4032FB
push 1A
call mdidemo.401EB0
add esp,4
mov ecx,mdidemo.405A40
xor eax,eax
mov edx,dword ptr ds:[405FCC]
add eax,4
mov dword ptr ds:[edx+eax-4],ecx
add ecx,20
cmp eax,50
jl mdidemo.403302
xor esi,esi
mov edx,mdidemo.405A50
mov eax,esi
mov ecx,esi
and eax,FFFFFFE7
and ecx,1F
sar eax,3
mov eax,dword ptr ds:[eax+406FE0]
mov eax,dword ptr ds:[eax+ecx*8]
cmp eax,FFFFFFFF
je mdidemo.40333D
test eax,eax
jne mdidemo.403343
mov dword ptr ds:[edx],FFFFFFFF
add edx,20
inc esi
cmp edx,mdidemo.405AB0
jb mdidemo.40331E
pop esi
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
call mdidemo.403210
cmp byte ptr ds:[405160],0
je mdidemo.403373
jmp mdidemo.4036C0
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
mov edi,dword ptr ss:[ebp+8]
mov edx,edi
xor eax,eax
or ecx,FFFFFFFF
repne scasb al,byte ptr es:[edi]
dec edi
mov esi,edi
mov edi,dword ptr ss:[ebp+C]
push edi
mov ecx,dword ptr ss:[ebp+10]
repne scasb al,byte ptr es:[edi]
jne mdidemo.4033A0
inc ecx
sub ecx,dword ptr ss:[ebp+10]
neg ecx
mov edi,esi
pop esi
rep movsb byte ptr es:[edi],byte ptr ds:[esi]
stosb byte ptr es:[edi],al
mov eax,edx
pop esi
pop edi
leave 
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov edx,dword ptr ss:[esp+4]
cmp edx,dword ptr ds:[406FD4]
jae mdidemo.40341F
mov eax,edx
mov ecx,edx
and eax,FFFFFFE7
and ecx,1F
sar eax,3
mov eax,dword ptr ds:[eax+406FE0]
mov al,byte ptr ds:[eax+ecx*8+4]
and al,1
je mdidemo.40341F
push edx
call mdidemo.403810
add esp,4
push eax
call dword ptr ds:[<&FlushFileBuffers>]
test eax,eax
mov eax,0
jne mdidemo.403406
call dword ptr ds:[<&GetLastError>]
test eax,eax
je mdidemo.40342E
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],eax
mov eax,FFFFFFFF
ret 
mov dword ptr ds:[405120],9
mov eax,FFFFFFFF
ret 
int3 
mov edx,dword ptr ss:[esp+4]
sub esp,418
cmp dword ptr ds:[406FD4],edx
push ebx
push esi
push edi
push ebp
jbe mdidemo.403637
mov eax,edx
and eax,FFFFFFE7
sar eax,3
add eax,mdidemo.406FE0
mov dword ptr ss:[esp+18],eax
mov eax,edx
and eax,1F
mov ecx,dword ptr ss:[esp+18]
shl eax,3
mov ebx,dword ptr ds:[ecx]
mov ebp,eax
mov dword ptr ss:[esp+1C],eax
mov al,byte ptr ds:[ebx+ebp+4]
test al,1
je mdidemo.403637
xor esi,esi
mov ebp,dword ptr ss:[esp+434]
mov dword ptr ss:[esp+20],esi
cmp ebp,esi
jne mdidemo.403499
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,418
ret 
test al,20
je mdidemo.4034AA
push 2
push 0
push edx
call mdidemo.4038D0
add esp,C
mov eax,dword ptr ss:[esp+18]
mov ecx,dword ptr ss:[esp+1C]
add ecx,dword ptr ds:[eax]
test byte ptr ds:[ecx+4],80
je mdidemo.403546
mov dword ptr ss:[esp+10],0
mov edi,dword ptr ss:[esp+430]
mov eax,edi
sub eax,dword ptr ss:[esp+430]
cmp eax,ebp
jae mdidemo.40357F
lea ebx,dword ptr ss:[esp+24]
mov eax,edi
sub eax,dword ptr ss:[esp+430]
cmp eax,ebp
jae mdidemo.40350D
mov al,byte ptr ds:[edi]
inc edi
cmp al,A
jne mdidemo.4034FB
mov byte ptr ds:[ebx],D
inc esi
inc ebx
mov byte ptr ds:[ebx],al
inc ebx
mov eax,ebx
lea ecx,dword ptr ss:[esp+24]
sub eax,ecx
cmp eax,400
jl mdidemo.4034E2
lea eax,dword ptr ss:[esp+24]
push 0
sub ebx,eax
lea ecx,dword ptr ss:[esp+28]
lea eax,dword ptr ss:[esp+18]
mov edx,dword ptr ss:[esp+1C]
push eax
push ebx
push ecx
mov eax,dword ptr ds:[edx]
mov ecx,dword ptr ss:[esp+2C]
mov edx,dword ptr ds:[eax+ecx]
push edx
call dword ptr ds:[<&WriteFile>]
test eax,eax
je mdidemo.403575
mov eax,dword ptr ss:[esp+14]
add dword ptr ss:[esp+20],eax
cmp eax,ebx
jge mdidemo.4034CD
jmp mdidemo.40357F
lea eax,dword ptr ss:[esp+14]
push 0
mov edx,dword ptr ss:[esp+434]
push eax
push ebp
mov ecx,dword ptr ds:[ecx]
push edx
push ecx
call dword ptr ds:[<&WriteFile>]
test eax,eax
je mdidemo.403575
mov dword ptr ss:[esp+10],0
mov eax,dword ptr ss:[esp+14]
mov dword ptr ss:[esp+20],eax
jmp mdidemo.40357F
call dword ptr ds:[<&GetLastError>]
mov dword ptr ss:[esp+10],eax
cmp dword ptr ss:[esp+20],0
jne mdidemo.403626
cmp dword ptr ss:[esp+10],0
je mdidemo.4035D8
cmp dword ptr ss:[esp+10],5
jne mdidemo.4035BB
mov dword ptr ds:[405120],9
mov eax,dword ptr ss:[esp+10]
pop ebp
pop edi
mov dword ptr ds:[405124],eax
mov eax,FFFFFFFF
pop esi
pop ebx
add esp,418
ret 
mov eax,dword ptr ss:[esp+10]
push eax
call mdidemo.403860
add esp,4
mov eax,FFFFFFFF
pop ebp
pop edi
pop esi
pop ebx
add esp,418
ret 
mov eax,dword ptr ss:[esp+18]
mov ecx,dword ptr ss:[esp+1C]
mov edx,dword ptr ds:[eax]
test byte ptr ds:[edx+ecx+4],40
je mdidemo.403602
mov eax,dword ptr ss:[esp+430]
cmp byte ptr ds:[eax],1A
jne mdidemo.403602
xor eax,eax
pop ebp
pop edi
pop esi
pop ebx
add esp,418
ret 
mov eax,FFFFFFFF
pop ebp
mov dword ptr ds:[405120],1C
mov dword ptr ds:[405124],0
pop edi
pop esi
pop ebx
add esp,418
ret 
mov eax,dword ptr ss:[esp+20]
pop ebp
sub eax,esi
pop edi
pop esi
pop ebx
add esp,418
ret 
mov eax,FFFFFFFF
pop ebp
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],0
pop edi
pop esi
pop ebx
add esp,418
ret 
int3 
int3 
int3 
int3 
int3 
push esi
push edi
mov edi,dword ptr ss:[esp+C]
imul edi,dword ptr ss:[esp+10]
test edi,edi
jne mdidemo.403674
mov edi,1
mov esi,dword ptr ds:[<&RtlAllocateHeap>]
mov eax,dword ptr ds:[406FD0]
cmp edi,FFFFFFE0
jbe mdidemo.403688
xor eax,eax
jmp mdidemo.40368E
push edi
push 8
push eax
call esi
test eax,eax
jne mdidemo.4036AF
cmp dword ptr ds:[4059FC],0
je mdidemo.4036AF
push edi
call mdidemo.403120
add esp,4
test eax,eax
mov eax,dword ptr ds:[406FD0]
jne mdidemo.40367F
xor eax,eax
pop edi
pop esi
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebx
push esi
push edi
xor esi,esi
push ebp
mov edi,3
cmp dword ptr ds:[405FC8],edi
jle mdidemo.40372C
mov ebx,C
mov ebp,83
mov eax,dword ptr ds:[405FCC]
mov eax,dword ptr ds:[eax+ebx]
test eax,eax
je mdidemo.403720
test dword ptr ds:[eax+C],ebp
je mdidemo.4036FD
push eax
call mdidemo.403990
add esp,4
cmp eax,FFFFFFFF
je mdidemo.4036FD
inc esi
cmp ebx,50
jl mdidemo.403720
mov eax,dword ptr ds:[405FCC]
mov ecx,dword ptr ds:[eax+ebx]
push ecx
call mdidemo.402FB0
add esp,4
mov ecx,dword ptr ds:[405FCC]
mov dword ptr ds:[ecx+ebx],0
add ebx,4
inc edi
cmp dword ptr ds:[405FC8],edi
jg mdidemo.4036DD
mov eax,esi
pop ebp
pop edi
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push esi
mov esi,dword ptr ss:[esp+8]
mov eax,dword ptr ds:[esi+C]
test al,83
je mdidemo.403777
test al,8
je mdidemo.403777
mov eax,dword ptr ds:[esi+8]
push eax
call mdidemo.402FB0
add esp,4
mov dword ptr ds:[esi],0
and dword ptr ds:[esi+C],FFFFFBF7
mov dword ptr ds:[esi+8],0
mov dword ptr ds:[esi+4],0
pop esi
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[esp+4]
push esi
push edi
cmp dword ptr ds:[406FD4],ecx
jbe mdidemo.4037F4
mov eax,ecx
and eax,FFFFFFE7
sar eax,3
lea edi,dword ptr ds:[eax+406FE0]
mov eax,ecx
and eax,1F
lea esi,dword ptr ds:[eax*8]
mov eax,dword ptr ds:[edi]
add eax,esi
test byte ptr ds:[eax+4],1
je mdidemo.4037F4
cmp dword ptr ds:[eax],FFFFFFFF
je mdidemo.4037F4
cmp dword ptr ds:[40511C],1
jne mdidemo.4037E6
test ecx,ecx
je mdidemo.4037D0
cmp ecx,1
je mdidemo.4037D6
cmp ecx,2
je mdidemo.4037DC
jmp mdidemo.4037E6
push 0
push FFFFFFF6
jmp mdidemo.4037E0
push 0
push FFFFFFF5
jmp mdidemo.4037E0
push 0
push FFFFFFF4
call dword ptr ds:[<&SetStdHandle>]
mov eax,dword ptr ds:[edi]
pop edi
mov dword ptr ds:[eax+esi],FFFFFFFF
xor eax,eax
pop esi
ret 
mov eax,FFFFFFFF
pop edi
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],0
pop esi
ret 
mov ecx,dword ptr ss:[esp+4]
cmp dword ptr ds:[406FD4],ecx
jbe mdidemo.403839
mov eax,ecx
and ecx,1F
and eax,FFFFFFE7
sar eax,3
mov edx,dword ptr ds:[eax+406FE0]
lea eax,dword ptr ds:[edx+ecx*8]
test byte ptr ds:[eax+4],1
je mdidemo.403839
mov eax,dword ptr ds:[eax]
ret 
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],0
mov eax,FFFFFFFF
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ss:[esp+4]
xor ecx,ecx
mov edx,mdidemo.405D00
mov dword ptr ds:[405124],eax
cmp dword ptr ds:[edx],eax
je mdidemo.403895
add edx,8
inc ecx
cmp edx,mdidemo.405E68
jb mdidemo.403870
cmp eax,13
jb mdidemo.4038A2
cmp eax,24
ja mdidemo.4038A2
mov dword ptr ds:[405120],D
ret 
mov eax,dword ptr ds:[ecx*8+405D04]
mov dword ptr ds:[405120],eax
ret 
cmp eax,BC
jb mdidemo.4038BB
cmp eax,CA
ja mdidemo.4038BB
mov dword ptr ds:[405120],8
ret 
mov dword ptr ds:[405120],16
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[esp+4]
push ebx
push esi
cmp ecx,dword ptr ds:[406FD4]
push edi
jae mdidemo.40396F
mov eax,ecx
and eax,FFFFFFE7
sar eax,3
lea edi,dword ptr ds:[eax+406FE0]
mov eax,ecx
and eax,1F
mov edx,dword ptr ds:[edi]
lea esi,dword ptr ds:[eax*8]
test byte ptr ds:[edx+esi+4],1
je mdidemo.40396F
push ecx
call mdidemo.403810
add esp,4
cmp eax,FFFFFFFF
jne mdidemo.403927
mov eax,FFFFFFFF
pop edi
mov dword ptr ds:[405120],9
pop esi
pop ebx
ret 
mov ecx,dword ptr ss:[esp+18]
mov edx,dword ptr ss:[esp+14]
push ecx
push 0
push edx
push eax
call dword ptr ds:[<&SetFilePointer>]
cmp eax,FFFFFFFF
mov ebx,eax
mov eax,0
jne mdidemo.40394C
call dword ptr ds:[<&GetLastError>]
test eax,eax
je mdidemo.403962
push eax
call mdidemo.403860
add esp,4
mov eax,FFFFFFFF
pop edi
pop esi
pop ebx
ret 
mov eax,dword ptr ds:[edi]
pop edi
and byte ptr ds:[eax+esi+4],FD
mov eax,ebx
pop esi
pop ebx
ret 
mov eax,FFFFFFFF
pop edi
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],0
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
push esi
push edi
mov edi,FFFFFFFF
mov esi,dword ptr ss:[esp+C]
mov eax,dword ptr ds:[esi+C]
test al,40
je mdidemo.4039AE
mov dword ptr ds:[esi+C],0
mov eax,edi
pop edi
pop esi
ret 
test al,83
je mdidemo.4039F4
push esi
call mdidemo.4031A0
add esp,4
mov edi,eax
push esi
call mdidemo.403740
add esp,4
mov eax,dword ptr ds:[esi+10]
push eax
call mdidemo.403AF0
add esp,4
test eax,eax
jge mdidemo.4039DD
mov edi,FFFFFFFF
jmp mdidemo.4039F4
mov eax,dword ptr ds:[esi+1C]
test eax,eax
je mdidemo.4039F4
push eax
call mdidemo.402FB0
mov dword ptr ds:[esi+1C],0
add esp,4
mov dword ptr ds:[esi+C],0
mov eax,edi
pop edi
pop esi
ret 
push ebx
push esi
mov eax,dword ptr ss:[esp+18]
or eax,eax
jne mdidemo.403A22
mov ecx,dword ptr ss:[esp+14]
mov eax,dword ptr ss:[esp+10]
xor edx,edx
div ecx
mov ebx,eax
mov eax,dword ptr ss:[esp+C]
div ecx
mov edx,ebx
jmp mdidemo.403A63
mov ecx,eax
mov ebx,dword ptr ss:[esp+14]
mov edx,dword ptr ss:[esp+10]
mov eax,dword ptr ss:[esp+C]
shr ecx,1
rcr ebx,1
shr edx,1
rcr eax,1
or ecx,ecx
jne mdidemo.403A30
div ebx
mov esi,eax
mul dword ptr ss:[esp+18]
mov ecx,eax
mov eax,dword ptr ss:[esp+14]
mul esi
add edx,ecx
jb mdidemo.403A5E
cmp edx,dword ptr ss:[esp+10]
ja mdidemo.403A5E
jb mdidemo.403A5F
cmp eax,dword ptr ss:[esp+C]
jbe mdidemo.403A5F
dec esi
xor edx,edx
mov eax,esi
pop esi
pop ebx
ret 10
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebx
mov eax,dword ptr ss:[esp+14]
or eax,eax
jne mdidemo.403A91
mov ecx,dword ptr ss:[esp+10]
mov eax,dword ptr ss:[esp+C]
xor edx,edx
div ecx
mov eax,dword ptr ss:[esp+8]
div ecx
mov eax,edx
xor edx,edx
jmp mdidemo.403AE1
mov ecx,eax
mov ebx,dword ptr ss:[esp+10]
mov edx,dword ptr ss:[esp+C]
mov eax,dword ptr ss:[esp+8]
shr ecx,1
rcr ebx,1
shr edx,1
rcr eax,1
or ecx,ecx
jne mdidemo.403A9F
div ebx
mov ecx,eax
mul dword ptr ss:[esp+14]
xchg eax,ecx
mul dword ptr ss:[esp+10]
add edx,ecx
jb mdidemo.403ACA
cmp edx,dword ptr ss:[esp+C]
ja mdidemo.403ACA
jb mdidemo.403AD2
cmp eax,dword ptr ss:[esp+8]
jbe mdidemo.403AD2
sub eax,dword ptr ss:[esp+10]
sbb edx,dword ptr ss:[esp+14]
sub eax,dword ptr ss:[esp+8]
sbb edx,dword ptr ss:[esp+C]
neg edx
neg eax
sbb edx,0
pop ebx
ret 10
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebx
push esi
push edi
push ebp
mov edi,dword ptr ss:[esp+14]
cmp dword ptr ds:[406FD4],edi
jbe mdidemo.403B99
mov eax,edi
and eax,FFFFFFE7
sar eax,3
lea ebx,dword ptr ds:[eax+406FE0]
mov eax,edi
and eax,1F
mov ecx,dword ptr ds:[ebx]
lea esi,dword ptr ds:[eax*8]
test byte ptr ds:[ecx+esi+4],1
je mdidemo.403B99
cmp edi,1
je mdidemo.403B31
cmp edi,2
jne mdidemo.403B4B
push 1
call mdidemo.403810
add esp,4
mov ebp,eax
push 2
call mdidemo.403810
add esp,4
cmp ebp,eax
je mdidemo.403B69
push edi
call mdidemo.403810
add esp,4
push eax
call dword ptr ds:[<&CloseHandle>]
test eax,eax
jne mdidemo.403B69
call dword ptr ds:[<&GetLastError>]
mov ebp,eax
jmp mdidemo.403B6B
xor ebp,ebp
push edi
call mdidemo.403780
add esp,4
test ebp,ebp
je mdidemo.403B8B
push ebp
call mdidemo.403860
add esp,4
mov eax,FFFFFFFF
pop ebp
pop edi
pop esi
pop ebx
ret 
mov eax,dword ptr ds:[ebx]
pop ebp
pop edi
mov byte ptr ds:[eax+esi+4],0
xor eax,eax
pop esi
pop ebx
ret 
mov eax,FFFFFFFF
pop ebp
mov dword ptr ds:[405120],9
mov dword ptr ds:[405124],0
pop edi
pop esi
pop ebx
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push 2
call mdidemo.401EB0
add esp,4
ret 
int3 
jmp dword ptr ds:[<&RtlUnwind>]
add byte ptr ds:[eax],al