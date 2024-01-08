
sleep:
	invoke	WaitMessage
	jmp	main_loop

ddraw_error:
	mov	eax, outhex1 ; _ddraw_error
	jmp	error
open_error:
;      mov eax, 012345678h
;      mov eax, [ddsd.ddpfPixelFormat]
;      mov eax,  [gdisurface1]
;      mov ebx,  eax
;      mov eax, [ebx]
;            mov     eax,[BMPHEADER.biheight] ; ID ; outhex1 ; _open_error
	  ;  mov eax, 12345678h
;      mov [inbin1], ax
;      shr eax, 16
;      mov [secondhex], ax
;      mov ax, [inbin1]
;      call HexOut
;      mov [outhex3], bx
;      mov [outhex4], ax
;      mov ax, [secondhex]
;      call HexOut
;      mov [outhex1], bx
;      mov [outhex2], ax

;        mov     eax, outhex1
    error:
	invoke	MessageBox,[hwnd],eax,_error,MB_OK
	invoke	DestroyWindow,[hwnd]
	invoke	PostQuitMessage,1
	jmp	main_loop

end_loop:
	invoke	ExitProcess,[msg.wParam]



proc WindowProc, hwnd,wmsg,wparam,lparam
	push	ebx esi edi
	mov	eax,[wmsg]
	cmp	eax,WM_CREATE
	je	wmcreate
	cmp	eax,WM_DESTROY
	je	wmdestroy
	cmp	eax,WM_ACTIVATE
	je	wmactivate
	cmp	eax,WM_SETCURSOR
	je	wmsetcursor
	cmp	eax,WM_KEYDOWN
	je	wmkeydown
    defwindowproc:
	invoke	DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
	jmp	finish
    wmcreate:
	xor	eax,eax
	jmp	finish
    wmkeydown:
	cmp	[wparam],VK_ESCAPE
	jne	finish
    wmdestroy:
	cominvk DDraw,RestoreDisplayMode
	cominvk DDraw,Release
	invoke	PostQuitMessage,0
	xor	eax,eax
	jmp	finish
    wmactivate:
	mov	eax,[wparam]
	mov	[active],al
	jmp	finish
    wmsetcursor:
	invoke	SetCursor,0
	xor	eax,eax
    finish:
	pop	edi esi ebx
	ret ; urn
endp

section '.idata' import data readable

  library kernel,'KERNEL32.DLL',\
	  user,'USER32.DLL',\
	  ddraw,'DDRAW.DLL'

  import kernel,\
	 GetModuleHandle,'GetModuleHandleA',\
	 CreateFile,'CreateFileA',\
	 ReadFile,'ReadFile',\
	 CloseHandle,'CloseHandle',\
	 GetTickCount,'GetTickCount',\
	 ExitProcess,'ExitProcess'

  import user,\
	 RegisterClass,'RegisterClassA',\
	 CreateWindowEx,'CreateWindowExA',\
	 DestroyWindow,'DestroyWindow',\
	 DefWindowProc,'DefWindowProcA',\
	 GetMessage,'GetMessageA',\
	 PeekMessage,'PeekMessageA',\
	 TranslateMessage,'TranslateMessage',\
	 DispatchMessage,'DispatchMessageA',\
	 LoadCursor,'LoadCursorA',\
	 LoadIcon,'LoadIconA',\
	 SetCursor,'SetCursor',\
	 MessageBox,'MessageBoxA',\
	 PostQuitMessage,'PostQuitMessage',\
	 WaitMessage,'WaitMessage'

  import ddraw,\
	 DirectDrawCreate,'DirectDrawCreate'

