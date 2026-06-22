;01_RecordCommandBuffers.asm
recordCommandBuffers proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill the VkRenderPassBeginInfo structure
mov rax,ghVkRenderPass
mov renderPassBeginInfo_renderPass,rax
mov rax,gpFramebuffers
mov renderPassBeginInfo_framebuffer,rax
mov eax,chosenExtent_width ;Integer
mov renderPassBeginInfo_renderArea_extent_width,eax
mov eax,chosenExtent_height ;Integer
mov renderPassBeginInfo_renderArea_extent_height,eax

;Loop over each swapchain image
xor rbx,rbx ;index
mov rsi,gpFramebuffers ;array of framebuffer handles
mov rdi,gpCommandBuffers ;array of command buffer handles

;Record the Command Buffer
LOG_TEXT szLogRecordCommandBuffers

next_cb:
;Set Framebuffer to corresponding Command Buffer
mov rax,qword ptr[rsi]
mov renderPassBeginInfo_framebuffer,rax

;Begin command buffer
LOG_TEXT szLogVkBeginCommandBuffer
mov rcx,qword ptr[rdi]
lea rdx,cmdBufferBeginInfo_sType
call vkBeginCommandBuffer
test eax,eax
jnz lbl_recordCommandBuffers_VkError
LOG_TEXT szOK

;Begin render pass
LOG_TEXT szLogVkCmdBeginRenderPass
mov rcx,qword ptr[rdi]
lea rdx,renderPassBeginInfo_sType
xor r8,r8 ;VK_SUBPASS_CONTENTS_INLINE
call vkCmdBeginRenderPass
LOG_TEXT szOK

;Bind graphics pipeline
LOG_TEXT szLogVkCmdBindPipeline
mov rcx,qword ptr[rdi]
xor rdx,rdx ;VK_PIPELINE_BIND_POINT_GRAPHICS = 0
mov r8,ghVkGraphicsPipeline
call vkCmdBindPipeline
LOG_TEXT szOK

;Set viewport
mov rcx,qword ptr[rdi] ;commandBuffer
xor rdx,rdx ;firstViewport = 0
mov r8,1 ;viewportCount = 1
lea r9,viewport_x ;pViewports
call vkCmdSetViewport

; Set scissor
mov rcx,qword ptr[rdi]  ;commandBuffer
xor rdx,rdx ;firstScissor = 0
mov r8,1 ;scissorCount = 1
lea r9, scissor_offset_x ;pScissors
call vkCmdSetScissor

;Draw 3 vertices
LOG_TEXT szLogVkCmdDraw
mov rcx,qword ptr[rdi]
mov rdx,3 ;vertexCount
mov r8,1 ;instanceCount
xor r9,r9 ;firstVertex = 0
mov qword ptr[rsp+20h],0 ;firstInstance = 0
call vkCmdDraw
LOG_TEXT szOK

;End render pass
LOG_TEXT szLogVkCmdEndRenderPass
mov rcx,qword ptr[rdi]
call vkCmdEndRenderPass
LOG_TEXT szOK

;End command buffer
LOG_TEXT szLogVkEndCommandBuffer
mov rcx,qword ptr[rdi]
call vkEndCommandBuffer
test eax,eax
jnz lbl_recordCommandBuffers_VkError
LOG_TEXT szOK

add rsi,8
add rdi,8
inc rbx
cmp ebx, dwSwapchainImageCount
jl next_cb

jmp lbl_recordCommandBuffers_End

lbl_recordCommandBuffers_VkError:
call SpellVkError

lbl_recordCommandBuffers_End:
;Epilogue
leave
ret
recordCommandBuffers endp


