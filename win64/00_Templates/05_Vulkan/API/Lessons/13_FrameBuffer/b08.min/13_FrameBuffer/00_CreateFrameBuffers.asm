;00_CreateFrameBuffers.asm
createFrameBuffers proc
LOCAL fbAttachments:QWORD

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Allocate memory for the array of Framebuffer handles
LOG_TEXT szLogMemoryAllocating
mov eax,dwSwapchainImageCount
shl eax,3 ;*8 bytes per handle
mov r8,rax
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
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
;Epilogue
leave
ret
createFrameBuffers endp

