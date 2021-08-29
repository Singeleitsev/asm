;prog to demonstrate neural net in 64-bit windows vista
format PE64 GUI 5.0
entry start

include '%fasminc%\win64a.inc'
include 'ddraw64.inc'

include 'setcnxnadd64.inc'
include 'cnxnforward64.inc'
include 'calcouterror64.inc'
include 'calcmiderror64.inc'
include 'adjustweights64.inc'
include 'setforiter64.inc'
include 'setrandom64.inc'

include 'storebmp.inc'
include 'showfloats.inc'
include 'bmp.inc'

section '.data' data readable writeable

  _title db '64-bit flat assembler Neural Net Demo',0
  _class db 'Neural64',0

  _error db 'Error',0
  _startup_error db 'Startup failed',0
  _ddraw_error db 'Direct Draw initialization failed (error code 0x%x).',0

section '.bss' readable writeable

  hinstance dq ?
  hwnd dq ?
  wc WNDCLASSEX sizeof.WNDCLASSEX,0,WindowProc,0,0,NULL,NULL,NULL,NULL,NULL,_class,NULL
  msg MSG

  ddsd DDSURFACEDESC
  ddscaps DDSCAPS

  DDraw DirectDraw
  DDSPrimary DirectDrawSurface
  DDSBack DirectDrawSurface

  DDSPicture DirectDrawSurface
  DDPalette DirectDrawPalette

  refresh_needed dd ?
test12345 dq 0
  buffer rb 50000

section '.code' code readable executable

  start:
	sub	rsp,8

	invoke	GetModuleHandle,NULL
	mov	[hinstance],rax
	mov	[wc.hInstance],rax

	invoke	LoadIcon,NULL,IDI_APPLICATION
	mov	[wc.hIcon],rax
	invoke	LoadCursor,NULL,IDC_ARROW
	mov	[wc.hCursor],rax
	invoke	RegisterClassEx,wc
	test	rax,rax
	jz	startup_error

	invoke	CreateWindowEx,\
		0,_class,_title,WS_POPUP+WS_VISIBLE,0,0,0,0,NULL,NULL,[hinstance],NULL
	test	rax,rax
	jz	startup_error
	mov	[hwnd],rax

	invoke	DirectDrawCreate,NULL,DDraw,NULL
	test	rax,rax
	jnz	ddraw_error

	cominvk DDraw,SetCooperativeLevel,\
		[hwnd],DDSCL_EXCLUSIVE+DDSCL_FULLSCREEN
	test	rax,rax
	jnz	ddraw_error

	cominvk DDraw,SetDisplayMode,\
		800,600,32 ; 640,480,16
	test	rax,rax
	jnz	ddraw_error

	mov	[ddsd.dwSize],sizeof.DDSURFACEDESC
	mov	[ddsd.dwFlags],DDSD_CAPS
	mov	[ddsd.ddsCaps.dwCaps],DDSCAPS_PRIMARYSURFACE
	cominvk DDraw,CreateSurface,\
		ddsd,DDSPrimary,NULL
	test	rax,rax
	jnz	ddraw_error
;initialise net
	       mov [caddress0abs], cnxns    ; cnxn0 address
	       mov [naddress0abs], neurons ; nin0    ; neuron0 address
	       call setcnxnadd
	       call setrand

refresh:

	cominvk DDSPrimary,IsLost
	test	rax,rax
	jz	paint
	cmp	eax,DDERR_SURFACELOST
	jne	end_loop
	cominvk DDSPrimary,Restore

    paint:
 ;These offsets step through corresponding pairs of input and output BMPs
	mov rax, [addoffset]
	add rax, 192
	cmp rax, 1920
	jnz saveadd
	 mov rax, 0
saveadd: mov [addoffset], rax
	mov rax, [addoffset2]
	add rax, 64
	cmp rax, 640
	jnz saveadd2
	 mov rax, 0
saveadd2: mov [addoffset2], rax

	mov	[ddsd.dwSize],sizeof.DDSURFACEDESC
	mov	[ddsd.dwFlags],0
	cominvk DDSPrimary,Lock,NULL,ddsd,DDLOCK_SURFACEMEMORYPTR,NULL
	test	rax,rax
	jnz	main_loop
;---------------------------------------------------------------------
	mov r11, [counter2]    ;iteration counter
	inc r11
	cmp r11, 1
	mov [counter2], r11
	jne skipdisplay2
	 call	 load_picture  ;displays original bitmap
	 call storebmp	       ;bitmap array to float array
skipdisplay2:
	 call setforiter1      ;float to net input
	 call cnxnforward      ;all forward
	 call calcouterror     ;output error function
	 call calcmiderror     ;middle error function
	 call adjust1	       ;adjust all weights
	 call showfloats       ;display network output floats
;----------------------------------------------------------------------
	cominvk DDSPrimary,Unlock,NULL
       mov     [refresh_needed],0

main_loop:

	invoke	PeekMessage,msg,NULL,0,0,PM_NOREMOVE
	or	eax,eax
	jz	no_message
	invoke	GetMessage,msg,NULL,0,0
	cmp	eax,1
	jb	end_loop
	jne	no_message
	invoke	TranslateMessage,msg
	invoke	DispatchMessage,msg

	cmp	[refresh_needed],0
	jne	refresh
	jmp	main_loop

    no_message:
	jmp paint

ddraw_error:
	invoke	wsprintf,buffer,_ddraw_error,rax
	invoke	MessageBox,[hwnd],buffer,_error,MB_OK+MB_ICONERROR
	invoke	DestroyWindow,[hwnd]
	invoke	PostQuitMessage,1
	jmp	main_loop

startup_error:
	invoke	MessageBox,[hwnd],_startup_error,_error,MB_OK+MB_ICONERROR

end_loop:
	invoke	ExitProcess,[msg.wParam]

proc WindowProc uses rbx rsi rdi, hwnd,wmsg,wparam,lparam
	cmp	edx,WM_CREATE
	je	.wmcreate
	cmp	edx,WM_DESTROY
	je	.wmdestroy
	cmp	edx,WM_KEYDOWN
	je	.wmkeydown
	cmp	edx,WM_ACTIVATE
	je	.wmactivate
    .defwindowproc:
	invoke	DefWindowProc,rcx,rdx,r8,r9
	jmp	.finish
    .wmcreate:
	xor	eax,eax
	jmp	.finish
    .wmactivate:
	test	r8,r8
	jz	.finish
	or	[refresh_needed],1
	jmp	.finish
    .wmkeydown:
	cmp	r8d,VK_ESCAPE
	jne	.finish
    .wmdestroy:
	cominvk DDraw,RestoreDisplayMode
	cominvk DDraw,Release
	invoke	PostQuitMessage,0
	xor	eax,eax
    .finish:
	ret
endp

section '.idata' import data readable

  library kernel32,'KERNEL32.DLL',\
	  user32,'USER32.DLL',\
	  ddraw,'DDRAW.DLL'

  include '%fasminc%\api\kernel32.inc'
  include '%fasminc%\api\user32.inc'

  import ddraw,\
	 DirectDrawCreate,'DirectDrawCreate'

include 'data.inc'