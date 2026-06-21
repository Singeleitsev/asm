createImageViews proc
PROLOG 100h

;1. Allocate Array for Image Views
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_createImageViews_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwSwapchainImageCount
shl r8,3 ; *8 for view handles
call HeapAlloc
test rax,rax
jz lbl_createImageViews_WinError
mov gpSwapchainImageViews,rax
LOG_TEXT szOK

;3. Fill the rest of VkImageViewCreateInfo structure
mov eax,chosenFormat
mov viewInfo_format,eax

;3. Create Image Views for each Swapchain Image
xor rbx,rbx ;Image Index
mov rsi,gpSwapchainImages
mov rdi,gpSwapchainImageViews

create_views_loop:

LOG_TEXT szLogVkCreateImageView
mov rax,qword ptr[rsi]
test rax, rax
jz lbl_createImageViews_VkError
mov viewInfo_image,rax

mov rcx,ghVkLogicalDevice
lea rdx,viewInfo_sType
xor r8,r8 ;pAllocator
mov r9,rdi ;Output View Handle
call vkCreateImageView
test eax,eax
jnz lbl_createImageViews_VkError
LOG_TEXT szOK

add rsi,8
add rdi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl create_views_loop

jmp lbl_createImageViews_End

lbl_createImageViews_WinError:
call SpellWinError
jmp lbl_createImageViews_End

lbl_createImageViews_VkError:
call SpellVkError

lbl_createImageViews_End:
EPILOG
createImageViews endp



destroyImageViews proc
PROLOG 100h

cmp gpSwapchainImageViews,0
je lbl_destroyImageViews_End
xor rbx,rbx
mov rsi,gpSwapchainImageViews

destroy_views_loop:
mov rcx,ghVkLogicalDevice
mov rdx,qword ptr[rsi] ;Image view handle
xor r8,r8
call vkDestroyImageView
add rsi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl destroy_views_loop

lbl_destroyImageViews_End:
EPILOG
destroyImageViews endp
