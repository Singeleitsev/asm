
; Simple text editor - fasm example program

format PE GUI 4.0
entry start

include 'win32a.inc'

IDR_MENU = 37

IDM_NEW   = 101
IDM_EXIT  = 102
IDM_ABOUT = 901

section '.text' code readable executable

  start:
	invoke	GetModuleHandle,0
	mov	[wc.hInstance],eax
	invoke	LoadIcon,eax,IDI_APPLICATION
	mov	[wc.hIcon],eax
	invoke	LoadCursor,0,IDC_ARROW
	mov	[wc.hCursor],eax
	invoke	RegisterClass,wc
	test	eax,eax
	jz	error

	invoke	LoadMenu,[wc.hInstance],IDR_MENU
	invoke	CreateWindowEx,0,_class,_title,10CF0000h,144,128,256,256,NULL,eax,[wc.hInstance],NULL
	test	eax,eax
	jz	error

  msg_loop:
	invoke	GetMessage,msg,NULL,0,0
	cmp	eax,1
	jb	end_loop
	jne	msg_loop
	invoke	TranslateMessage,msg
	invoke	DispatchMessage,msg
	jmp	msg_loop

  error:
	invoke	MessageBox,NULL,_error,NULL,10h

  end_loop:
	invoke	ExitProcess,[msg.wParam]

proc WindowProc hwnd,wmsg,wparam,lparam
	push	ebx esi edi
	mov	eax,[wmsg]
	cmp	eax,WM_CREATE
	je	.wmcreate
	cmp	eax,WM_SIZE
	je	.wmsize
	cmp	eax,WM_SETFOCUS
	je	.wmsetfocus
	cmp	eax,WM_COMMAND
	je	.wmcommand
	cmp	eax,WM_DESTROY
	je	.wmdestroy
  .defwndproc:
	invoke	DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
	jmp	.finish
  .wmcreate:
	invoke	GetClientRect,[hwnd],client
	invoke	CreateWindowEx,WS_EX_CLIENTEDGE,_edit,0,WS_VISIBLE+WS_CHILD+WS_HSCROLL+WS_VSCROLL+ES_AUTOHSCROLL+ES_AUTOVSCROLL+ES_MULTILINE,[client.left],[client.top],[client.right],[client.bottom],[hwnd],0,[wc.hInstance],NULL
	or	eax,eax
	jz	.failed
	mov	[edithwnd],eax
	invoke	CreateFont,16,0,0,0,0,FALSE,FALSE,FALSE,ANSI_CHARSET,OUT_RASTER_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,FIXED_PITCH+FF_DONTCARE,NULL
	or	eax,eax
	jz	.failed
	mov	[editfont],eax
	invoke	SendMessage,[edithwnd],WM_SETFONT,eax,FALSE
	xor	eax,eax
	jmp	.finish
      .failed:
	or	eax,-1
	jmp	.finish
  .wmsize:
	invoke	GetClientRect,[hwnd],client
	invoke	MoveWindow,[edithwnd],[client.left],[client.top],[client.right],[client.bottom],TRUE
	xor	eax,eax
	jmp	.finish
  .wmsetfocus:
	invoke	SetFocus,[edithwnd]
	xor	eax,eax
	jmp	.finish
  .wmcommand:
	mov	eax,[wparam]
	and	eax,0FFFFh
	cmp	eax,IDM_NEW
	je	.new
	cmp	eax,IDM_ABOUT
	je	.about
	cmp	eax,IDM_EXIT
	je	.wmdestroy
	jmp	.defwndproc
      .new:
	invoke	SendMessage,[edithwnd],WM_SETTEXT,0,0
	jmp	.finish
      .about:
	invoke	MessageBox,[hwnd],_about_text,_about_title,MB_OK
	jmp	.finish
  .wmdestroy:
	invoke	DeleteObject,[editfont]
	invoke	PostQuitMessage,0
	xor	eax,eax
  .finish:
	pop	edi esi ebx
	ret
endp

