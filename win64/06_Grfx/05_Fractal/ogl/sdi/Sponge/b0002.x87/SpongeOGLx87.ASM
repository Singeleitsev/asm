; OpenGL programming example

format PE64 GUI 5.0
entry start

;include 'win64a.inc'
include 'F:\bin\dev\fasmw17164\INCLUDE\win64a.inc'

;include '..\..\opengl\opengl.inc'
include 'F:\bin\dev\fasmw17164\EXAMPLES\OPENGL\opengl.inc'

struc CustomPoint x,y,z,t,r,g,b,a
  {
    .x dq x ;00h
    .y dq y ;08h
    .z dq z ;10h
    .t dq t ;18h
    .r dd r ;20h
    .g dd g ;24h
    .b dd b ;28h
    .a dd a ;2Ch
  }

section '.text' code readable executable

  start:
        sub rsp,8 ; Make stack dqword aligned

        invoke  GetModuleHandle,0
        mov     [wc.hInstance],rax
        invoke  LoadIcon,0,IDI_APPLICATION
        mov     [wc.hIcon],rax
        invoke  LoadCursor,0,IDC_ARROW
        mov     [wc.hCursor],rax
        invoke  RegisterClass,wc
        invoke  CreateWindowEx,0,_class,_title,WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS,16,16,432,432,NULL,NULL,[wc.hInstance],NULL

  msg_loop:
        invoke  GetMessage,addr msg,NULL,0,0
        cmp     eax,1
        jb      end_loop
        jne     msg_loop
        invoke  TranslateMessage,addr msg
        invoke  DispatchMessage,addr msg
        jmp     msg_loop

  end_loop:
        invoke  ExitProcess,[msg.wParam]

proc WindowProc uses rbx rsi rdi, hwnd,wmsg,wparam,lparam
        mov     [hwnd],rcx
        frame
        cmp     edx,WM_CREATE
        je      .wmcreate
        cmp     edx,WM_SIZE
        je      .wmsize
        cmp     edx,WM_PAINT
        je      .wmpaint
        cmp     edx,WM_KEYDOWN
        je      .wmkeydown
        cmp     edx,WM_DESTROY
        je      .wmdestroy
  .defwndproc:
        invoke  DefWindowProc,rcx,rdx,r8,r9
        jmp     .finish
  .wmcreate:
        invoke  GetDC,rcx
        mov     [hdc],rax
        lea     rdi,[pfd]
        mov     rcx,sizeof.PIXELFORMATDESCRIPTOR shr 3
        xor     eax,eax
        rep     stosq
        mov     [pfd.nSize],sizeof.PIXELFORMATDESCRIPTOR
        mov     [pfd.nVersion],1
        mov     [pfd.dwFlags],PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
        mov     [pfd.iLayerType],PFD_MAIN_PLANE
        mov     [pfd.iPixelType],PFD_TYPE_RGBA
        mov     [pfd.cColorBits],16
        mov     [pfd.cDepthBits],16
        mov     [pfd.cAccumBits],0
        mov     [pfd.cStencilBits],0
        invoke  ChoosePixelFormat,[hdc],addr pfd
        invoke  SetPixelFormat,[hdc],eax,addr pfd
        invoke  wglCreateContext,[hdc]
        mov     [hrc],rax
        invoke  wglMakeCurrent,[hdc],[hrc]
        invoke  GetClientRect,[hwnd],addr rc
        invoke  glViewport,0,0,[rc.right],[rc.bottom]
        invoke  GetTickCount
        mov     [clock],eax
        xor     eax,eax
        jmp     .finish
  .wmsize:
        invoke  GetClientRect,[hwnd],addr rc
        invoke  glViewport,0,0,[rc.right],[rc.bottom]
        xor     eax,eax
        jmp     .finish
  .wmpaint:
        invoke  GetTickCount
        sub     eax,[clock]
        cmp     eax,10
        jb      .animation_ok
        add     [clock],eax
        invoke  glRotatef, float [aXY],float [aXZ], float [aYZ], float dword 1.0
      .animation_ok:
        invoke glClear,GL_COLOR_BUFFER_BIT
        invoke glBegin,GL_POINTS
        .v1:
        invoke glColor3f,  float dword [A01.r], float dword [A01.g], float dword [A01.b]
        invoke glVertex3d, float qword [A01.x], float qword [A01.y], float qword [A01.z]
        .v2:
        invoke glColor3f,  float dword [A02.r], float dword [A02.g], float dword [A02.b]
        invoke glVertex3d, float qword [A02.x], float qword [A02.y], float qword [A02.z]
        .v3:
        invoke glColor3f,  float dword [A03.r], float dword [A03.g], float dword [A03.b]
        invoke glVertex3d, float qword [A03.x], float qword [A03.y], float qword [A03.z]
        .v4:
        invoke glColor3f,  float dword [A04.r], float dword [A04.g], float dword [A04.b]
        invoke glVertex3d, float qword [A04.x], float qword [A04.y], float qword [A04.z]
        .v5:
        invoke glColor3f,  float dword [A05.r], float dword [A05.g], float dword [A05.b]
        invoke glVertex3d, float qword [A05.x], float qword [A05.y], float qword [A05.z]
        .v6:
        invoke glColor3f,  float dword [A06.r], float dword [A06.g], float dword [A06.b]
        invoke glVertex3d, float qword [A06.x], float qword [A06.y], float qword [A06.z]
        .v7:
        invoke glColor3f,  float dword [A07.r], float dword [A07.g], float dword [A07.b]
        invoke glVertex3d, float qword [A07.x], float qword [A07.y], float qword [A07.z]
        .v8:
        invoke glColor3f,  float dword [A08.r], float dword [A08.g], float dword [A08.b]
        invoke glVertex3d, float qword [A08.x], float qword [A08.y], float qword [A08.z]
