;----------
; saveAsJpg
; Captures the current swapchain image and saves it in jpg format
; using GDI+. Called from menu handler (WM_COMMAND)
;--------------------------------------------------
saveAsJpg proc
PROLOG 100h

LOG_TEXT szLogSavingAsJpg

;1. Wait for GPU idle
mov rcx,ghVkLogicalDevice
call vkDeviceWaitIdle

;2. STAGING BUFFER

;2.1. Calculate buffer size (width * height * 4 bytes for BGRA)
xor rax,rax
mov eax,swapchainInfo_imageExtent_width
xor rbx,rbx
mov ebx,swapchainInfo_imageExtent_height
imul rax,rbx
shl rax,2 ;*4
mov jpgBufferInfo_size,rax ;VkBufferCreateInfo structure

;2.2.Create staging buffer (TRANSFER_DST)
LOG_TEXT szVkCreateBuffer
mov rcx,ghVkLogicalDevice
lea rdx,jpgBufferInfo_sType ;pCreateInfo
xor r8,r8 ;pAllocator
lea r9,gpJpgStagingBuffer ;pBuffer
call vkCreateBuffer
test eax,eax
jnz lbl_VkError
cmp gpJpgStagingBuffer,0
je lbl_VkError
LOG_TEXT szOK

;2.3. Get buffer memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx, ghVkLogicalDevice
mov rdx, gpJpgStagingBuffer
lea r8,jpgMemReqs_size ;pMemoryRequirements
call vkGetBufferMemoryRequirements
cmp jpgMemReqs_size,0
je lbl_Error_NoImgMemReqs
cmp jpgMemReqs_alignment,0
je lbl_Error_NoImgMemReqs
LOG_TEXT szOK

;2.4. Find memory type: HOST_VISIBLE | HOST_COHERENT
mov ecx,jpgMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax,-1
je lbl_VkError

;2.5. Verify index < memoryTypeCount
mov ecx,memProps_memoryTypeCount
cmp eax,ecx
jae lbl_VkError ;index out of bounds

;2.6. Received from FindHostVisibleMemoryType
mov jpgAllocInfo_memoryTypeIndex,eax

;2.7. Fill the rest of VkMemoryAllocateInfo structure
mov rax,jpgMemReqs_size
mov jpgAllocInfo_allocationSize,rax

;2.8. Allocate device memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,jpgAllocInfo_sType
xor r8,r8 ;pAllocator
lea r9,gpJpgStagingMemory
call vkAllocateMemory
test eax,eax
jnz lbl_VkError
cmp gpJpgStagingMemory,0
je lbl_VkError
LOG_TEXT szOK

;2.9. Bind memory to buffer
LOG_TEXT szVkBindBufferMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpJpgStagingBuffer
mov r8,gpJpgStagingMemory
xor r9,r9 ;offset = 0
call vkBindBufferMemory
test eax,eax
jnz lbl_VkError
LOG_TEXT szOK

;3. One-time command buffer

;3.1. Allocate command Buffer
mov rax,ghVkCommandPool
mov jpgCmdAllocInfo_commandPool,rax

LOG_TEXT szVkAllocateCommandBuffers
mov rcx,ghVkLogicalDevice
lea rdx,jpgCmdAllocInfo_sType
lea r8,gpJpgCmdBuffer
call vkAllocateCommandBuffers
test eax,eax
jnz lbl_VkError
cmp gpJpgCmdBuffer,0
je lbl_VkError
LOG_TEXT szOK

;3.2. Begin command buffer
LOG_TEXT szVkBeginCommandBuffer
mov rcx,gpJpgCmdBuffer
lea rdx,jpgCmdBufferBeginInfo_sType
call vkBeginCommandBuffer
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

;4. Transition swapchain image: PRESENT_SRC -> TRANSFER_SRC