section '.data' data readable writeable

  _title TCHAR 'MiniPad',0
  _about_title TCHAR 'About MiniPad',0
  _about_text TCHAR 'This is Win32 example program created with flat assembler.',0
  _error TCHAR 'Startup failed.',0

  _class TCHAR 'MINIPAD32',0
  _edit TCHAR 'EDIT',0

  wc WNDCLASS 0,WindowProc,0,0,NULL,NULL,NULL,COLOR_BTNFACE+1,NULL,_class

  edithwnd dd ?
  editfont dd ?

  msg MSG
  client RECT

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  user,'USER32.DLL',\
	  gdi,'GDI32.DLL'

  import kernel,\
	 GetModuleHandle,'GetModuleHandleA',\
	 ExitProcess,'ExitProcess'

  import user,\
	 RegisterClass,'RegisterClassA',\
	 CreateWindowEx,'CreateWindowExA',\
	 DefWindowProc,'DefWindowProcA',\
	 SetWindowLong,'SetWindowLongA',\
	 RedrawWindow,'RedrawWindow',\
	 GetMessage,'GetMessageA',\
	 TranslateMessage,'TranslateMessage',\
	 DispatchMessage,'DispatchMessageA',\
	 SendMessage,'SendMessageA',\
	 LoadCursor,'LoadCursorA',\
	 LoadIcon,'LoadIconA',\
	 LoadMenu,'LoadMenuA',\
	 GetClientRect,'GetClientRect',\
	 MoveWindow,'MoveWindow',\
	 SetFocus,'SetFocus',\
	 MessageBox,'MessageBoxA',\
	 PostQuitMessage,'PostQuitMessage'

  import gdi,\
	 CreateFont,'CreateFontA',\
	 DeleteObject,'DeleteObject'

section '.rsrc' resource data readable

  ; resource directory

  directory RT_MENU,menus,\
	    RT_VERSION,versions

  ; resource subdirectories

  resource menus,\
	   IDR_MENU,LANG_ENGLISH+SUBLANG_DEFAULT,main_menu

  resource versions,\
	   1,LANG_NEUTRAL,version

  menu main_menu
       menuitem '&File',0,MFR_POPUP
		menuitem '&New',IDM_NEW
		menuseparator
		menuitem 'E&xit',IDM_EXIT,MFR_END
       menuitem 'Edit',0,MFR_POPUP
		menuitem 'Undo',IDM_NEW
		menuitem 'Redo',IDM_NEW
		menuseparator
		menuitem 'Select all',IDM_NEW
		menuitem 'Undo select',IDM_NEW
		menuitem 'Redo select',IDM_NEW
		menuseparator
		menuitem 'Copy',IDM_NEW
		menuitem 'Copy with base point',IDM_NEW
		menuitem 'Cut',IDM_NEW
		menuitem 'Cut with base point',IDM_NEW
		menuitem 'Paste',IDM_NEW
		menuitem 'Paste as block',IDM_NEW
		menuitem 'Scale',IDM_NEW
		menuseparator
		menuitem 'Drag',IDM_NEW
		menuitem 'Drag a copy',IDM_NEW
		menuitem 'Rotate',IDM_NEW
		menuitem 'Rotate a copy',IDM_NEW
		menuitem 'Mirror',IDM_NEW
		menuitem 'Mirror a copy',IDM_NEW
		menuseparator
		menuitem 'Explode',IDM_NEW
		menuseparator
		menuitem 'Find',IDM_NEW
		menuitem 'Find text',IDM_EXIT,MFR_END
       menuitem 'Elements',0,MFR_POPUP
		menuitem 'Line',IDM_NEW
		menuitem 'Arc',IDM_NEW
		menuitem 'Hatch',IDM_NEW
		menuitem 'Drawing',IDM_NEW
		menuitem 'Mark',IDM_NEW
		menuseparator
		menuitem 'Column',IDM_NEW
		menuitem 'Wall',IDM_NEW
		menuitem 'Slab',IDM_NEW
		menuitem 'Truss',IDM_NEW
		menuitem 'Roof',IDM_EXIT,MFR_END
       menuitem 'Materials',0,MFR_POPUP
		menuitem 'Concrete',IDM_NEW
		menuseparator
		menuitem 'E&xit',IDM_EXIT,MFR_END
       menuitem '&Help',0,MFR_POPUP + MFR_END
		menuitem '&About...',IDM_ABOUT,MFR_END

  versioninfo version,VOS__WINDOWS32,VFT_APP,VFT2_UNKNOWN,LANG_ENGLISH+SUBLANG_DEFAULT,0,\
	      'FileDescription','MiniPad - example program',\
	      'LegalCopyright','No rights reserved.',\
	      'FileVersion','1.0',\
	      'ProductVersion','1.0',\
	      'OriginalFilename','MINIPAD.EXE'
