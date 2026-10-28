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
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;padding
dw 57h ;'VK_W'
dw IDM_FILE_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;padding
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

;Metadata Offsets and Sizes

;MtlLib Metadata
OFFSET_MTLLIB_NAME equ 0
OFFSET_MTLLIB_FIRST_MATERIAL_INDEX equ 48h
OFFSET_MTLLIB_LAST_MATERIAL_INDEX equ 4Ch
SIZE_MTLLIB_METADATA equ 50h

;Object Metadata
OFFSET_OBJECT_NAME equ 0
OFFSET_OBJECT_FIRST_GROUP_INDEX equ 48h
OFFSET_OBJECT_LAST_GROUP_INDEX equ 4Ch
SIZE_OBJECT_METADATA equ 50h

;Group Metadata
OFFSET_GROUP_NAME equ 0
OFFSET_GROUP_HOST_OBJECT_INDEX equ 40h
OFFSET_GROUP_FIRST_USEMTL_INDEX equ 48h
OFFSET_GROUP_LAST_USEMTL_INDEX equ 4Ch
SIZE_GROUP_METADATA equ 50h

;UseMtl Metadata
OFFSET_USEMTL_NAME equ 0
OFFSET_USEMTL_HOST_GROUP_INDEX equ 44h
OFFSET_USEMTL_FIRST_SMOOTHING_INDEX equ 48h
OFFSET_USEMTL_LAST_SMOOTHING_INDEX equ 4Ch
SIZE_USEMTL_METADATA equ 50h

;Smoothing Groups
OFFSET_SMOOTHING_NAME equ 0
OFFSET_SMOOTHING_HOST_USEMTL_INDEX equ 40h
OFFSET_SMOOTHING_FIRST_FACE_INDEX equ 48h
OFFSET_SMOOTHING_LAST_FACE_INDEX equ 4Ch
SIZE_SMOOTHING_METADATA equ 50h

;Material Metadata
OFFSET_MATERIAL_NAME equ 0
;Diffuse color (3 x float, Kd)
OFFSET_KD equ 40h
;Specular color (3 x float, Ks)
OFFSET_KS equ OFFSET_KD + 0Ch
;Ambient color (3 x float, Ka)
OFFSET_KA equ OFFSET_KS + 0Ch
;Emission color (3 x float, Ke)
OFFSET_KE equ OFFSET_KA + 0Ch
;Shininess / specular exponent (float, Ns)
OFFSET_NS equ OFFSET_KE + 4
;Index of refraction (float, Ni)
OFFSET_NI equ OFFSET_NS + 4
;Dissolve / opacity (float, d)
OFFSET_D equ OFFSET_NI + 4
;Transparency (inverse of d, float, Tr)
OFFSET_TR equ OFFSET_D + 4
;Roughness (PBR, float, Pr)
OFFSET_PR equ OFFSET_TR + 4
;Metallic (PBR, float, Pm)
OFFSET_PM equ OFFSET_PR + 4
;Illumination model (DWORD, illum)
OFFSET_ILLUM equ OFFSET_PM + 4
;Transmission filter color (3 x float, Tf)
OFFSET_TF equ OFFSET_ILLUM + 0Ch
;Clearcoat / sheen (float, Pc)
OFFSET_PC equ OFFSET_TF + 4
;Clearcoat roughness (float, Pcr)
OFFSET_PCR equ OFFSET_PC + 4
;Diffuse texture map filename (pointer, map_Kd)
OFFSET_MAP_KD equ OFFSET_PCR + 4
;Specular texture map filename (pointer, map_Ks)
OFFSET_MAP_KS equ OFFSET_MAP_KD + 4
SIZE_NEWMTL_METADATA equ OFFSET_MAP_KS + 4

;Texture Metadata
OFFSET_TEXTURE_NAME equ 0
SIZE_TEXTURE_NAME_BUFFER equ 40h


