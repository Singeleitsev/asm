;041_SelectQueueFamilyProc.asm
;This code produces 1 pass of vkGetPhysicalDeviceSurfaceSupportKHR

selectQueueFamily proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Iterate to find graphics family and present support
xor rbx,rbx ;index counter (0...count-1)
mov rsi,gpQueueFamilyProperties
mov rdi,gpPresentSupport ;pointer to presentSupport[familyIndex]

next_family:
;Check VkQueueFamilyProperties.queueFlags (first DWORD)
mov eax,dword ptr[rsi] ;flags
test eax,1 ;VK_QUEUE_GRAPHICS_BIT = 0x00000001
jz skip_graphics
;Found graphics family
mov graphicsFamilyIndex,ebx

;Check present support for this family
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceSupportKHR
mov rcx,ghVkPhysicalDevice
mov rdx,rbx ;queueFamilyIndex
mov r8,ghVkSurface
mov r9,rdi
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax,eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szOK

cmp dword ptr[rdi],0
je skip_present
;This family supports presentation
mov presentFamilyIndex,ebx
jmp found_both

skip_present:
;Graphics but not present – keep graphics index, continue searching for present

skip_graphics:
inc rbx
add rsi,18h ;sizeof VkQueueFamilyProperties
add rdi,4 ;sizeof VkBool32
cmp ebx,dwQueueFamilyCount
jl next_family

;After loop: if graphics not found -> error
cmp graphicsFamilyIndex,-1
je no_graphics

;If present not found, try to find any family that supports present (maybe separate from graphics)
cmp presentFamilyIndex,-1
jne found_both

;Second pass: find any present family (different from graphics)
xor rbx,rbx
mov rsi,gpQueueFamilyProperties
mov rdi,gpPresentSupport ;pointer to presentSupport[familyIndex]

next_present:
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceSupportKHR
mov rcx,ghVkPhysicalDevice
mov rdx,rbx
mov r8,ghVkSurface
mov r9,rdi
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax,eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szSecondPassOK

cmp dword ptr[rdi],0
jne found_present
inc rbx
add rsi,18h ;sizeof VkQueueFamilyProperties
add rdi,4 ;sizeof VkBool32
cmp ebx,dwQueueFamilyCount
jl next_present

jmp no_present

found_present:
mov presentFamilyIndex,ebx
jmp found_both

;Log success
found_both:
LOG_TEXT szLogVkQueueFamilySuccess
jmp lbl_selectQueueFamily_End

;Errors
no_graphics:
LOG_TEXT szErrNoGraphicsQueue
jmp lbl_selectQueueFamily_End

no_present:
LOG_TEXT szErrNoPresentQueue
jmp lbl_selectQueueFamily_End

lbl_selectQueueFamily_VkError:
call SpellVkError
;jmp lbl_selectQueueFamily_End

lbl_selectQueueFamily_End:
;Epilogue:
leave
ret
selectQueueFamily endp
