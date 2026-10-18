;Numeric
EPS equ 0.001 ;Epsilon

;Default Sizes
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

;Object

;Vertices
TOTAL_VERTICES equ 4 ;4 unique vertices
;VBO Pattern: x,y,z, nx,ny,nz, r,g,b
;Stride = (3 coords + 3 normals + 3 colors) * 4 bytes = 36 bytes
STRIDE equ 36
;Vertex Array Size = 4 vertices * STRIDE = 144 bytes
VERTEX_ARRAY_SIZE equ 144

;Indices
TOTAL_INDICES equ 6
;Index  Array Size = 6 indices * sizeof(word) = 12 bytes
INDEX_ARRAY_SIZE equ 12

;Shaders
SHADER_INDEX_VERTEX equ 0
SHADER_INDEX_FRAGMENT equ 1


