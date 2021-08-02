;OpenGL programming example

format PE64 GUI 5.0
entry start

;include '..\INCLUDE\win64a.inc'
include 'F:\bin\dev\asm\fasmw17164\INCLUDE\win64a.inc'
;include '..\EXAMPLES\OPENGL\opengl.inc'
include 'F:\bin\dev\asm\fasmw17164\EXAMPLES\OPENGL\opengl.inc'

struc CustomPoint x,y,z,t,r,g,b,a
 {
 .x dd x ;00h
 .y dd y ;04h
 .z dd z ;08h
 .t dd t ;0Ch
 .r dd r ;10h
 .g dd g ;14h
 .b dd b ;18h
 .a dd a ;1Ch
 }

section '.text' code readable executable

 start:
 sub rsp,8 ; Make stack dqword aligned

 invoke GetModuleHandle,0
 mov [wc.hInstance],rax
 invoke LoadIcon,0,IDI_APPLICATION
 mov [wc.hIcon],rax
 invoke LoadCursor,0,IDC_ARROW
 mov [wc.hCursor],rax
 invoke RegisterClass,wc
 invoke CreateWindowEx,0,_class,_title,WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS,16,16,432,432,NULL,NULL,[wc.hInstance],NULL

 msg_loop:
 invoke GetMessage,addr msg,NULL,0,0
 cmp eax,1
 jb end_loop
 jne msg_loop
 invoke TranslateMessage,addr msg
 invoke DispatchMessage,addr msg
 jmp msg_loop

 end_loop:
 invoke ExitProcess,[msg.wParam]

proc WindowProc uses rbx rsi rdi, hwnd,wmsg,wparam,lparam
 mov [hwnd],rcx
 frame

 cmp edx,WM_PAINT
 je .wmpaint
 cmp edx,WM_KEYDOWN
 je .wmkeydown
 cmp edx,WM_SIZE
 je .wmsize
 cmp edx,WM_DESTROY
 je .wmdestroy
 cmp edx,WM_CREATE
 je .wmcreate

.defwndproc:
 invoke DefWindowProc,rcx,rdx,r8,r9
 jmp .finish

.wmcreate:
 invoke GetDC,rcx
 mov [hdc],rax
 lea rdi,[pfd]
 mov rcx,sizeof.PIXELFORMATDESCRIPTOR shr 3
 xor eax,eax
 rep stosq
 mov [pfd.nSize],sizeof.PIXELFORMATDESCRIPTOR
 mov [pfd.nVersion],1
 mov [pfd.dwFlags],PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
 mov [pfd.iLayerType],PFD_MAIN_PLANE
 mov [pfd.iPixelType],PFD_TYPE_RGBA
 mov [pfd.cColorBits],16
 mov [pfd.cDepthBits],16
 mov [pfd.cAccumBits],0
 mov [pfd.cStencilBits],0
 invoke ChoosePixelFormat,[hdc],addr pfd
 invoke SetPixelFormat,[hdc],eax,addr pfd
 invoke wglCreateContext,[hdc]
 mov [hrc],rax
 invoke wglMakeCurrent,[hdc],[hrc]
 invoke GetClientRect,[hwnd],addr rc
 invoke glViewport,0,0,[rc.right],[rc.bottom]
 invoke GetTickCount
 mov [clock],eax
 xor eax,eax
 jmp .finish

.wmsize:
 invoke GetClientRect,[hwnd],addr rc
 invoke glViewport,0,0,[rc.right],[rc.bottom]
 xor eax,eax
 jmp .finish

.wmpaint:
 invoke GetTickCount
 sub eax,[clock]
 cmp eax,10
 jb .animation_ok
 add [clock],eax
 invoke glRotatef, float [aXY],float [aXZ], float [aYZ], float dword 1.0
.animation_ok:
 invoke glClear,GL_COLOR_BUFFER_BIT
 invoke glBegin,GL_POINTS

 mov [i],3 ;Number of Vertices
 mov rsi,A ;Attractor Base Address