;jmp .draw
        xor rax,rax
        mov [i],rax
        .SieveNewPoint:
          ;P.x = (P.x + 2*N.x)/3,
          ;P.y = (P.y + 2*N.y)/3,
          ;P.z = (P.z + 2*N.z)/3,
          ;where
          ;P.x,P.y,P.z - coordinates of Point
          ;N.x,N.y,N.z - coordinates of randomly selected Vertex

          ;Generate Random Number in rax
            rdrand rax
          ;Select Vertex
            xor rdx,rdx ;Dividend High QWORD
          ;rax = Dividend Low QWORD
            mov rcx,20 ;Divisor
            div rcx
          ;rdx = random[0 to 19]
          ;Multiply Random by Size of 30h Bytes
            mov rax,rdx
            mov rcx,30h
            mul cx
          ;Set Pointers to Selected Attractor
            mov rsi,A01
            add rsi,rax

          finit ;X-Coordinate
          ;Load st(0) = P.x
            fld qword [P.x] ;P.x
            fadd qword [rsi+00h] ;P.x + N.x
            fadd qword [rsi+00h] ;P.x + 2*N.x
            fdiv qword [three] ;(P.x + 2*N.x)/3
          ;Store P.x = st(0)
            fstp qword [P.x]

          finit ;Y-Coordinate
          ;Load st(0) = P.y
            fld qword [P.y] ;P.y
            fadd qword [rsi+08h] ;P.y + N.y
            fadd qword [rsi+08h] ;P.y + 2*N.y
            fdiv qword [three] ;(P.y + 2*N.y)/3
          ;Store P.y = st(0)
            fstp qword [P.y]

          finit ;Z-Coordinate
          ;Load st(0) = P.z
            fld qword [P.z] ;P.z
            fadd qword [rsi+10h] ;P.z + N.z
            fadd qword [rsi+10h] ;P.z + 2*N.z
            fdiv qword [three] ;(P.z + 2*N.z)/3
          ;Store P.z = st(0)
            fstp qword [P.z]

           finit ;Red
          ;Load st(0) = P.r
            fld dword [P.r] ;P.r = P.r
            fadd dword [rsi+20h] ;P.r + N.r
            fadd dword [rsi+20h] ;P.r + 2*N.r
            fdiv qword [three] ;(P.r + 2*N.r)/3
          ;Store P.r = st(0)
            fstp dword [P.r]

          finit ;Green
          ;Load st(0) = P.g
            fld dword [P.g] ;P.g = P.g
            fadd dword [rsi+24h] ;P.g + N.g
            fadd dword [rsi+24h] ;P.g + 2*N.g
            fdiv qword [three] ;(P.g + 2*N.g)/3
          ;Store P.g = st(0)
            fstp dword [P.g]

          finit ;Blue
          ;Load st(0) = P.b
            fld dword [P.b] ;P.b = P.b
            fadd dword [rsi+28h] ;P.b + N.b
            fadd dword [rsi+28h] ;P.b + 2*N.b
            fdiv qword [three] ;(P.b + 2*N.b)/3
          ;Store P.b = st(0)
            fstp dword [P.b]

          ;.SieveDraw:
           ;invoke glColor3f,  float dword 1.0, float dword 1.0, float dword 1.0
           invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
           invoke glVertex3d, float qword [P.x], float qword [P.y], float qword [P.z]

          ;Check for Loop
            inc [i]
            cmp [i],50000h
            jl .SieveNewPoint ;Loop

      .draw:
        invoke glEnd
        invoke SwapBuffers,[hdc]
      xor eax,eax
      jmp .finish

  .wmkeydown:
        cmp r8d,VK_ESCAPE
        jne .defwndproc

  .wmdestroy:
        invoke  wglMakeCurrent,0,0
        invoke  wglDeleteContext,[hrc]
        invoke  ReleaseDC,[hwnd],[hdc]
        invoke  PostQuitMessage,0
        xor     eax,eax

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
  aXY GLfloat 0.5
  aYZ GLfloat 0.5
  aXZ GLfloat 0.5

  P CustomPoint 0.0, 0.0, 0.0, 0.0,   0.0, 0.0, 0.0, 0.0


