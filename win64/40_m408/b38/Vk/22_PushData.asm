pushData proc pCommand:QWORD
LOCAL pCurrentGroup:QWORD, groupIndex:DWORD
LOCAL firstIndex:DWORD, indexCount:DWORD, materialIndex:DWORD
PROLOG 100h

mov pCommand,rcx

LOG_TEXT szVkCmdDrawIndexed

;Loop over material groups
mov r12,gpMtlGroups ;r12 = pointer to first MaterialGroup
mov pCurrentGroup,r12
xor r13,r13 ;group index
mov groupIndex,r13d
xor r14,r14
mov r14d,gnMtlGroupCount ;total groups
test r14d, r14d
jz lbl_Error_NoMtlGroups

lbl_DrawGroup:
;See MaterialGroup structure in struct.asm
mov r12,pCurrentGroup ;pointer to first MaterialGroup
mov eax,dword ptr[r12]
mov firstIndex,eax
mov ebx,dword ptr[r12+OFFSET_MTL_GROUP_INDEX_COUNT]
mov indexCount,ebx
mov ecx,dword ptr[r12+OFFSET_MTL_GROUP_MATERIAL_INDEX]
mov materialIndex,ecx

;Push diffuse color for this material
;Compute material address: gpMaterials + materialIndex * MTL_STRUCT_SIZE
xor r10,r10
mov r10d,materialIndex
imul r10,r10,MTL_STRUCT_SIZE
add r10,gpMaterials ;r10 = material base
add r10,OFFSET_KD ;r10 = address of diffuse (3 floats)

;Test hardcoded colors
lea r10,gpTestDiffuseColors
xor rax,rax
mov eax,groupIndex
imul rax,12 ;3 floats per color
add r10,rax

;LOG_TEXT szPushConstants
mov rdi,pCommand
mov rcx,qword ptr[rdi] ;current command buffer handle
mov rdx,ghVkPipelineLayout
mov r8,1 ;VK_SHADER_STAGE_VERTEX_BIT
xor r9,r9 ;offset = 0
;push constant size = 12 bytes (matches the shader’s vec3 Kd)
mov qword ptr[rsp+20h],0Ch
;pValues = r10 (diffuse colour address)
mov qword ptr[rsp+28h],r10
call vkCmdPushConstants
;LOG_TEXT szOK

;Draw indexed for this group
;LOG_TEXT szVkCmdDrawIndexed
mov rdi,pCommand
mov rcx, qword ptr[rdi] ;current command buffer handle
xor rdx,rdx
mov edx,indexCount
mov r8,1 ;instanceCount
xor r9,r9
mov r9d,firstIndex
mov qword ptr [rsp+20h],0 ;vertexOffset
mov qword ptr [rsp+28h],0 ;firstInstance
call vkCmdDrawIndexed
;LOG_TEXT szOK

; Advance to next group
add pCurrentGroup,MTL_GROUP_STRUCT_SIZE
inc groupIndex
mov r13d,groupIndex
cmp r13d,gnMtlGroupCount
jl lbl_DrawGroup
LOG_TEXT szOK
jmp lbl_pushData_End

lbl_Error_NoMtlGroups:
LOG_TEXT szErrNoMtlGroups
;jmp lbl_pushData_End

lbl_pushData_End:
EPILOG
pushData endp