.SieveVertex:
 invoke glColor3f, float dword [rsi+10h], float dword [rsi+14h], float dword [rsi+18h]
 invoke glVertex3f, float dword [rsi+0], float dword [rsi+4], float dword [rsi+8]
 add rsi,20h ;Size of CustomPoint Structure
 dec [i]
 cmp [i],0
 jg .SieveVertex

mov [i],10000h
.SieveNewPoint:
;P.x = (P.x + N.x)/2,
;P.y = (P.y + N.y)/2,
;P.z = (P.z + N.z)/2,
;where
;P.x,P.y,P.z - coordinates of Point
;N.x,N.y,N.z - coordinates of randomly selected Vertex

;jmp lblSieveRandMode
include 'SieveRdRand.asm'

;jmp lblSieveCalcMode
;include 'SieveX87.asm'
include 'SieveSSE.asm'
;include 'SieveAVX.asm'
;include 'SieveFMA.asm'

.SieveDraw:
 invoke glColor3f, float dword [P.r], float dword [P.g], float dword [P.b]
 invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]

;Check for Loop
 dec [i]
 cmp [i],0
 jg .SieveNewPoint ;Loop

 invoke glEnd
 invoke SwapBuffers,[hdc]
 xor eax,eax
 jmp .finish

.wmkeydown:
 cmp r8d,VK_ESCAPE
 jne .defwndproc

.wmdestroy:
 invoke wglMakeCurrent,0,0
 invoke wglDeleteContext,[hrc]
 invoke ReleaseDC,[hwnd],[hdc]
 invoke PostQuitMessage,0
 xor eax,eax

.finish:
 endf
 ret
endp



section '.data' data readable writeable

 _title db 'OpenGL example',0
 _class db 'FASMOPENGL64',0

 wc WNDCLASS 0,WindowProc,0,0,NULL,NULL,NULL,NULL,NULL,_class

 hdc dq ?
 hrc dq ?

 msg MSG
 rc RECT
 pfd PIXELFORMATDESCRIPTOR

 clock dd ?
 i dq 0 ;Iteration Counter
;Rotation Angle
 aXY GLfloat 0.6
 aYZ GLfloat 0.5
 aXZ GLfloat 0.4

 P CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0


section '.const' data readable
;Numeric Constants
 half dd 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5
 two dd 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0
;Attractor Vertices
 A CustomPoint 0.0, 0.5, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0
 B CustomPoint -0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0
 C CustomPoint 0.5, -0.5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0

section '.idata' import data readable writeable

 library kernel,'KERNEL32.DLL',\
 user,'USER32.DLL',\
 gdi,'GDI32.DLL',\
 opengl,'OPENGL32.DLL',\
 glu,'GLU32.DLL'

 import kernel,\
 GetModuleHandle,'GetModuleHandleA',\
 GetTickCount,'GetTickCount',\
 ExitProcess,'ExitProcess'

 import user,\
 RegisterClass,'RegisterClassA',\
 CreateWindowEx,'CreateWindowExA',\
 DefWindowProc,'DefWindowProcA',\
 GetMessage,'GetMessageA',\
 TranslateMessage,'TranslateMessage',\
 DispatchMessage,'DispatchMessageA',\
 LoadCursor,'LoadCursorA',\
 LoadIcon,'LoadIconA',\
 GetClientRect,'GetClientRect',\
 GetDC,'GetDC',\
 ReleaseDC,'ReleaseDC',\
 PostQuitMessage,'PostQuitMessage'

 import gdi,\
 ChoosePixelFormat,'ChoosePixelFormat',\
 SetPixelFormat,'SetPixelFormat',\
 SwapBuffers,'SwapBuffers'

import opengl,\
glBegin,'glBegin',\
glClear,'glClear',\
glColor3f,'glColor3f',\
glEnd,'glEnd',\
glRotatef,'glRotatef',\
glVertex3f,'glVertex3f',\
glViewport,'glViewport',\
wglCreateContext,'wglCreateContext',\
wglDeleteContext,'wglDeleteContext',\
wglMakeCurrent,'wglMakeCurrent'

;import glu,\