section '.const' data readable
  ;Numeric Constants
  two dq 2.0
  three dq 3.0

  ;Attractor Vertices
  A01 CustomPoint  0.5,  0.0, -0.5,  0.0,   1.0, 0.0, 0.0, 0.0 ;Red
  A02 CustomPoint  0.5,  0.5, -0.5,  0.0,   1.0, 0.5, 0.0, 0.0 ;Orange
  A03 CustomPoint  0.0,  0.5, -0.5,  0.0,   1.0, 1.0, 0.0, 0.0 ;Yellow
  A04 CustomPoint -0.5,  0.5, -0.5,  0.0,   0.0, 1.0, 0.0, 0.0 ;Green
  A05 CustomPoint -0.5,  0.0, -0.5,  0.0,   0.0, 1.0, 1.0, 0.0 ;Cyan
  A06 CustomPoint -0.5, -0.5, -0.5,  0.0,   0.0, 0.0, 1.0, 0.0 ;Blue
  A07 CustomPoint  0.0, -0.5, -0.5,  0.0,   0.5, 0.0, 1.0, 0.0 ;Magenta
  A08 CustomPoint  0.5, -0.5, -0.5,  0.0,   1.0, 0.0, 0.5, 0.0 ;Pink

  A09 CustomPoint  0.5,  0.5,  0.0,  0.0,   1.0, 0.5, 0.0, 0.0 ;Orange
  A10 CustomPoint -0.5,  0.5,  0.0,  0.0,   0.0, 1.0, 0.0, 0.0 ;Green
  A11 CustomPoint -0.5, -0.5,  0.0,  0.0,   0.0, 0.0, 1.0, 0.0 ;Blue
  A12 CustomPoint  0.5, -0.5,  0.0,  0.0,   1.0, 0.0, 0.5, 0.0 ;Pink

  A13 CustomPoint  0.5,  0.0,  0.5,  0.0,   1.0, 0.0, 0.0, 0.0 ;Red
  A14 CustomPoint  0.5,  0.5,  0.5,  0.0,   1.0, 0.5, 0.0, 0.0 ;Orange
  A15 CustomPoint  0.0,  0.5,  0.5,  0.0,   1.0, 1.0, 0.0, 0.0 ;Yellow
  A16 CustomPoint -0.5,  0.5,  0.5,  0.0,   0.0, 1.0, 0.0, 0.0 ;Green
  A17 CustomPoint -0.5,  0.0,  0.5,  0.0,   0.0, 1.0, 1.0, 0.0 ;Cyan
  A18 CustomPoint -0.5, -0.5,  0.5,  0.0,   0.0, 0.0, 1.0, 0.0 ;Blue
  A19 CustomPoint  0.0, -0.5,  0.5,  0.0,   0.5, 0.0, 1.0, 0.0 ;Magenta
  A20 CustomPoint  0.5, -0.5,  0.5,  0.0,   1.0, 0.0, 0.5, 0.0 ;Pink

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
         glAccum,'glAccum',\
         glAlphaFunc,'glAlphaFunc',\
         glAreTexturesResident,'glAreTexturesResident',\
         glArrayElement,'glArrayElement',\
         glBegin,'glBegin',\
         glBindTexture,'glBindTexture',\
         glBitmap,'glBitmap',\
         glBlendFunc,'glBlendFunc',\
         glCallList,'glCallList',\
         glCallLists,'glCallLists',\
         glClear,'glClear',\
         glClearAccum,'glClearAccum',\
         glClearColor,'glClearColor',\
         glClearDepth,'glClearDepth',\
         glClearIndex,'glClearIndex',\
         glClearStencil,'glClearStencil',\
         glClipPlane,'glClipPlane',\
         glColor3b,'glColor3b',\
         glColor3bv,'glColor3bv',\
         glColor3d,'glColor3d',\
         glColor3dv,'glColor3dv',\
         glColor3f,'glColor3f',\
         glColor3fv,'glColor3fv',\
         glColor3i,'glColor3i',\
         glColor3iv,'glColor3iv',\
         glColor3s,'glColor3s',\
         glColor3sv,'glColor3sv',\
         glColor3ub,'glColor3ub',\
         glColor3ubv,'glColor3ubv',\
         glColor3ui,'glColor3ui',\
         glColor3uiv,'glColor3uiv',\
         glColor3us,'glColor3us',\
         glColor3usv,'glColor3usv',\
         glColor4b,'glColor4b',\
         glColor4bv,'glColor4bv',\
         glColor4d,'glColor4d',\
         glColor4dv,'glColor4dv',\
         glColor4f,'glColor4f',\
         glColor4fv,'glColor4fv',\
         glColor4i,'glColor4i',\
         glColor4iv,'glColor4iv',\
         glColor4s,'glColor4s',\
         glColor4sv,'glColor4sv',\
         glColor4ub,'glColor4ub',\
         glColor4ubv,'glColor4ubv',\
         glColor4ui,'glColor4ui',\
         glColor4uiv,'glColor4uiv',\
         glColor4us,'glColor4us',\
         glColor4usv,'glColor4usv',\
         glColorMask,'glColorMask',\
         glColorMaterial,'glColorMaterial',\
         glColorPointer,'glColorPointer',\
         glCopyPixels,'glCopyPixels',\
         glCopyTexImage1D,'glCopyTexImage1D',\
         glCopyTexImage2D,'glCopyTexImage2D',\
         glCopyTexSubImage1D,'glCopyTexSubImage1D',\
         glCopyTexSubImage2D,'glCopyTexSubImage2D',\
         glCullFace,'glCullFace',\
         glDeleteLists,'glDeleteLists',\
         glDeleteTextures,'glDeleteTextures',\
         glDepthFunc,'glDepthFunc',\
         glDepthMask,'glDepthMask',\
         glDepthRange,'glDepthRange',\
         glDisable,'glDisable',\
         glDisableClientState,'glDisableClientState',\
         glDrawArrays,'glDrawArrays',\
         glDrawBuffer,'glDrawBuffer',\
         glDrawElements,'glDrawElements',\
         glDrawPixels,'glDrawPixels',\
         glEdgeFlag,'glEdgeFlag',\
         glEdgeFlagPointer,'glEdgeFlagPointer',\
         glEdgeFlagv,'glEdgeFlagv',\
         glEnable,'glEnable',\
         glEnableClientState,'glEnableClientState',\
         glEnd,'glEnd',\
         glEndList,'glEndList',\
         glEvalCoord1d,'glEvalCoord1d',\
         glEvalCoord1dv,'glEvalCoord1dv',\
         glEvalCoord1f,'glEvalCoord1f',\
         glEvalCoord1fv,'glEvalCoord1fv',\
         glEvalCoord2d,'glEvalCoord2d',\
         glEvalCoord2dv,'glEvalCoord2dv',\
         glEvalCoord2f,'glEvalCoord2f',\
         glEvalCoord2fv,'glEvalCoord2fv',\
         glEvalMesh1,'glEvalMesh1',\
         glEvalMesh2,'glEvalMesh2',\
         glEvalPoint1,'glEvalPoint1',\
         glEvalPoint2,'glEvalPoint2',\
         glFeedbackBuffer,'glFeedbackBuffer',\
         glFinish,'glFinish',\
         glFlush,'glFlush',\
         glFogf,'glFogf',\
         glFogfv,'glFogfv',\
         glFogi,'glFogi',\
         glFogiv,'glFogiv',\
         glFrontFace,'glFrontFace',\
         glFrustum,'glFrustum',\
         glGenLists,'glGenLists',\
         glGenTextures,'glGenTextures',\
         glGetBooleanv,'glGetBooleanv',\
         glGetClipPlane,'glGetClipPlane',\
         glGetDoublev,'glGetDoublev',\
         glGetError,'glGetError',\
         glGetFloatv,'glGetFloatv',\
         glGetIntegerv,'glGetIntegerv',\
         glGetLightfv,'glGetLightfv',\
         glGetLightiv,'glGetLightiv',\
         glGetMapdv,'glGetMapdv',\
         glGetMapfv,'glGetMapfv',\
         glGetMapiv,'glGetMapiv',\
         glGetMaterialfv,'glGetMaterialfv',\
         glGetMaterialiv,'glGetMaterialiv',\
         glGetPixelMapfv,'glGetPixelMapfv',\
         glGetPixelMapuiv,'glGetPixelMapuiv',\
         glGetPixelMapusv,'glGetPixelMapusv',\
         glGetPointerv,'glGetPointerv',\
         glGetPolygonStipple,'glGetPolygonStipple',\
         glGetString,'glGetString',\
         glGetTexEnvfv,'glGetTexEnvfv',\
         glGetTexEnviv,'glGetTexEnviv',\
         glGetTexGendv,'glGetTexGendv',\
         glGetTexGenfv,'glGetTexGenfv',\
         glGetTexGeniv,'glGetTexGeniv',\
         glGetTexImage,'glGetTexImage',\
         glGetTexLevelParameterfv,'glGetTexLevelParameterfv',\
         glGetTexLevelParameteriv,'glGetTexLevelParameteriv',\
         glGetTexParameterfv,'glGetTexParameterfv',\
         glGetTexParameteriv,'glGetTexParameteriv',\
         glHint,'glHint',\
         glIndexMask,'glIndexMask',\
         glIndexPointer,'glIndexPointer',\
         glIndexd,'glIndexd',\
         glIndexdv,'glIndexdv',\
         glIndexf,'glIndexf',\
         glIndexfv,'glIndexfv',\
         glIndexi,'glIndexi',\
         glIndexiv,'glIndexiv',\
         glIndexs,'glIndexs',\
         glIndexsv,'glIndexsv',\
         glIndexub,'glIndexub',\
         glIndexubv,'glIndexubv',\
         glInitNames,'glInitNames',\
         glInterleavedArrays,'glInterleavedArrays',\
         glIsEnabled,'glIsEnabled',\
         glIsList,'glIsList',\
         glIsTexture,'glIsTexture',\
         glLightModelf,'glLightModelf',\
         glLightModelfv,'glLightModelfv',\
         glLightModeli,'glLightModeli',\
         glLightModeliv,'glLightModeliv',\
         glLightf,'glLightf',\
         glLightfv,'glLightfv',\
         glLighti,'glLighti',\
         glLightiv,'glLightiv',\
         glLineStipple,'glLineStipple',\
         glLineWidth,'glLineWidth',\
         glListBase,'glListBase',\
         glLoadIdentity,'glLoadIdentity',\
         glLoadMatrixd,'glLoadMatrixd',\
         glLoadMatrixf,'glLoadMatrixf',\
         glLoadName,'glLoadName',\
         glLogicOp,'glLogicOp',\
         glMap1d,'glMap1d',\
         glMap1f,'glMap1f',\
         glMap2d,'glMap2d',\
         glMap2f,'glMap2f',\
         glMapGrid1d,'glMapGrid1d',\
         glMapGrid1f,'glMapGrid1f',\
         glMapGrid2d,'glMapGrid2d',\
         glMapGrid2f,'glMapGrid2f',\
         glMaterialf,'glMaterialf',\
         glMaterialfv,'glMaterialfv',\
         glMateriali,'glMateriali',\
         glMaterialiv,'glMaterialiv',\
         glMatrixMode,'glMatrixMode',\
         glMultMatrixd,'glMultMatrixd',\
         glMultMatrixf,'glMultMatrixf',\
         glNewList,'glNewList',\
         glNormal3b,'glNormal3b',\
         glNormal3bv,'glNormal3bv',\
         glNormal3d,'glNormal3d',\
         glNormal3dv,'glNormal3dv',\
         glNormal3f,'glNormal3f',\
         glNormal3fv,'glNormal3fv',\
         glNormal3i,'glNormal3i',\
         glNormal3iv,'glNormal3iv',\
         glNormal3s,'glNormal3s',\
         glNormal3sv,'glNormal3sv',\
         glNormalPointer,'glNormalPointer',\
         glOrtho,'glOrtho',\
         glPassThrough,'glPassThrough',\
         glPixelMapfv,'glPixelMapfv',\
         glPixelMapuiv,'glPixelMapuiv',\
         glPixelMapusv,'glPixelMapusv',\
         glPixelStoref,'glPixelStoref',\
         glPixelStorei,'glPixelStorei',\
         glPixelTransferf,'glPixelTransferf',\
         glPixelTransferi,'glPixelTransferi',\
         glPixelZoom,'glPixelZoom',\
         glPointSize,'glPointSize',\
         glPolygonMode,'glPolygonMode',\
         glPolygonOffset,'glPolygonOffset',\
         glPolygonStipple,'glPolygonStipple',\
         glPopAttrib,'glPopAttrib',\
         glPopClientAttrib,'glPopClientAttrib',\
         glPopMatrix,'glPopMatrix',\
         glPopName,'glPopName',\
         glPrioritizeTextures,'glPrioritizeTextures',\
         glPushAttrib,'glPushAttrib',\
         glPushClientAttrib,'glPushClientAttrib',\
         glPushMatrix,'glPushMatrix',\
         glPushName,'glPushName',\
         glRasterPos2d,'glRasterPos2d',\
         glRasterPos2dv,'glRasterPos2dv',\
         glRasterPos2f,'glRasterPos2f',\
         glRasterPos2fv,'glRasterPos2fv',\
         glRasterPos2i,'glRasterPos2i',\
         glRasterPos2iv,'glRasterPos2iv',\
         glRasterPos2s,'glRasterPos2s',\
         glRasterPos2sv,'glRasterPos2sv',\
         glRasterPos3d,'glRasterPos3d',\
         glRasterPos3dv,'glRasterPos3dv',\
         glRasterPos3f,'glRasterPos3f',\
         glRasterPos3fv,'glRasterPos3fv',\
         glRasterPos3i,'glRasterPos3i',\
         glRasterPos3iv,'glRasterPos3iv',\
         glRasterPos3s,'glRasterPos3s',\
         glRasterPos3sv,'glRasterPos3sv',\
         glRasterPos4d,'glRasterPos4d',\
         glRasterPos4dv,'glRasterPos4dv',\
         glRasterPos4f,'glRasterPos4f',\
         glRasterPos4fv,'glRasterPos4fv',\
         glRasterPos4i,'glRasterPos4i',\
         glRasterPos4iv,'glRasterPos4iv',\
         glRasterPos4s,'glRasterPos4s',\
         glRasterPos4sv,'glRasterPos4sv',\
         glReadBuffer,'glReadBuffer',\
         glReadPixels,'glReadPixels',\
         glRectd,'glRectd',\
         glRectdv,'glRectdv',\
         glRectf,'glRectf',\
         glRectfv,'glRectfv',\
         glRecti,'glRecti',\
         glRectiv,'glRectiv',\
         glRects,'glRects',\
         glRectsv,'glRectsv',\
         glRenderMode,'glRenderMode',\
         glRotated,'glRotated',\
         glRotatef,'glRotatef',\
         glScaled,'glScaled',\
         glScalef,'glScalef',\
         glScissor,'glScissor',\
         glSelectBuffer,'glSelectBuffer',\
         glShadeModel,'glShadeModel',\
         glStencilFunc,'glStencilFunc',\
         glStencilMask,'glStencilMask',\
         glStencilOp,'glStencilOp',\
         glTexCoord1d,'glTexCoord1d',\
         glTexCoord1dv,'glTexCoord1dv',\
         glTexCoord1f,'glTexCoord1f',\
         glTexCoord1fv,'glTexCoord1fv',\
         glTexCoord1i,'glTexCoord1i',\
         glTexCoord1iv,'glTexCoord1iv',\
         glTexCoord1s,'glTexCoord1s',\
         glTexCoord1sv,'glTexCoord1sv',\
         glTexCoord2d,'glTexCoord2d',\
         glTexCoord2dv,'glTexCoord2dv',\
         glTexCoord2f,'glTexCoord2f',\
         glTexCoord2fv,'glTexCoord2fv',\
         glTexCoord2i,'glTexCoord2i',\
         glTexCoord2iv,'glTexCoord2iv',\
         glTexCoord2s,'glTexCoord2s',\
         glTexCoord2sv,'glTexCoord2sv',\
         glTexCoord3d,'glTexCoord3d',\
         glTexCoord3dv,'glTexCoord3dv',\
         glTexCoord3f,'glTexCoord3f',\
         glTexCoord3fv,'glTexCoord3fv',\
         glTexCoord3i,'glTexCoord3i',\
         glTexCoord3iv,'glTexCoord3iv',\
         glTexCoord3s,'glTexCoord3s',\
         glTexCoord3sv,'glTexCoord3sv',\
         glTexCoord4d,'glTexCoord4d',\
         glTexCoord4dv,'glTexCoord4dv',\
         glTexCoord4f,'glTexCoord4f',\
         glTexCoord4fv,'glTexCoord4fv',\
         glTexCoord4i,'glTexCoord4i',\
         glTexCoord4iv,'glTexCoord4iv',\
         glTexCoord4s,'glTexCoord4s',\
         glTexCoord4sv,'glTexCoord4sv',\
         glTexCoordPointer,'glTexCoordPointer',\
         glTexEnvf,'glTexEnvf',\
         glTexEnvfv,'glTexEnvfv',\
         glTexEnvi,'glTexEnvi',\
         glTexEnviv,'glTexEnviv',\
         glTexGend,'glTexGend',\
         glTexGendv,'glTexGendv',\
         glTexGenf,'glTexGenf',\
         glTexGenfv,'glTexGenfv',\
         glTexGeni,'glTexGeni',\
         glTexGeniv,'glTexGeniv',\
         glTexImage1D,'glTexImage1D',\
         glTexImage2D,'glTexImage2D',\
         glTexParameterf,'glTexParameterf',\
         glTexParameterfv,'glTexParameterfv',\
         glTexParameteri,'glTexParameteri',\
         glTexParameteriv,'glTexParameteriv',\
         glTexSubImage1D,'glTexSubImage1D',\
         glTexSubImage2D,'glTexSubImage2D',\
         glTranslated,'glTranslated',\
         glTranslatef,'glTranslatef',\
         glVertex2d,'glVertex2d',\
         glVertex2dv,'glVertex2dv',\
         glVertex2f,'glVertex2f',\
         glVertex2fv,'glVertex2fv',\
         glVertex2i,'glVertex2i',\
         glVertex2iv,'glVertex2iv',\
         glVertex2s,'glVertex2s',\
         glVertex2sv,'glVertex2sv',\
         glVertex3d,'glVertex3d',\
         glVertex3dv,'glVertex3dv',\
         glVertex3f,'glVertex3f',\
         glVertex3fv,'glVertex3fv',\
         glVertex3i,'glVertex3i',\
         glVertex3iv,'glVertex3iv',\
         glVertex3s,'glVertex3s',\
         glVertex3sv,'glVertex3sv',\
         glVertex4d,'glVertex4d',\
         glVertex4dv,'glVertex4dv',\
         glVertex4f,'glVertex4f',\
         glVertex4fv,'glVertex4fv',\
         glVertex4i,'glVertex4i',\
         glVertex4iv,'glVertex4iv',\
         glVertex4s,'glVertex4s',\
         glVertex4sv,'glVertex4sv',\
         glVertexPointer,'glVertexPointer',\
         glViewport,'glViewport',\
         wglGetProcAddress,'wglGetProcAddress',\
         wglCopyContext,'wglCopyContext',\
         wglCreateContext,'wglCreateContext',\
         wglCreateLayerContext,'wglCreateLayerContext',\
         wglDeleteContext,'wglDeleteContext',\
         wglDescribeLayerPlane,'wglDescribeLayerPlane',\
         wglGetCurrentContext,'wglGetCurrentContext',\
         wglGetCurrentDC,'wglGetCurrentDC',\
         wglGetLayerPaletteEntries,'wglGetLayerPaletteEntries',\
         wglMakeCurrent,'wglMakeCurrent',\
         wglRealizeLayerPalette,'wglRealizeLayerPalette',\
         wglSetLayerPaletteEntries,'wglSetLayerPaletteEntries',\
         wglShareLists,'wglShareLists',\
         wglSwapLayerBuffers,'wglSwapLayerBuffers',\
         wglSwapMultipleBuffers,'wglSwapMultipleBuffers',\
         wglUseFontBitmapsA,'wglUseFontBitmapsA',\
         wglUseFontOutlinesA,'wglUseFontOutlinesA',\
         wglUseFontBitmapsW,'wglUseFontBitmapsW',\
         wglUseFontOutlinesW,'wglUseFontOutlinesW',\
         glDrawRangeElements,'glDrawRangeElements',\
         glTexImage3D,'glTexImage3D',\
         glBlendColor,'glBlendColor',\
         glBlendEquation,'glBlendEquation',\
         glColorSubTable,'glColorSubTable',\
         glCopyColorSubTable,'glCopyColorSubTable',\
         glColorTable,'glColorTable',\
         glCopyColorTable,'glCopyColorTable',\
         glColorTableParameteriv,'glColorTableParameteriv',\
         glColorTableParameterfv,'glColorTableParameterfv',\
         glGetColorTable,'glGetColorTable',\
         glGetColorTableParameteriv,'glGetColorTableParameteriv',\
         glGetColorTableParameterfv,'glGetColorTableParameterfv',\
         glConvolutionFilter1D,'glConvolutionFilter1D',\
         glConvolutionFilter2D,'glConvolutionFilter2D',\
         glCopyConvolutionFilter1D,'glCopyConvolutionFilter1D',\
         glCopyConvolutionFilter2D,'glCopyConvolutionFilter2D',\
         glGetConvolutionFilter,'glGetConvolutionFilter',\
         glSeparableFilter2D,'glSeparableFilter2D',\
         glGetSeparableFilter,'glGetSeparableFilter',\
         glConvolutionParameteri,'glConvolutionParameteri',\
         glConvolutionParameteriv,'glConvolutionParameteriv',\
         glConvolutionParameterf,'glConvolutionParameterf',\
         glConvolutionParameterfv,'glConvolutionParameterfv',\
         glGetConvolutionParameteriv,'glGetConvolutionParameteriv',\
         glGetConvolutionParameterfv,'glGetConvolutionParameterfv',\
         glHistogram,'glHistogram',\
         glResetHistogram,'glResetHistogram',\
         glGetHistogram,'glGetHistogram',\
         glGetHistogramParameteriv,'glGetHistogramParameteriv',\
         glGetHistogramParameterfv,'glGetHistogramParameterfv',\
         glMinmax,'glMinmax',\
         glResetMinmax,'glResetMinmax',\
         glGetMinmax,'glGetMinmax',\
         glGetMinmaxParameteriv,'glGetMinmaxParameteriv',\
         glGetMinmaxParameterfv,'glGetMinmaxParameterfv'

  import glu,\
         gluBeginCurve,'gluBeginCurve',\
         gluBeginPolygon,'gluBeginPolygon',\
         gluBeginSurface,'gluBeginSurface',\
         gluBeginTrim,'gluBeginTrim',\
         gluBuild1DMipmaps,'gluBuild1DMipmaps',\
         gluBuild2DMipmaps,'gluBuild2DMipmaps',\
         gluCylinder,'gluCylinder',\
         gluDeleteNurbsRenderer,'gluDeleteNurbsRenderer',\
         gluDeleteQuadric,'gluDeleteQuadric',\
         gluDeleteTess,'gluDeleteTess',\
         gluDisk,'gluDisk',\
         gluEndCurve,'gluEndCurve',\
         gluEndPolygon,'gluEndPolygon',\
         gluEndSurface,'gluEndSurface',\
         gluEndTrim,'gluEndTrim',\
         gluErrorString,'gluErrorString',\
         gluGetNurbsProperty,'gluGetNurbsProperty',\
         gluGetString,'gluGetString',\
         gluGetTessProperty,'gluGetTessProperty',\
         gluLoadSamplingMatrices,'gluLoadSamplingMatrices',\
         gluLookAt,'gluLookAt',\
         gluNewNurbsRenderer,'gluNewNurbsRenderer',\
         gluNewQuadric,'gluNewQuadric',\
         gluNewTess,'gluNewTess',\
         gluNextContour,'gluNextContour',\
         gluNurbsCallback,'gluNurbsCallback',\
         gluNurbsCurve,'gluNurbsCurve',\
         gluNurbsProperty,'gluNurbsProperty',\
         gluNurbsSurface,'gluNurbsSurface',\
         gluOrtho2D,'gluOrtho2D',\
         gluPartialDisk,'gluPartialDisk',\
         gluPerspective,'gluPerspective',\
         gluPickMatrix,'gluPickMatrix',\
         gluProject,'gluProject',\
         gluPwlCurve,'gluPwlCurve',\
         gluQuadricCallback,'gluQuadricCallback',\
         gluQuadricDrawStyle,'gluQuadricDrawStyle',\
         gluQuadricNormals,'gluQuadricNormals',\
         gluQuadricOrientation,'gluQuadricOrientation',\
         gluQuadricTexture,'gluQuadricTexture',\
         gluScaleImage,'gluScaleImage',\
         gluSphere,'gluSphere',\
         gluTessBeginContour,'gluTessBeginContour',\
         gluTessBeginPolygon,'gluTessBeginPolygon',\
         gluTessCallback,'gluTessCallback',\
         gluTessEndContour,'gluTessEndContour',\
         gluTessEndPolygon,'gluTessEndPolygon',\
         gluTessNormal,'gluTessNormal',\
         gluTessProperty,'gluTessProperty',\
         gluTessVertex,'gluTessVertex',\
         gluUnProject,'gluUnProject'
