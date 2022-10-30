format PE64 GUI 6.0
entry start

include 'D:\bin\dev\asm\fasmw17330\INCLUDE\win64a.inc'
include 'D:\bin\dev\asm\fasmw17330\EXAMPLES\OPENGL\opengl.inc'

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
 invoke TranslateMessage,msg
 invoke DispatchMessage,msg
 jmp msg_loop

end_loop:
 invoke ExitProcess,[msg.wParam]

proc WindowProc uses rbx rsi rdi, hwnd,wmsg,wparam,lparam
 mov [hwnd],rcx
 frame

 cmp edx,WM_TIMER
 je .wmtimer
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
 invoke ChoosePixelFormat,[hdc],pfd
 invoke SetPixelFormat,[hdc],eax,pfd
 invoke wglCreateContext,[hdc]
 mov [hrc],rax

 invoke wglMakeCurrent,[hdc],[hrc]
 invoke GetClientRect,[hwnd],rc
 invoke glViewport,0,0,[rc.right],[rc.bottom]

 invoke SetTimer, [hwnd],1,0Ah,0 ;USER_TIMER_MINIMUM = 0Ah = 10 ms

 ;AngleStepU = 360/rU = 2*pi/rU
 finit
 fldpi
 fmul dword [two]
 fst st1
 fidiv dword [rU] ;integer
 fstp dword [dU_]
 fidiv dword [rV] ;integer
 fstp dword [dV]

 xor eax,eax
 jmp .finish

.wmsize:
 invoke GetClientRect,[hwnd],rc
 invoke glViewport,0,0,[rc.right],[rc.bottom]
 invoke PostMessage, [hwnd],WM_PAINT,0,0
 xor eax,eax
 jmp .finish

.wmpaint:
 invoke InvalidateRect,[hwnd],0,1
 invoke BeginPaint, [hwnd],ps
 invoke EndPaint, [hwnd],ps
 xor eax,eax
 jmp .finish

.wmtimer:
 invoke glRotatef, float [aXY],float [aXZ], float [aYZ], float dword 1.0
 invoke glClear,GL_COLOR_BUFFER_BIT

 invoke glBegin,GL_LINE_STRIP
 call KleinDrawProc
 invoke glEnd

 ;invoke glBegin,GL_QUADS
 ;call KleinDrawProc
 ;invoke glEnd

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
 invoke KillTimer,[hwnd],1
 xor eax,eax

.finish:
 endf
 ret
endp


include 'KleinDrawProc.asm'
include 'KleinCalcVertProc.asm'
include 'KleinCalcColorProc.asm'


section '.data' data readable writeable

_title db 'OpenGL Klein Bottle',0
_class db 'FASMOPENGL64',0

wc WNDCLASS 0,WindowProc,0,0,NULL,NULL,NULL,NULL,NULL,_class

hdc dq ?
hrc dq ?

msg MSG
rc RECT
ps PAINTSTRUCT
pfd PIXELFORMATDESCRIPTOR

;Counters
;i dd 0
;j dd 0

;Resolution
rU dd 36 ;Horizontal
rV dd 180 ;Vertical

;Scale
s dd 0.05 ;1/20

;Angles
u dd 0.0
dU_ dd 0.0 ;AngleStepU = 360/rU = 2*pi/rU
v dd 0.0
dV dd 0.0 ;AngleStepV = 360/rV = 2*pi/rV

;Vertices Buffer
p1 CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
p2 CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
p3 CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
p4 CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

;Rotation Angle
aXY dd 0.5
aXZ dd 0.5
aYZ dd 0.5

section '.const' data readable

include 'KleinConst.asm'


section '.idata' import data readable writeable

library kernel,'KERNEL32.DLL',\
user,'USER32.DLL',\
gdi,'GDI32.DLL',\
opengl,'OPENGL32.DLL',\
glu,'GLU32.DLL'

import kernel,\
GetModuleHandle,'GetModuleHandleA',\
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
PostQuitMessage,'PostQuitMessage',\
PostMessage,'PostMessageA',\
BeginPaint,'BeginPaint',\
EndPaint,'EndPaint',\
SetTimer,'SetTimer',\
KillTimer,'KillTimer',\
InvalidateRect,'InvalidateRect',\
MessageBox,'MessageBoxA'

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
