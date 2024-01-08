option casemap:none
;Standard Libraries
	includelib F:\bin\dev\ml64\VS2019\lib\user32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\kernel32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\gdi32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\OpenGL32.lib

;Custom Includes
	include include\API64.inc
	include include\Call.inc
	include include\Mem.inc
	include include\OpenGL64.inc
	include include\Spell.inc
	include include\struct64.inc

.const
;Temporarily Empty

.data

 _title db 'OpenGL example',0
 _class db 'MASMOPENGL32',0

 ;theta GLfloat 0.6
 theta dd 0.6

 ;wc WNDCLASS 0,WindowProc,0,0, 0,0,0,0,0,_class
 wc WNDCLASSEX64 <>

 hdc dq ?
 hrc dq ?

 msg MSG64 <>
 rc RECT64 <>
 pfd PIXELFORMATDESCRIPTOR64 <>

 clock dd ?

.data?
;Temporarily Empty

.code

WinMain proc

sub rsp,8

sub rsp,20h
mov rcx,0
call GetModuleHandleA
add rsp,20h
mov wc.hInstance,rax

;Register Class
;Fill the  WNDCLASSEX64 Structure
 mov wc.cbSize,50h
 lea rax,WindowProc
 mov wc.lpfnWndProc,rax
 lea rax,_class
 mov wc.lpszClassName,rax
;Load Icon
 sub rsp,20h
 mov rcx,0
 mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
 call LoadIconA
 add rsp,20h
 mov wc.hIcon,rax
;Load Cursor
 sub rsp,20h
 mov rcx,0
 mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
 call LoadCursorA
 add rsp,20h
 mov wc.hCursor,rax
;Now call the Function
 sub rsp,20h
 lea rcx,wc
 call RegisterClassExA
 add rsp,20h

;Create the Window
 sub rsp,60h
 mov rcx,0 ;dwExStyle
 lea rdx,_class
 lea r8,_title
 mov r9,16CF0000h ;dwStyle = WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS = 16CF.0000h
 mov qword ptr [rsp+20h],10h ;x = 16
 mov qword ptr [rsp+28h],10h ;y = 16
 mov qword ptr [rsp+30h],1B0h ;nWidth = 432
 mov qword ptr [rsp+38h],1B0h ;nHeight = 432
 mov qword ptr [rsp+40h],0 ;hWndParent 
 mov qword ptr [rsp+48h],0 ;hMenu
 mov rax,wc.hInstance
 mov qword ptr [rsp+50h],rax
 mov qword ptr [rsp+58h],0
 call CreateWindowExA
 add rsp,60h

;Store the Handle
;mov hWndMain,rax

msg_loop:
 sub rsp,20h
 lea rcx,msg
 mov rdx,0
 mov r8,0
 mov r9,0
 call GetMessageA
 add rsp,20h
 cmp eax,1
 jb end_loop
 jne msg_loop
 sub rsp,20h
 lea rcx,msg
 call TranslateMessage
 add rsp,20h
 sub rsp,20h
 lea rcx,msg
 call DispatchMessageA
 add rsp,20h
 jmp msg_loop
end_loop:
 sub rsp,20h
 mov rcx,msg.wParam
 call ExitProcess
 add rsp,20h

WinMain endp


;==================================================================================
WindowProc proc uses rbx rdi rsi hwnd:QWORD, wmsg:QWORD, wparam:QWORD, lparam:QWORD
;==================================================================================
;push rbp
;mov rbp,rsp

sub rsp,8

;push rbx
;push rsi
;push rdi

mov hwnd,rcx

sub rsp,20h ;frame

cmp edx,1
je lbl_wmcreate
cmp edx,5
je lbl_wmsize
cmp edx,0Fh
je lbl_wmpaint
cmp edx,100h
je lbl_wmkeydown
cmp edx,2
je lbl_wmdestroy


lbl_defwndproc:
 call DefWindowProcA
 jmp lbl_finish


