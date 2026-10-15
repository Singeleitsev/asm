;WNDCLASSEX64
align 10h
wcx LABEL byte
wcx_cbSize dd 50h
wcx_style dd 0
wcx_lpfnWndProc dq 0
wcx_cbClsExtra dd 0
wcx_cbWndExtra dd 0
wcx_hInstance dq 0
wcx_hIcon dq 0
wcx_hCursor dq 0
wcx_hbrBackground dq 0
wcx_lpszMenuName dq 0
wcx_lpszClassName dq 0
wcx_hIconSm dq 0

;MSG64
align 10h
msg LABEL byte
msg_hWnd dq 0
msg_message dd 0
msg_wParam dq 0
msg_lParam dq 0
msg_time dd 0
msg_pt_x dd 0
msg_pt_y dd 0
msg_lPrivate dd 0

;ACCELSTRUCT
align 10h ;Must be aligned to avoid error 0x03e6
accel LABEL byte
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;padding
dw 57h ;'VK_W'
dw IDM_FILE_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;padding
dw 70h ;VK_F1 = 0x70
dw IDM_HELP_ABOUT ;command ID

;INITCOMMONCONTROLSEX
align 10h
icce LABEL byte
icce_dwSize dd 8 ;sizeof.INITCOMMONCONTROLSEX
icce_dwICC dd 4 ;ICC_BAR_CLASSES

;RECT
align 10h
rectClient LABEL byte
rectClient_left dd 0
rectClient_top dd 0
rectClient_right dd 0
rectClient_bottom dd 0

;PIXELFORMATDESCRIPTOR
align 10h
pfd label byte
pfd_nSize dw 28h ;sizeof.PIXELFORMATDESCRIPTOR
pfd_nVersion dw 1
pfd_dwFlags dd 20h ;PFD_SUPPORT_OPENGL
pfd_iPixelType db 0 ;PFD_TYPE_RGBA
pfd_cColorBits db 20h ;Color Depth = 32 bits per pixel
pfd_cRedBits db 0 ;Color Bits Ignored
pfd_cRedShift db 0 ;Color Bits Ignored
pfd_cGreenBits db 0 ;Color Bits Ignored
pfd_cGreenShift db 0 ;Color Bits Ignored
pfd_cBlueBits db 0 ;Color Bits Ignored
pfd_cBlueShift db 0 ;Color Bits Ignored
pfd_cAlphaBits db 0 ;No Alpha Buffer
pfd_cAlphaShift db 0 ;Shift Bit Ignored
pfd_cAccumBits db 0 ;No Accumulation Buffer
pfd_cAccumRedBits db 0 ;Accumulation Bits Ignored
pfd_cAccumGreenBits db 0 ;Accumulation Bits Ignored
pfd_cAccumBlueBits db 0 ;Accumulation Bits Ignored
pfd_cAccumAlphaBits db 0 ;Accumulation Bits Ignored
pfd_cDepthBits db 20h ;32 Bit z-Buffer (Depth Buffer)
pfd_cStencilBits db 0 ;No Stencil Buffer
pfd_cAuxBuffers db 0 ;No Auxiliary Buffer
pfd_iLayerType db 0 ;PFD_MAIN_PLANE
pfd_bReserved db 0 ;Reserved
pfd_dwLayerMask dd 0 ;Layer Masks Ignored
pfd_dwVisibleMask dd 0 ;Layer Masks Ignored
pfd_dwDamageMask dd 0 ;Layer Masks Ignored

;OpenGL 3.2+ Attributes

;wglChoosePixelFormatARB
align 10h
pixAttribs LABEL dword
dd 2001h,1 ;WGL_DRAW_TO_WINDOW_ARB = GL_TRUE
dd 2010h,1 ;WGL_SUPPORT_OPENGL_ARB = GL_TRUE
dd 2011h,1 ;WGL_DOUBLE_BUFFER_ARB = GL_TRUE
dd 2013h,202Bh ;WGL_PIXEL_TYPE_ARB = WGL_TYPE_RGBA_ARB
dd 2014h,32 ;WGL_COLOR_BITS_ARB = 32
dd 2022h,24 ;WGL_DEPTH_BITS_ARB = 24
dd 2023h,8 ;WGL_STENCIL_BITS_ARB = 8
dd 2041h,1 ;WGL_SAMPLE_BUFFERS_ARB = GL_TRUE (Äëÿ MSAA)
dd 2042h,4  ;WGL_SAMPLES_ARB = 4 (4x Multisampling)
dd 0,0  ;Null-terminator

;wglCreateContextAttribsARB
align 10h
contextAttribs label dword
dd 2091h,3 ;WGL_CONTEXT_MAJOR_VERSION_ARB = 3.x
dd 2092h,3 ;WGL_CONTEXT_MINOR_VERSION_ARB = x.3
dd 9126h,1 ;WGL_CONTEXT_PROFILE_MASK_ARB = WGL_CONTEXT_CORE_PROFILE_BIT_ARB
dd 0,0 ;Null-terminator

;POINT2D STRUCT
;x dd ?
;y dd ?
;POINT2D ENDS

vec4 STRUCT
x real4 0.0
y real4 0.0
z real4 0.0
w real4 0.0
vec4 ENDS

RGBA STRUCT
r real4 0.0
g real4 0.0
b real4 0.0
a real4 0.0
RGBA ENDS

;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

mat4 STRUCT
m00 real4 1.0 ;m00 ;Column 0
m01 real4 0.0 ;m01
m02 real4 0.0 ;m02
m03 real4 0.0 ;m03
m04 real4 0.0 ;m10 ;Column 1
m05 real4 1.0 ;m11
m06 real4 0.0 ;m12
m07 real4 0.0 ;m13
m08 real4 0.0 ;m20 ;Column 2
m09 real4 0.0 ;m21
m10 real4 1.0 ;m22
m11 real4 0.0 ;m23
m12 real4 0.0 ;m30 ;Column 3
m13 real4 0.0 ;m31
m14 real4 0.0 ;m32
m15 real4 1.0 ;m33
mat4 ENDS


