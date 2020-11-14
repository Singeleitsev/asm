format PE64 GUI 6.0
entry start

;include 'win64a.inc'
;include 'D:\bin\dev\fasmw17324\INCLUDE\win64a.inc'
include 'F:\bin\dev\fasmw17164\INCLUDE\win64a.inc'
;include '..\..\opengl\opengl.inc'
;include 'D:\bin\dev\fasmw17324\EXAMPLES\OPENGL\opengl.inc'
include 'F:\bin\dev\fasmw17164\EXAMPLES\OPENGL\opengl.inc'

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

 include 'CheckCPU.asm'

CreateMainWindow:
 invoke LoadIcon,0,IDI_APPLICATION
 mov [wc.hIcon],rax
 invoke LoadCursor,0,IDC_ARROW
 mov [wc.hCursor],rax
 invoke RegisterClass,wc
 invoke CreateWindowEx,0,_class,_title,\
  WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS,\
  16,16,432,432,NULL,NULL,[wc.hInstance],NULL
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
 cmp edx,WM_DESTROY
 je .wmdestroy
 cmp edx,WM_SIZE
 je .wmsize
 cmp edx,WM_CREATE
 je .wmcreate

.defwndproc:
 invoke DefWindowProc,rcx,rdx,r8,r9
 jmp .finish

.wmcreate:
 invoke GetDC,rcx
 mov [hdc],rax
 invoke  CryptAcquireContext, hProv, 0,0,1,0 ;PROV_RSA_FULL = 1
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
 invoke glRotatef, float dword 1.0, float dword [aXY], float dword [aXZ], float dword [aYZ]
.animation_ok:
 invoke glClear,GL_COLOR_BUFFER_BIT
 invoke glBegin,GL_POINTS
.v1:
 invoke glColor3f, float dword [A.r], float dword [A.g], float dword [A.b]
 invoke glVertex3f, float dword [A.x], float dword [A.y], float dword [A.z]
.v2:
 invoke glColor3f, float dword [B.r], float dword [B.g], float dword [B.b]
 invoke glVertex3f, float dword [B.x], float dword [B.y], float dword [B.z]
.v3:
 invoke glColor3f, float dword [C.r], float dword [C.g], float dword [C.b]
 invoke glVertex3f, float dword [C.x], float dword [C.y], float dword [C.z]
.v4:
 invoke glColor3f, float dword [D.r], float dword [D.g], float dword [D.b]
 invoke glVertex3f, float dword [D.x], float dword [D.y], float dword [D.z]

 jmp [lpMode]

 include 'PyramidFMA.asm'
 include 'PyramidAVX.asm'
 include 'PyramidSSE.asm'
 include 'PyramidX87.asm'

.skip:
 invoke glEnd
 invoke SwapBuffers,[hdc]
 ;Release Cryptographic Context
 invoke CryptReleaseContext,[hProv],0
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
endp ;WindowProc



section '.data' data readable writeable

_title db 'Sierpinski Pyramid',0
_class db 'FASMOPENGL64',0
_errFMA db 'FMA instructions are not supported',10,13, 'Trying to use AVX',0
_errAVX db 'AVX instructions are not supported',10,13, 'Passing to SSE algorithm',0
_errRDRAND db 'RDRAND instruction is not supported',10,13, 'Passing to slow API algorithm',0

wc WNDCLASS 0,WindowProc,0,0,NULL,NULL,NULL,NULL,NULL,_class

hdc dq ?
hrc dq ?

msg MSG
rc RECT
pfd PIXELFORMATDESCRIPTOR

clock dd ?

;Cryptographic Handle and Buffer
hProv dq 0 ;Stock Provider
nRand dd 0 ;Generate Random DWORD

i dq 0 ;Iteration Counter

;Rotation Angle
aXY dd 0.6
aYZ dd 0.5
aXZ dd 0.4

P CustomPoint 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

;Mode Pointer (FMA, AVX, SSE, x87)
lpMode dq 0

section '.const' data readable

;Numeric Constants
two dd 2.0
half dd 0.5
broadcastHalf dd 0.5,0.5,0.5,0.5
mask32bit dd 0FFFFFFFFh,0,0,0, 0,0,0,0

;Attractor Vertices
A CustomPoint 0.0, 0.5, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0
B CustomPoint -0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0
C CustomPoint 0.5, -0.5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0
D CustomPoint 0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0



section '.idata' import data readable writeable

include 'import.inc'


