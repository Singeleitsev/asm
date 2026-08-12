pushData proc pCommand:QWORD
LOCAL pCurrentGroup:QWORD, groupIndex:DWORD
LOCAL firstIndex:DWORD, indexCount:DWORD, materialIndex:DWORD
PROLOG 100h

mov pCommand,rcx

LOG_TEXT szVkCmdDrawIndexed

; Check if we have material groups
xor r14,r14
mov r14d,gnMtlGroupCount
test r14d, r14d
jz lbl_Error_NoMtlGroups

; =====================================================
; PASS 1: Draw ALL OPAQUE groups (alpha == 1.0)
; =====================================================
mov r12,gpMtlGroups
mov pCurrentGroup,r12
xor r13,r13
mov groupIndex,r13d

LOG_TEXT szLogOpaquePass
lbl_DrawOpaqueGroup:
; Get group data
mov r12,pCurrentGroup
mov eax,dword ptr[r12]
mov firstIndex,eax
mov ebx,dword ptr[r12+OFFSET_MTL_GROUP_INDEX_COUNT]
mov indexCount,ebx
mov ecx,dword ptr[r12+OFFSET_MTL_GROUP_MATERIAL_INDEX]
mov materialIndex,ecx

; Check if this group is opaque (alpha == 1.0)
lea r10,gpTestDiffuseColors
xor rax,rax
mov eax,groupIndex
imul rax,10h          ; 16 bytes per material (3 floats + alpha)
add r10,rax
movss xmm0,dword ptr[r10+0Ch]  ; alpha is at offset 12 (0x0C)

; Compare alpha with 1.0
comiss xmm0,f32_1
jne lbl_SkipOpaqueGroup   ; Skip if not opaque

; Draw this opaque group
lbl_DrawGroup0:

    lea r10,gpTestDiffuseColors
    xor rax,rax
    mov eax,groupIndex
    imul rax,10h
    add r10,rax

    ; Push constants
    mov rdi,pCommand
    mov rcx,qword ptr[rdi]           ; current command buffer handle
    mov rdx,ghVkPipelineLayout
    mov r8,1                         ; VK_SHADER_STAGE_VERTEX_BIT
    xor r9,r9                        ; offset = 0
    mov qword ptr[rsp+20h],10h       ; push constant size = 16 bytes
    mov qword ptr[rsp+28h],r10       ; pValues = diffuse colour address
    call vkCmdPushConstants

    ; Draw indexed for this group
    mov rdi,pCommand
    mov rcx, qword ptr[rdi]          ; current command buffer handle
    xor rdx,rdx
    mov edx,indexCount
    mov r8,1                         ; instanceCount
    xor r9,r9
    mov r9d,firstIndex
    mov qword ptr [rsp+20h],0        ; vertexOffset
    mov qword ptr [rsp+28h],0        ; firstInstance
    call vkCmdDrawIndexed

jmp lbl_NextOpaqueGroup

lbl_SkipOpaqueGroup:
; Transparent - skip for now
jmp lbl_NextOpaqueGroup

lbl_NextOpaqueGroup:
add pCurrentGroup,MTL_GROUP_STRUCT_SIZE
inc groupIndex
mov r13d,groupIndex
cmp r13d,gnMtlGroupCount
jl lbl_DrawOpaqueGroup

; =====================================================
; PASS 2: Draw ALL TRANSPARENT groups (alpha < 1.0)
; =====================================================
mov r12,gpMtlGroups
mov pCurrentGroup,r12
xor r13,r13
mov groupIndex,r13d

LOG_TEXT szLogTransparentPass
lbl_DrawTransparentGroup:
; Get group data
mov r12,pCurrentGroup
mov eax,dword ptr[r12]
mov firstIndex,eax
mov ebx,dword ptr[r12+OFFSET_MTL_GROUP_INDEX_COUNT]
mov indexCount,ebx
mov ecx,dword ptr[r12+OFFSET_MTL_GROUP_MATERIAL_INDEX]
mov materialIndex,ecx

; Check if this group is transparent (alpha < 1.0)
lea r10,gpTestDiffuseColors
xor rax,rax
mov eax,groupIndex
imul rax,10h
add r10,rax
movss xmm0,dword ptr[r10+0Ch]  ; alpha value

; Compare alpha with 1.0
comiss xmm0,f32_1
je lbl_SkipTransparentGroup   ; Skip if opaque

; Draw this transparent group
lbl_DrawGroup1:

    lea r10,gpTestDiffuseColors
    xor rax,rax
    mov eax,groupIndex
    imul rax,10h
    add r10,rax

    ; Push constants
    mov rdi,pCommand
    mov rcx,qword ptr[rdi]           ; current command buffer handle
    mov rdx,ghVkPipelineLayout
    mov r8,1                         ; VK_SHADER_STAGE_VERTEX_BIT
    xor r9,r9                        ; offset = 0
    mov qword ptr[rsp+20h],10h       ; push constant size = 16 bytes
    mov qword ptr[rsp+28h],r10       ; pValues = diffuse colour address
    call vkCmdPushConstants

    ; Draw indexed for this group
    mov rdi,pCommand
    mov rcx, qword ptr[rdi]          ; current command buffer handle
    xor rdx,rdx
    mov edx,indexCount
    mov r8,1                         ; instanceCount
    xor r9,r9
    mov r9d,firstIndex
    mov qword ptr [rsp+20h],0        ; vertexOffset
    mov qword ptr [rsp+28h],0        ; firstInstance
    call vkCmdDrawIndexed

jmp lbl_NextTransparentGroup

lbl_SkipTransparentGroup:
jmp lbl_NextTransparentGroup

lbl_NextTransparentGroup:
add pCurrentGroup,MTL_GROUP_STRUCT_SIZE
inc groupIndex
mov r13d,groupIndex
cmp r13d,gnMtlGroupCount
jl lbl_DrawTransparentGroup

LOG_TEXT szOK
jmp lbl_pushData_End

lbl_Error_NoMtlGroups:
LOG_TEXT szErrNoMtlGroups

lbl_pushData_End:
EPILOG
pushData endp

