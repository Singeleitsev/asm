;Numeric
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

;Mouse Modes
MOUSE_MODE_FREE equ 0
MOUSE_MODE_CAMERA_ROTATE equ 1
MOUSE_MODE_CAMERA_DRAG equ 2
MOUSE_MODE_OBJECT_ROTATE equ 3

;Display Lists IDs
DISPLAY_LIST_LIGHTING EQU 1

;Object

;Stride = 36 bytes = (3 coordinates + 3 normals + 3 colors) * 4 bytes
STRIDE equ 36
;1888 channels by the RBMK design
RBMK_TOTAL_CHANNELS equ 1888
;12 unique vertices per cap (flat side normals preserved)
RBMK_VERTS_PER_CAP equ 12
RBMK_TOTAL_VERTICES equ 22656 ;1888 channels * 12 vertices
RBMK_VERTEX_ARRAY_SIZE equ 815616 ;22656 vertices * STRIDE

;5 faces * 1 quad * 4 indices = 20 indices per cap
RBMK_INDICES_PER_CAP equ 20
RBMK_TOTAL_INDICES equ 37760 ;1888 * 20
RBMK_INDEX_ARRAY_SIZE equ 75520 ;37760 * 2



