pushData proc pCommand:QWORD
LOCAL pCurrentGroup:QWORD, groupIndex:DWORD
LOCAL firstIndex:DWORD, indexCount:DWORD, materialIndex:DWORD
PROLOG 100h

mov pCommand, rcx

; Loop over material groups
mov r12, gpMtlGroups
mov pCurrentGroup, r12
xor r13, r13
mov groupIndex, r13d

; Check if we have groups
mov r14d, gnMtlGroupCount
test r14d, r14d
jz lbl_Error_NoMtlGroups

lbl_DrawGroup:
    ; Read MaterialGroup structure
    mov r12, pCurrentGroup
    mov eax, dword ptr [r12]                     ; firstIndex
    mov firstIndex, eax
    mov ebx, dword ptr [r12 + OFFSET_MTL_GROUP_INDEX_COUNT]
    mov indexCount, ebx
    mov ecx, dword ptr [r12 + OFFSET_MTL_GROUP_MATERIAL_INDEX]
    mov materialIndex, ecx

    ; Push diffuse color for this material
    ; Compute material address
    xor r10, r10
    mov r10d, materialIndex
    imul r10, r10, MATERIAL_METADATA_SIZE
    add r10, gpDataMaterials
    add r10, OFFSET_KD          ; Address of diffuse color (3 floats)

    ; Push constants
    mov rdi, pCommand
    mov rcx, qword ptr [rdi]    ; Command buffer handle
    mov rdx, ghVkPipelineLayout
    mov r8, 1                   ; VK_SHADER_STAGE_VERTEX_BIT
    xor r9, r9                  ; offset = 0
    mov qword ptr [rsp+20h], 0Ch ; Size = 12 bytes
    mov qword ptr [rsp+28h], r10 ; pValues = diffuse color
    call vkCmdPushConstants

    ; Draw indexed for this group
    mov rdi, pCommand
    mov rcx, qword ptr [rdi]
    xor rdx, rdx
    mov edx, indexCount
    mov r8, 1                   ; instanceCount
    xor r9, r9
    mov r9d, firstIndex
    mov qword ptr [rsp+20h], 0  ; vertexOffset
    mov qword ptr [rsp+28h], 0  ; firstInstance
    call vkCmdDrawIndexed

    ; Advance to next group
    add pCurrentGroup, MTL_GROUP_STRUCT_SIZE
    inc groupIndex
    mov r13d, groupIndex
    cmp r13d, gnMtlGroupCount
    jl lbl_DrawGroup

    jmp lbl_pushData_End

lbl_Error_NoMtlGroups:
    LOG_TEXT szErrNoMtlGroups

lbl_pushData_End:
EPILOG
pushData endp

