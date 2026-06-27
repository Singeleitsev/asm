createFrameBuffers proc
LOCAL index:DWORD, pViews:QWORD, pBuffers:QWORD
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
mov index,ebx
mov rsi,gpSwapchainImageViews
mov pViews,rsi
mov rdi,gpFramebuffers
mov pBuffers,rdi

create_fb:
mov frameBufferInfo_attachmentCount,1
mov rax,pViews
mov frameBufferInfo_pAttachments,rax

LOG_TEXT szLogVkCreateFrameBuffer
mov rcx,ghVkLogicalDevice
lea rdx,frameBufferInfo_sType
xor r8,r8
mov r9,pBuffers
call vkCreateFramebuffer
test eax,eax
jnz lbl_createFrameBuffers_VkError
LOG_TEXT szOK

add pViews,8
add pBuffers,8
inc index
mov ebx,index
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
LOCAL index:DWORD, pBuffers:QWORD
PROLOG 100h

cmp gpFramebuffers,0
je lbl_destroyFrameBuffers_End

xor rbx,rbx
mov index,ebx
mov rsi,gpFramebuffers
mov pBuffers,rsi

destroy_fb:
LOG_TEXT szLogVkDestroyFrameBuffer
mov rcx,ghVkLogicalDevice
mov rsi,pBuffers
mov rdx,qword ptr[rsi]
xor r8,r8
call vkDestroyFramebuffer
LOG_TEXT szOK

add pBuffers,8
inc index
mov ebx,index
cmp ebx,dwSwapchainImageCount
jl destroy_fb

mov gpFramebuffers,0

lbl_destroyFrameBuffers_End:
EPILOG
destroyFrameBuffers endp
