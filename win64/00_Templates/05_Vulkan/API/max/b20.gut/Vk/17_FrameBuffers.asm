createFrameBuffers proc
LOCAL fbAttachments:QWORD
PROLOG 100h

;1. Allocate memory for the array of Framebuffer handles
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap

mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwSwapchainImageCount
shl r8,3 ;*8 bytes per handle
call HeapAlloc
test rax,rax
jz lbl_createFrameBuffers_WinError
mov gpFramebuffers,rax
LOG_TEXT szOK

;2. Fill the VkFramebufferCreateInfo structure
mov rax,ghVkRenderPass
mov frameBufferInfo_renderPass,rax
mov eax,chosenExtent_width
mov frameBufferInfo_width,eax
mov eax,chosenExtent_height
mov frameBufferInfo_height,eax

;3. Loop over each Swapchain Image View
xor rbx,rbx
mov rsi,gpSwapchainImageViews ;Array of VkImageView handles
mov rdi,gpFramebuffers ;Array to store VkFramebuffer handles

create_fb:
mov rax,qword ptr[rsi] ;Image view handle
mov fbAttachments,rax
mov frameBufferInfo_attachmentCount,1
lea rax,fbAttachments
mov frameBufferInfo_pAttachments,rax

LOG_TEXT szLogVkCreateFrameBuffer
mov rcx,ghVkLogicalDevice
lea rdx,frameBufferInfo_sType
xor r8,r8
lea r9,qword ptr[rdi] ;Output framebuffer handle
call vkCreateFramebuffer
test eax,eax
jnz lbl_createFrameBuffers_VkError
LOG_TEXT szOK

add rsi,8
add rdi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl create_fb

jmp lbl_createFrameBuffers_End

lbl_createFrameBuffers_WinError:
call SpellWinError
jmp lbl_createFrameBuffers_End

lbl_createFrameBuffers_VkError:
call SpellVkError

lbl_createFrameBuffers_End:
EPILOG
createFrameBuffers endp



destroyFrameBuffers proc
PROLOG 100h

cmp gpFramebuffers,0
je lbl_destroyFrameBuffers_End

xor rbx,rbx
mov rsi,gpFramebuffers

destroy_fb:
LOG_TEXT szLogVkDestroyFrameBuffer
mov rcx,ghVkLogicalDevice
mov rdx,qword ptr[rsi]
xor r8,r8
call vkDestroyFramebuffer
LOG_TEXT szOK

add rsi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl destroy_fb

mov gpFramebuffers,0

lbl_destroyFrameBuffers_End:
EPILOG
destroyFrameBuffers endp
