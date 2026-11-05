;inlined by ogl\81_DrawElements.asm

;---------------------------
;Per-Subgroup Rendering Loop
;Walk: o -> g -> usemtl -> s -> draw faces
;-----------------------------------------

mov gnDrawObject,0

lbl_ObjLoop1:
mov eax,gnDrawObject
cmp eax,gnCurrent_o
jge lbl_Pass1Done

imul eax,eax,SIZE_OBJECT_METADATA
mov edi,gpBuffer_o
add edi,eax

mov eax,[edi + OFFSET_OBJECT_FIRST_GROUP_INDEX]
mov gnDrawGroup,eax
mov eax,[edi + OFFSET_OBJECT_LAST_GROUP_INDEX]
mov gnDrawGroupEnd,eax

lbl_GroupLoop1:
mov eax,gnDrawGroup
cmp eax,gnDrawGroupEnd
jg lbl_NextObject1

imul eax,eax,SIZE_GROUP_METADATA
mov edi,gpBuffer_g
add edi,eax

mov eax,[edi + OFFSET_GROUP_FIRST_USEMTL_INDEX]
mov gnDrawUsemtl,eax
mov eax,[edi + OFFSET_GROUP_LAST_USEMTL_INDEX]
mov gnDrawUsemtlEnd,eax

lbl_UsemtlLoop1:
mov eax,gnDrawUsemtl
cmp eax,gnDrawUsemtlEnd
jg lbl_NextGroup1

;Resolve material
mov eax,gpUsemtlToMaterial
mov ecx,gnDrawUsemtl
mov eax,[eax + ecx * 4]
imul eax,eax,SIZE_NEWMTL_METADATA
mov edi,gpBuffer_newmtl
add edi,eax

;Skip if transparent
movss xmm0,[edi + OFFSET_D]
comiss xmm0,f32_posOne ;Threshold of transparency  = 1.0
jb lbl_Skip1

;Push Kd.r, Kd.g, Kd.b, d
push dword ptr [edi + OFFSET_D] ;alpha
push dword ptr [edi + OFFSET_KD + 8] ;blue
push dword ptr [edi + OFFSET_KD + 4] ;green
push dword ptr [edi + OFFSET_KD + 0] ;red
call glColor4f

;Ambient = Kd so material contributes soft fill
lea eax,[edi + OFFSET_KD]
push eax
push 1200h ;GL_AMBIENT
push 0408h ;GL_FRONT_AND_BACK
call glMaterialfv

lea eax,[edi + OFFSET_KS]
push eax
push 1202h ;GL_SPECULAR
push 0408h ;GL_FRONT_AND_BACK
call glMaterialfv

push dword ptr [edi + OFFSET_NS]
push 1601h ;GL_SHININESS 
push 0408h ;GL_FRONT_AND_BACK
call glMaterialf

lea eax,[edi + OFFSET_KE]
push eax
push 1600h ;GL_EMISSION
push 0408h ;GL_FRONT_AND_BACK
call glMaterialfv

;Opaque: depth on,blend off
invoke glDisable, 0BE2h ;GL_BLEND

invoke glDepthMask, 1

;Draw all smoothing groups
mov eax,gnDrawUsemtl
imul eax,eax,SIZE_USEMTL_METADATA
mov edi,gpBuffer_usemtl
add edi,eax

mov eax,[edi + OFFSET_USEMTL_FIRST_SMOOTHING_INDEX]
mov gnDrawSmoothing,eax
mov eax,[edi + OFFSET_USEMTL_LAST_SMOOTHING_INDEX]
mov gnDrawSmoothingEnd,eax

lbl_SmoothLoop1:
mov eax,gnDrawSmoothing
cmp eax,gnDrawSmoothingEnd
jg lbl_Skip1

imul eax,eax,SIZE_SMOOTHING_METADATA
mov edi,gpBuffer_s
add edi,eax

mov eax,[edi + OFFSET_SMOOTHING_FIRST_FACE_INDEX]
mov edx,[edi + OFFSET_SMOOTHING_LAST_FACE_INDEX]
sub edx,eax
inc edx
imul edx,edx,3 ;count = faces * 3
imul eax,eax,12 ;3 indices * 4 bytes
add eax,gpIndices

push eax ;gpIndices
push 1405h ;type = GL_UNSIGNED_INT
push edx ;count
push 4 ;mode
call glDrawElements

inc gnDrawSmoothing
jmp lbl_SmoothLoop1

lbl_Skip1:
inc gnDrawUsemtl
jmp lbl_UsemtlLoop1

lbl_NextGroup1:
inc gnDrawGroup
jmp lbl_GroupLoop1

lbl_NextObject1:
inc gnDrawObject
jmp lbl_ObjLoop1

lbl_Pass1Done:
;Opaque Materials Done


