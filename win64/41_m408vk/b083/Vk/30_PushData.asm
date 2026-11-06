pushData proc pCommand:QWORD
LOCAL Command:QWORD, pDynamic:QWORD
PROLOG 100h

mov pCommand,rcx
mov rax,qword ptr[rcx] ;*pCommand
mov Command,rax ;save dereferenced at [rbp-8]

xor rbx,rbx
lbl_DrawLoop:
cmp ebx,gnDrawItemCount
jge lbl_Done

;rdi = DrawItem
mov rdi,gpDrawItems
mov rcx,rbx
shl rcx,4
add rdi,rcx

;Pass 1 - Opaque
cmp dword ptr [rdi+12],0
jne lbl_Next

;Dynamic offset = materialIndex * 128 (repacked std140 layout)
xor eax,eax
mov eax,dword ptr[rdi+8]
shl rax,7 ;* 128
mov pDynamic,rax ;save Dynamic offset at [rbp-16]

;vkCmdBindDescriptorSets(cmd, GRAPHICS, layout, 0, 1, &set, 1, &offset)
mov rcx,Command
xor rdx,rdx ;VK_PIPELINE_BIND_POINT_GRAPHICS = 0
mov r8,ghVkPipelineLayout
xor r9d,r9d ; firstSet = 0
mov qword ptr [rsp+20h],1 ;descriptorSetCount
lea rax,ghVkDescriptorSet
mov qword ptr [rsp+28h],rax
mov qword ptr [rsp+30h],1 ;dynamicOffsetCount
lea rax,pDynamic
mov qword ptr [rsp+38h],rax
call vkCmdBindDescriptorSets

;vkCmdDrawIndexed(cmd, count, 1, firstIndex, 0, 0)
mov rcx,Command
xor rdx,rdx
mov edx,dword ptr[rdi+4] ;indexCount
mov r8d,1 ;instanceCount = 1
xor r9,r9
mov r9d,dword ptr[rdi+0] ;firstIndex = 0
mov qword ptr[rsp+20h],0 ;vertexOffset = 0
mov qword ptr[rsp+28h],0 ;firstInstance = 0
call vkCmdDrawIndexed

lbl_Next:
inc rbx
jmp lbl_DrawLoop

lbl_Done:
EPILOG
pushData endp