;Fill the rest of VkImageMemoryBarrier structure
;Get current swapchain image handle
xor rax,rax
mov eax,dwImageIndex
shl rax,3 ;*8 bytes per handle
add rax,gpSwapchainImages
mov rbx,qword ptr[rax]
mov jpgMemBarrier_image,rbx

LOG_TEXT szVkCmdPipelineBarrier
mov rcx,gpJpgCmdBuffer
mov rdx,1 ;srcStageMask = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT = 1
mov r8,1000h ;dstStageMask = VK_PIPELINE_STAGE_TRANSFER_BIT = 4096
xor r9,r9 ;dependencyFlags = 0
mov qword ptr[rsp+20h],0 ;memoryBarrierCount
mov qword ptr[rsp+28h],0 ;pMemoryBarriers
mov qword ptr[rsp+30h],0 ;bufferMemoryBarrierCount
mov qword ptr[rsp+38h],0 ;pBufferMemoryBarriers
mov qword ptr[rsp+40h],1 ;imageMemoryBarrierCount
lea rax,jpgMemBarrier_sType
mov qword ptr[rsp+48h],rax
call vkCmdPipelineBarrier
LOG_TEXT szOK

;5. Copy image to buffer
;VkBufferImageCopy
mov eax,swapchainInfo_imageExtent_width
mov jpgBufferImageCopy_imageExtent_width,eax
mov eax,swapchainInfo_imageExtent_height
mov jpgBufferImageCopy_imageExtent_height,eax

LOG_TEXT szVkCmdCopyImageToBuffer
mov rcx,gpJpgCmdBuffer
mov rdx,jpgMemBarrier_image
mov r8,6 ;VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
mov r9,gpJpgStagingBuffer
mov qword ptr[rsp+20h],1 ;regionCount
lea rax,jpgBufferImageCopy_bufferOffset ;VkBufferImageCopy
mov qword ptr[rsp+28h],rax ;pRegions
call vkCmdCopyImageToBuffer
LOG_TEXT szOK

;6. Transition back: TRANSFER_SRC -> PRESENT_SRC
;Reuse the VkImageMemoryBarrier structure
mov jpgMemBarrier_oldLayout,6 ;VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
mov jpgMemBarrier_newLayout,3B9ACDEAh ;VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002
mov jpgMemBarrier_dstAccessMask,0

LOG_TEXT szVkCmdPipelineBarrier
mov rcx,gpJpgCmdBuffer
mov rdx,1000h ;srcStageMask = VK_PIPELINE_STAGE_TRANSFER_BIT = 4096
mov r8,1 ;dstStageMask = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT
xor r9,r9
mov qword ptr [rsp+20h],0 ;memoryBarrierCount
mov qword ptr[rsp+28h],0 ;pMemoryBarriers
mov qword ptr[rsp+30h],0 ;bufferMemoryBarrierCount
mov qword ptr[rsp+38h],0 ;pBufferMemoryBarriers
mov qword ptr [rsp+40h],1 ;imageMemoryBarrierCount
lea rax,jpgMemBarrier_sType
mov qword ptr [rsp+48h],rax
call vkCmdPipelineBarrier
LOG_TEXT szOK

;7. End command buffer
LOG_TEXT szVkEndCommandBuffer
mov rcx, gpJpgCmdBuffer
call vkEndCommandBuffer
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

;8. Create fence for submission
LOG_TEXT szVkCreateFence
mov rcx,ghVkLogicalDevice
lea rdx,jpgFenceInfo_sType
xor r8,r8
lea r9,gpJpgFence
call vkCreateFence
test eax,eax
jnz lbl_VkError
cmp gpJpgFence,0
je lbl_VkError
LOG_TEXT szOK

;9. Submit to graphics queue
;Fill the rest of VkSubmitInfo
lea rax, gpJpgCmdBuffer
mov jpgSubmitInfo_pCommandBuffers,rax

