;Test Diffuse colors from m408.mtl, in order of materials (0..6)
;Each color is 3 floats (12 bytes)
align 10h
gpTestDiffuseColors \
    dd 0.0000, 0.0000, 0.0000 ;material 0: Glass (black diffuse)
    dd 1.0000, 1.0000, 1.0000 ;material 1: Chrome (white)
    dd 0.0314, 0.0314, 0.5333 ;material 2: BlueSpace
    dd 0.3412, 0.0000, 0.0000 ;material 3: Lights_Red
    dd 0.8431, 0.8431, 0.8431 ;material 4: Lights_Rear_White
    dd 0.2627, 0.2627, 0.2627 ;material 5: Rusty
    dd 0.8392, 0.8980, 0.6510 ;material 6: Black

;Numeric Constants
f32_neg1 dd 0BF800000h ;-1.0
f32_0p1 dd 3DCCCCCDh ;0.1
f32_1 dd 3F800000h ;1.0
f32_10 dd 41200000h ;10.0

;Menu IDs
IDM_APP_EXIT equ 10Fh
IDM_HELP_ABOUT equ 0F01h

;Material field offsets (relative to base pointer)
OFFSET_NAME equ 00h ;Material name (32 bytes, null-terminated)
OFFSET_KD equ 20h ;Diffuse color (3 x float, Kd)
OFFSET_KS equ 2Ch ;Specular color (3 x float, Ks)
OFFSET_KA equ 38h ;Ambient color (3 x float, Ka)
OFFSET_KE equ 44h ;Emission color (3 x float, Ke)
OFFSET_NS equ 50h ;Shininess / specular exponent (float, Ns)
OFFSET_NI equ 54h ;Index of refraction (float, Ni)
OFFSET_D equ 58h ;Dissolve / opacity (float, d)
OFFSET_TR equ 5Ch ;Transparency (inverse of d, float, Tr)
OFFSET_PR equ 60h ;Roughness (PBR, float, Pr)
OFFSET_PM equ 64h ;Metallic (PBR, float, Pm)
OFFSET_ILLUM equ 68h ;Illumination model (DWORD, illum)
OFFSET_TF equ 6Ch ;Transmission filter color (3 x float, Tf)
OFFSET_PC equ 78h ;Clearcoat / sheen (float, Pc)
OFFSET_PCR equ 7Ch ;Clearcoat roughness (float, Pcr)
OFFSET_MAP_KD equ 80h ;Diffuse texture map filename (pointer, map_Kd)
OFFSET_MAP_KS equ 88h ;Specular texture map filename (pointer, map_Ks)
MTL_STRUCT_SIZE equ 90h ;Total block size (144 bytes, room to grow later)

;MaterialGroup field offsets (used for grouping faces by material)
OFFSET_MTL_GROUP_FIRST_INDEX equ 0 ;DWORD firstIndex
OFFSET_MTL_GROUP_INDEX_COUNT equ 4 ;DWORD indexCount
OFFSET_MTL_GROUP_MATERIAL_INDEX equ 8 ;DWORD materialIndex
MTL_GROUP_STRUCT_SIZE equ 10h ;total size (aligned to 16 bytes)


