;Numeric
f32_PiOver180 real4 0.017453292519943295
f32_0p1 real4 0.1
f32_posOne real4 1.0
f32_negOne real4 -1.0

;Mnemonic
EPS equ 0.001 ;Epsilon

;Default Window Sizes
DEFAULT_WND_WIDTH equ 800
DEFAULT_WND_HEIGHT equ 600
MIN_WND_WIDTH  equ 480
MIN_WND_HEIGHT equ 360

;Menu
IDM_FILE_SAVE equ 103h
IDM_FILE_EXIT equ 109h
IDM_HELP_ABOUT equ 901h

;Status Bar
STATUS_BAR_PARTS equ 6

;String
TEXT_BUFFER_SIZE equ 40h ;64 bytes


;Object

;Data
STRIDE equ 36 ;3 coordinates + 3 normals + 3 colors) * 4 bytes

;Mouse Modes
MOUSE_MODE_FREE equ 0
MOUSE_MODE_CAMERA_ROTATE equ 1
MOUSE_MODE_CAMERA_DRAG equ 2
MOUSE_MODE_OBJECT_ROTATE equ 3

;Display Lists IDs
DISPLAY_LIST_LIGHTING EQU 1