LOG_TEXT szVkQueueSubmit
mov rcx,ghVkGraphicsQueue
mov rdx,1
lea r8,jpgSubmitInfo_sType
mov r9, gpJpgFence
call vkQueueSubmit
test eax,eax
jnz lbl_VkError
LOG_TEXT szOK

;10. Wait for completion
mov rcx,ghVkLogicalDevice
mov rdx,1 ;fenceCount = 1
lea r8,gpJpgFence
mov r9,1 ;waitAll = VK_TRUE
mov qword ptr [rsp+20h],-1 ; timeout = infinite
call vkWaitForFences
test eax,eax
jnz lbl_VkError

;11. Map buffer to CPU
LOG_TEXT szVkMapMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpJpgStagingMemory
xor r8,r8
mov r9,0FFFFFFFFh ;size = whole buffer
mov qword ptr [rsp+20h],0 ;flags
lea rax,gpJpgMap
mov qword ptr [rsp+28h],rax ;ppData
call vkMapMemory
test eax,eax
jnz lbl_VkError
LOG_TEXT szOK

;12. Initialise GDI+
lea rcx,tokenGdiPlus
lea rdx,gdi_GdiplusVersion
xor r8,r8
call GdiplusStartup
test eax,eax
jnz lbl_WinError
LOG_TEXT szGdiplusInitOK

;13. Create GDI+ Bitmap from raw BGRA data
xor rcx,rcx
mov ecx,swapchainInfo_imageExtent_width
xor rdx,rdx
mov edx,swapchainInfo_imageExtent_height
mov r8,rcx
shl r8,2 ;stride = width * 4
mov r9,26200Ah ; PixelFormat32bppARGB (works for BGRA)
mov rax,gpJpgMap ;scan0
mov qword ptr[rsp+20h],rax
lea rax,gpBitmap
mov qword ptr[rsp+28h],rax ;&gpBitmap
call GdipCreateBitmapFromScan0
test eax,eax
jnz lbl_WinError

;14. Save as JPG
mov rcx,gpBitmap
lea rdx,szFileNameJpgW
lea r8,guidJpg ;00 F4 7C 55 04 1A D3 11 9A 73 00 00 F8 1E F3 2E
xor r9,r9 ;encoderParams = NULL
call GdipSaveImageToFile
test eax,eax
jnz lbl_WinError

;15. Report Success
mov rcx,ghWndMain
lea rdx,szLogSavedAsJpg
lea r8,szMainWndTitle ;"Vulkan Template"
mov r9,40h ;MB_OK Or MB_ICONINFORMATION
Call MessageBoxA
LOG_TEXT szLogSavedAsJpg

;16. Cleanup GDI+
mov rcx,gpBitmap
call GdipDisposeImage
mov rcx,tokenGdiPlus
call GdiplusShutdown

;17. Unmap and free Vulkan resources
mov rcx, ghVkLogicalDevice
mov rdx, gpJpgStagingMemory
call vkUnmapMemory

;18. Free command buffer
mov rcx,ghVkLogicalDevice
mov rdx,ghVkCommandPool
mov r8,1
lea r9,gpJpgCmdBuffer
call vkFreeCommandBuffers

;19. Destroy fence
mov rcx,ghVkLogicalDevice
mov rdx,gpJpgFence
xor r8,r8
call vkDestroyFence

;20. Free staging memory
mov rcx, ghVkLogicalDevice
mov rdx, gpJpgStagingMemory
xor r8, r8
call vkFreeMemory

;21. Destroy staging buffer
mov rcx,ghVkLogicalDevice
mov rdx,gpJpgStagingBuffer
xor r8,r8
call vkDestroyBuffer

;Success
jmp lbl_End

;Errors
lbl_Error_NoImgMemReqs:
LOG_TEXT szNoImgMemReqs
jmp lbl_End

lbl_WinError:
call SpellWinError
jmp lbl_End

lbl_VkError:
call SpellVkError
;jmp lbl_End

lbl_End:
    EPILOG
saveAsJpg endp