lbl_wmcreate:
 call GetDC
 mov hdc,rax

 lea rdi,pfd
 mov rcx,5 ;sizeof.PIXELFORMATDESCRIPTOR shr 3
 
 xor eax,eax
 ;rep stosq qword ptr [rdi],rax
 rep stosq
 
 mov pfd.nSize,28h
 mov pfd.nVersion,1
 mov pfd.dwFlags,25h
 mov pfd.iLayerType,0
 mov pfd.iPixelType,0
 mov pfd.cColorBits,10h
 mov pfd.cDepthBits,10h
 mov pfd.cAccumBits,0
 mov pfd.cStencilBits,0

 mov rcx,hdc
 lea rdx,pfd
 call ChoosePixelFormat

 mov rcx,hdc
 mov edx,eax
 lea r8,pfd
 call SetPixelFormat
 
 mov rcx,hdc
 call wglCreateContext
 mov hrc,rax
 
 mov rcx,hdc
 mov rdx,hrc
 call wglMakeCurrent
 
 mov rcx,hwnd
 lea rdx,rc
 call GetClientRect
 
 mov rcx,0
 mov rdx,0
 mov r8d,rc.right
 mov r9d,rc.bottom
 call glViewport
 
 call GetTickCount
 mov clock,eax

 xor eax,eax
 jmp lbl_finish


lbl_wmsize:
 mov rcx,hwnd
 lea rdx,rc
 call GetClientRect

 mov rcx,0
 mov rdx,0
 mov r8d,rc.right
 mov r9d,rc.bottom
 call glViewport

 xor eax,eax
 jmp lbl_finish


lbl_wmpaint:
 call GetTickCount
 sub eax,clock
 cmp eax,0Ah
 jb lbl_animation_ok

 add clock,eax

 movd xmm0,theta
 mov eax,0
 movd xmm1,eax
 mov eax,0
 movd xmm2,eax
 mov eax,3F800000h ;1.0f
 movd xmm3,eax
 call glRotatef


lbl_animation_ok:
 mov rcx,4000h ;GL_COLOR_BUFFER_BIT
 call glClear
 
 mov rcx,7 ;GL_QUADS
 call glBegin
 
 mov eax,3F800000h ;1.0f
 movd xmm0,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm2,eax
 call glColor3f
 
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm0,rax
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3DCCCCCDh ;0.1f
 movd xmm0,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm2,eax
 call glColor3f
 
 mov rax,3FE3333333333333h ;0.6f
 movq xmm0,rax
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3DCCCCCDh ;0.1f
 movd xmm0,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3F800000h ;1.0f
 movd xmm2,eax
 call glColor3f
 
 mov rax,3FE3333333333333h ;0.6f
 movq xmm0,rax
 mov rax,3FE3333333333333h ;0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 mov eax,3F800000h ;1.0f
 movd xmm0,eax
 mov eax,3DCCCCCDh ;0.1f
 movd xmm1,eax
 mov eax,3F800000h ;1.0f
 movd xmm2,eax
 call glColor3f
 
 mov rax,0BFE3333333333333h ;-0.6f
 movq xmm0,rax
 mov rax,3FE3333333333333h ;0.6f
 movq xmm1,rax
 mov rax,0
 movq xmm2,rax
 call glVertex3d
 
 call glEnd
 
 mov rcx,hdc
 call SwapBuffers
 
 xor eax,eax
 jmp lbl_finish



lbl_wmkeydown:
 cmp r8d,1Bh ;VK_ESCAPE
 jne lbl_defwndproc


lbl_wmdestroy:
 mov rcx,0
 mov rdx,0
 call wglMakeCurrent
 
 mov rcx,hrc
 call wglDeleteContext
 
 mov rcx,hwnd
 mov rdx,hdc
 call ReleaseDC
 
 mov rcx,0
 call PostQuitMessage
 xor eax,eax

 
lbl_finish:
 add rsp,20h
 ;pop rdi
 ;pop rsi
 ;pop rbx

;leave   
ret

WindowProc endp

end

