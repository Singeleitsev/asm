;Numeric Constants
f32_negOne dd 0BF800000h ;-1.0
f32_0p1 dd 3DCCCCCDh ;0.1
f32_posOne dd 3F800000h ;1.0
f32_10 dd 41200000h ;10.0

;Menu IDs
IDM_FILE_SAVE equ 103h
IDM_FILE_EXIT equ 10Fh
IDM_HELP_ABOUT equ 0F01h

;Status Bar
STATUS_BAR_PARTS equ 6

;String
TEXT_BUFFER_SIZE equ 40h ;64 bytes

;Mouse Modes
MOUSE_MODE_FREE equ 0
MOUSE_MODE_CAMERA_ROTATE equ 1
MOUSE_MODE_CAMERA_DRAG equ 2
MOUSE_MODE_OBJECT_ROTATE equ 3


;Object

;Data
STRIDE equ 36 ;3 coordinates + 3 normals + 3 colors) * 4 bytes

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
OFFSET_GROUP_HOST_OBJECT_INDEX equ 44h
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
OFFSET_SMOOTHING_HOST_USEMTL_INDEX equ 44h
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
OFFSET_NS equ OFFSET_KE + 0Ch
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
OFFSET_PC equ OFFSET_TF + 0Ch
;Clearcoat roughness (float, Pcr)
OFFSET_PCR equ OFFSET_PC + 4
;Diffuse texture map filename (pointer, map_Kd)
OFFSET_MAP_KD equ OFFSET_PCR + 4
;Specular texture map filename (pointer, map_Ks)
OFFSET_MAP_KS equ OFFSET_MAP_KD + 4
SIZE_NEWMTL_METADATA equ OFFSET_MAP_KS + 4


