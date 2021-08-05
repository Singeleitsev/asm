;OpenGL programming example

format PE64 GUI 6.0
entry start


include '..\INCLUDE\win64a.inc'
;include 'F:\bin\dev\asm\fasmw17164\INCLUDE\win64a.inc'
include '..\EXAMPLES\OPENGL\opengl.inc'
;include 'F:\bin\dev\asm\fasmw17164\EXAMPLES\OPENGL\opengl.inc'

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

 include 'BallCalcVert.asm'
 include 'BallCalcColor.asm'

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
 invoke glBegin,GL_POINTS

 include 'BallDrawVert.asm'

 mov [i],10000h ;Number of Points
.BallNewPoint:
;P.x = (P.x + q1*N.x)/q2,
;P.y = (P.y + q1*N.y)/q2,
;P.z = (P.z + q1*N.z)/q2,
;where
;P.x,P.y,P.z - coordinates of Point
;N.x,N.y,N.z - coordinates of randomly selected Vertex
;q2 - number of vertices
;q1 = q2-1

;jmp lblBallRandMode
 include 'BallRdRand.asm'

;jmp lblBallCalcMode
 ;include 'BallX87.asm'
 ;include 'BallSSE.asm'
 include 'BallAVX.asm'
 ;include 'BallFMA.asm'

.BallDraw:
 invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
 invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]

;Check for Loop
 dec [i]
 cmp [i],0
 jg .BallNewPoint ;Loop

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
 invoke KillTimer,[hwnd],1
 xor eax,eax

.finish:
 endf
 ret
endp



section '.data' data readable writeable

_title db 'OpenGL Sierpinski Ball',0
_class db 'FASMOPENGL64',0

wc WNDCLASS 0,WindowProc,0,0,NULL,NULL,NULL,NULL,NULL,_class

hdc dq ?
hrc dq ?

msg MSG
rc RECT
ps PAINTSTRUCT
pfd PIXELFORMATDESCRIPTOR

i dq 0 ;Counter
j dq 0 ;Counter

n dq 6 ;Number of Vertices in a Latitudinal Section
m dq 0 ;Number of Latitudinal Sections
mn dq 0 ;Total Number of Vertices

dA dd 0.0 ;AngleStep = 360/n = 2*pi/n

zFactor dd 0.0
zPosition dd 0.0
buffer0 dd 0.0

;Rotation Angle
aXY dd 0.5
aYZ dd 0.5
aXZ dd 0.5

;Attractor Vertices
;Reserve the Field for maximum of 12-side Polygons
;Sphere consists of 5 such Polygons and 2 Poles
;(12*5+2)*8 = 496 dwords
 V rd 496

 P CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

;Fractal quotients
 q1 dd 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0 ;Multiplier = (n-1)
 q2 dd 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0 ;Divisor = n

section '.const' data readable

include 'BallConst.asm'


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
InvalidateRect,'InvalidateRect'

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
