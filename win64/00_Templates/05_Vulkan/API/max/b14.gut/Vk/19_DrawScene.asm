DrawScene proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogDrawScene

;1. Acquire next swapchain image
LOG_TEXT szLogVkAcquireNextImageKHR
mov rcx, ghVkLogicalDevice
mov rdx, ghVkSwapchain
mov r8, 0FFFFFFFFh  ;timeout (UINT64_MAX)
mov r9,ghVkSemaphoreImageAvailable
mov qword ptr [rsp+20h],0 ;pFence (not used)
lea rax,dwImageIndex
mov qword ptr [rsp+28h],rax
call vkAcquireNextImageKHR
test eax,eax
jnz lbl_DrawScene_VkError
LOG_TEXT szOK

;2. Wait for fence (to ensure previous frame completed)
mov rcx,ghVkLogicalDevice
mov rdx,1 ;fenceCount
lea r8,ghVkFence
mov r9,1 ;VK_TRUE
call vkWaitForFences

;3. Reset fence
LOG_TEXT szLogVkResetFences
mov rcx,ghVkLogicalDevice
mov rdx,1
lea r8,ghVkFence
call vkResetFences
LOG_TEXT szOK

;4. Prepare submit info
;Wait semaphores: image available
lea rax,ghVkSemaphoreImageAvailable
mov submitInfo_pWaitSemaphores,rax
;Wait stage mask: COLOR_ATTACHMENT_OUTPUT_BIT
lea rax,dwStageMask
mov submitInfo_pWaitDstStageMask,rax
;Command buffer
mov eax,dwSwapchainImageCount
mov submitInfo_commandBufferCount,eax
xor rax,rax
mov eax,dwImageIndex
shl rax,3
add rax,gpCommandBuffers ;rax = &gpCommandBuffers[imageIndex]
mov submitInfo_pCommandBuffers,rax
;Signal semaphores: render finished
lea rax,ghVkSemaphoreRenderFinished
mov submitInfo_pSignalSemaphores,rax

;5. Submit to graphics queue
LOG_TEXT szLogVkQueueSubmit
mov rcx,ghVkGraphicsQueue
mov rdx,1 ;submitCount
lea r8,submitInfo_sType
mov r9,ghVkFence
call vkQueueSubmit
test eax,eax
jnz lbl_DrawScene_VkError
LOG_TEXT szOK

;6. Present
lea rax,ghVkSemaphoreRenderFinished
mov presentInfo_pWaitSemaphores,rax
lea rax,ghVkSwapchain
mov presentInfo_pSwapchains,rax
lea rax,dwImageIndex
mov presentInfo_pImageIndices,rax
mov presentInfo_pResults,0

LOG_TEXT szLogVkQueuePresentKHR
mov rcx,ghVkPresentQueue
lea rdx,presentInfo_sType
call vkQueuePresentKHR
test eax,eax
jnz lbl_DrawScene_VkError
LOG_TEXT szOK

mov isRefreshed,1
jmp lbl_DrawScene_End

lbl_DrawScene_VkError:
call SpellVkError
mov isRefreshed,0

lbl_DrawScene_End:
;Epilogue:
leave
ret
DrawScene endp
