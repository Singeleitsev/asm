;01_DestroySwapchainProc.asm
destroySwapchain proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Destroy Image Views First
cmp gpSwapchainImageViews,0
je skip_views
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

skip_views:
cmp ghVkSwapchain,0
je lbl_destroySwapchain_End

LOG_TEXT szLogVkDestroySwapchainKHR
mov rcx,ghVkLogicalDevice
mov rdx,ghVkSwapchain
xor r8,r8
call vkDestroySwapchainKHR
mov ghVkSwapchain,0
LOG_TEXT szOK

lbl_destroySwapchain_End:
;Epilogue
leave
ret
destroySwapchain endp

