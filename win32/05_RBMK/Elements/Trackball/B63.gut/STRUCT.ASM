;WNDCLASSEX32
align 4
wcx_cbSize dd 30h
wcx_style dd 2Bh ;CS_VREDRAW | CS_HREDRAW | CS_DBLCLKS | CS_OWNDC = 1 + 2 + 8 + 20
wcx_lpfnWndProc dd offset WndProc
wcx_cbClsExtra dd 0
wcx_cbWndExtra dd 0
wcx_hInstance dd 0
wcx_hIcon dd 0
wcx_hCursor dd 0
wcx_hbrBackground dd 0
wcx_lpszMenuName dd 0
wcx_lpszClassName dd offset szMainWndClass
wcx_hIconSm dd 0
OFFSET_WCX TEXTEQU <offset wcx_cbSize>

;MSG
align 4
msg_hWnd dd 0
msg_message dd 0
msg_wParam dd 0
msg_lParam dd 0
msg_time dd 0
msg_pt_x dd 0
msg_pt_y dd 0
msg_lPrivate dd 0
OFFSET_MSG TEXTEQU <offset msg_hWnd>

;ACCELSTRUCT
align 4 ;Must be aligned to avoid error 0x03e6
accel label byte
;db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
;db 0 ;dummy
;dw 53h ;'S'
;dw IDM_FILE_SAVE ;command ID
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;dummy
dw 57h ;'W'
dw IDM_FILE_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;dummy
dw 70h ;VK_F1 = 0x70
dw IDM_HELP_ABOUT ;command ID
OFFSET_ACCEL TEXTEQU <offset accel>

;INITCOMMONCONTROLSEX
align 4
icce_dwSize dd 8 ;sizeof.INITCOMMONCONTROLSEX
icce_dwICC dd 4 ;ICC_BAR_CLASSES
OFFSET_ICCE TEXTEQU <offset icce_dwSize>

;RECT
align 4
rectClient_left dd 0
rectClient_top dd 0
rectClient_right dd 0
rectClient_bottom dd 0
OFFSET_RECT_CLIENT TEXTEQU <offset rectClient_left>

;PIXELFORMATDESCRIPTOR
align 4
pfd_nSize dw 28h ;sizeof.PIXELFORMATDESCRIPTOR
pfd_nVersion dw 1
pfd_dwFlags dd 25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
pfd_iPixelType db 0 ;PFD_TYPE_RGBA
pfd_cColorBits db 10h ;Color Depth = 16 bits per pixel
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
pfd_cDepthBits db 10h ;16 Bit z-Buffer (Depth Buffer)
pfd_cStencilBits db 0 ;No Stencil Buffer
pfd_cAuxBuffers db 0 ;No Auxiliary Buffer
pfd_iLayerType db 0 ;PFD_MAIN_PLANE
pfd_bReserved db 0 ;Reserved
pfd_dwLayerMask dd 0 ;Layer Masks Ignored
pfd_dwVisibleMask dd 0 ;Layer Masks Ignored
pfd_dwDamageMask dd 0 ;Layer Masks Ignored
OFFSET_PFD TEXTEQU <offset pfd_nSize>

;POINT2D STRUCT
;x dd ?
;y dd ?
;POINT2D ENDS

POINT4D STRUCT
x real4 0.0
y real4 0.0
z real4 0.0
w real4 0.0
POINT4D ENDS

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


