WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD

;Assembler will add this prologue automatically:
 ;push rbp
 ;mov rbp,rsp

LOCAL hAccel:QWORD
LOCAL hwndFrame:QWORD, hwndClient:QWORD
LOCAL msg:MSG64
LOCAL wndclass:WNDCLASSEX64

;Align the Stack by 10h
 and rsp,-16
;Store Parameters
 mov hInstance,rcx
 mov g_hInst,rcx
 mov hPrevInstance,rdx
 mov szCmdLine,r8
 mov iCmdShow,r9

;if (!hPrevInstance)
 cmp hPrevInstance,0
 jne lblLoadMenu ;Skip RegisterClass

;Fill the wndclass Structure
 mov wndclass.cbSize,50h ;sizeof (wndclass)
 mov wndclass.style,3 ;CS_HREDRAW | CS_VREDRAW
 m64addr wndclass.lpfnWndProc,FrameWndProc
 mov wndclass.cbClsExtra,0
 mov wndclass.cbWndExtra,0
 m64m64 wndclass.hInstance,hInstance
 Call2 LoadIconA,0,7F00h ;IDI_APPLICATION
 mov wndclass.hIcon,rax
 mov wndclass.hIconSm,rax
 Call2 LoadCursorA,0,7F00h ;IDC_ARROW
 mov wndclass.hCursor,rax
 mov wndclass.hbrBackground,0Dh ;COLOR_APPWORKSPACE + 1
 mov wndclass.lpszMenuName,0
 m64addr wndclass.lpszClassName,szFrameClass
;Register the Frame Window Class
 sub rsp,20h
 lea rcx,wndclass
 call RegisterClassExA
 add rsp,20h

;Re-Fill the wndclass Structure
 m64addr wndclass.lpfnWndProc,HelloWndProc
 mov wndclass.cbWndExtra,8 ;sizeof (HANDLE)
 Call1 GetStockObject,0 ;WHITE_BRUSH
 mov wndclass.hbrBackground,rax
 m64addr wndclass.lpszClassName,szHelloClass
;Register the Hello Child Window Class
 sub rsp,20h
 lea rcx,wndclass
 call RegisterClassExA
 add rsp,20h

;Re-Fill the wndclass Structure
 m64addr wndclass.lpfnWndProc,RectWndProc
 m64addr wndclass.lpszClassName,szRectClass
;Register the Rect Child Window Class
 sub rsp,20h
 lea rcx,wndclass
 call RegisterClassExA
 add rsp,20h


;Obtain handles to three possible menus & submenus
lblLoadMenu:
 Call2 LoadMenuA,g_hInst,MdiMenuInit
 mov g_hMenuInit,rax
 Call2 LoadMenuA,g_hInst,MdiMenuHello
 mov g_hMenuHello,rax
 Call2 LoadMenuA,g_hInst,MdiMenuRect
 mov g_hMenuRect,rax

 Call2 GetSubMenu,g_hMenuInit,INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
 mov g_hMenuInitWindow,rax
 Call2 GetSubMenu,g_hMenuHello,HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
 mov g_hMenuHelloWindow,rax
 Call2 GetSubMenu,g_hMenuRect,RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
 mov g_hMenuRectWindow,rax

;Load accelerator table
 Call2 LoadAcceleratorsA,g_hInst,MdiAccel
 mov hAccel,rax

;Create the Frame Window
 sub rsp,60h
 xor rcx,rcx ;dwExStyle
 lea rdx,szFrameClass ;lpClassName
 lea r8,szFrameTitle ;lpWindowName
 mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN
 mov rax,80000000h ;CW_USEDEFAULT
 mov qword ptr [rsp+20h],rax ;x
 mov qword ptr [rsp+28h],rax ;y
 mov qword ptr [rsp+30h],rax ;nWidth
 mov qword ptr [rsp+38h],rax ;nHeight
 mov qword ptr [rsp+40h],0 ;hWndParent
 m64m64 qword ptr [rsp+48h],g_hMenuInit ;hMenu
 m64m64 qword ptr [rsp+50h],hInstance
 mov qword ptr [rsp+58h],0 ;lpParam
 call CreateWindowExA
 add rsp,60h
 mov hwndFrame,rax


 Call2 GetWindow,hwndFrame,5 ;GW_CHILD = 5
 mov hwndClient,rax

 Call2 ShowWindow,hwndFrame,1 ;nCmdShow = SW_SHOWNORMAL = 1

 Call1 UpdateWindow,hwndFrame

MsgLoop:
;Critical Section, no Macros
  sub rsp,20h
  lea rcx,msg
  xor rdx,rdx
  xor r8,r8
  xor r9,r9
  call GetMessageA
  add rsp,20h
  test rax,rax
  je CleanUp

  sub rsp,20h
  mov rcx,hwndClient
  lea rdx,msg
  call TranslateMDISysAccel
  add rsp,20h
  cmp rax,0
  jne MsgLoop

  sub rsp,20h
  mov rcx,hwndFrame
  mov rdx,hAccel
  lea r8,msg
  call TranslateAccelerator
  add rsp,20h
  cmp rax,0
  jne MsgLoop

  sub rsp,20h
  lea rcx,msg
  call TranslateMessage
  ;add rsp,20h
  ;sub rsp,20h
  lea rcx,msg
  call DispatchMessageA
  add rsp,20h
jmp MsgLoop

;Clean up by deleting unattached menus
CleanUp:
 Call1 DestroyMenu,g_hMenuHello
 Call1 DestroyMenu,g_hMenuRect

;return msg.wParam ;
 mov rax,msg.wParam

endWinMain:
;Assembler will add this epilogue automatically:
 ;leave
 ret ;10h

WinMain endp
