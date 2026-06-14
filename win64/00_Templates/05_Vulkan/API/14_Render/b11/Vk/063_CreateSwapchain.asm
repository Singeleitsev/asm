;00_CreateSwapchainProc.asm
createSwapchain proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Fill the rest of VkSwapchainCreateInfoKHR structure
mov r8,ghVkSurface
mov swapchainInfo_surface,r8
mov r9d,chosenFormat
mov swapchainInfo_imageFormat,r9d
mov r10d,chosenExtent_width
mov swapchainInfo_imageExtent_width,r10d
mov r11d,chosenExtent_height
mov swapchainInfo_imageExtent_height,r11d
mov r12d,chosenPresentMode
mov swapchainInfo_presentMode,r12d

;2. Create Swapchain
LOG_TEXT szLogVkCreateSwapchainKHR
mov rcx,ghVkLogicalDevice
lea rdx,swapchainInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkSwapchain
call vkCreateSwapchainKHR
test eax,eax
jnz lbl_createSwapchain_VkError
cmp ghVkSwapchain,0
je lbl_createSwapchain_VkError
LOG_TEXT szOK

;3. Get swapchain images - First Pass
LOG_TEXT szLogVkGetSwapchainImagesKHR
mov rcx,ghVkLogicalDevice
mov rdx,ghVkSwapchain
lea r8,dwSwapchainImageCount
xor r9,r9
call vkGetSwapchainImagesKHR
test eax,eax
jnz lbl_createSwapchain_VkError
cmp dwSwapchainImageCount,0
je lbl_createSwapchain_VkError
LOG_TEXT szFirstPassOK

;4. Allocate Array for Image Handles
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_createSwapchain_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwSwapchainImageCount
shl r8,3 ; *8 bytes per handle
call HeapAlloc
test rax,rax
jz lbl_createSwapchain_WinError
mov gpSwapchainImages,rax
LOG_TEXT szOK

;5. Get Swapchain Images - Second Pass
LOG_TEXT szLogVkGetSwapchainImagesKHR
mov rcx,ghVkLogicalDevice
mov rdx,ghVkSwapchain
lea r8,dwSwapchainImageCount
mov r9,gpSwapchainImages
call vkGetSwapchainImagesKHR
test eax,eax
jnz lbl_createSwapchain_VkError
cmp gpSwapchainImages,0
je lbl_createSwapchain_VkError
LOG_TEXT szSecondPassOK

;6. Allocate Array for Image Views
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_createSwapchain_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwSwapchainImageCount
shl r8,3 ; *8 for view handles
call HeapAlloc
test rax,rax
jz lbl_createSwapchain_WinError
mov gpSwapchainImageViews,rax
LOG_TEXT szOK

;7. Fill the rest of VkImageViewCreateInfo structure
mov eax,chosenFormat
mov viewInfo_format,eax

;8. Create Image Views for each Swapchain Image
xor rbx,rbx ;Image Index
mov rsi,gpSwapchainImages
mov rdi,gpSwapchainImageViews

create_views_loop:

LOG_TEXT szLogVkCreateImageView
mov rax,qword ptr[rsi]
test rax, rax
jz lbl_createSwapchain_VkError
mov viewInfo_image,rax

mov rcx,ghVkLogicalDevice
lea rdx,viewInfo_sType
xor r8,r8 ;pAllocator
mov r9,rdi ;Output View Handle
call vkCreateImageView
test eax,eax
jnz lbl_createSwapchain_VkError
LOG_TEXT szOK

add rsi,8
add rdi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl create_views_loop

jmp lbl_createSwapchain_End

lbl_createSwapchain_WinError:
call SpellWinError
jmp lbl_createSwapchain_End

lbl_createSwapchain_VkError:
call SpellVkError

lbl_createSwapchain_End:
;Epilogue
leave
ret
createSwapchain endp

