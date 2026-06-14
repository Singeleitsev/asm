;01_SelectQueueFamilyProc.asm
;This code produces 5 passes of vkGetPhysicalDeviceSurfaceSupportKHR

selectQueueFamily proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Initialize indices to "not found"
mov graphicsFamilyIndex, -1
mov presentFamilyIndex, -1

;Loop over all queue families
xor rbx,rbx ;family index = 0
mov rsi,gpQueueFamilyProperties ;VkQueueFamilyProperties array
mov rdi,gpPresentSupport ;VkBool32 array for present support

next_family:
;Check if this family has VK_QUEUE_GRAPHICS_BIT
mov eax,[rsi] ;flags (first DWORD)
test eax,1 ;VK_QUEUE_GRAPHICS_BIT = 0x00000001
jz skip_graphics

;First graphics family found? (store only the first)
cmp graphicsFamilyIndex, -1
jne skip_graphics
mov graphicsFamilyIndex, ebx

skip_graphics:
;Query present support for this family
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceSupportKHR
mov rcx,ghVkPhysicalDevice
mov rdx,rbx ;queueFamilyIndex
mov r8,ghVkSurface
mov r9,rdi ;output VkBool32*
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax, eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szOK

;If this family supports presentation, store the first such family
cmp dword ptr [rdi],0
je skip_present
cmp presentFamilyIndex,-1
jne skip_present
mov presentFamilyIndex,ebx

skip_present:
;Advance to next family
inc rbx
add rsi,18h ;sizeof(VkQueueFamilyProperties) = 24
add rdi,4  ;sizeof(VkBool32) = 4
cmp ebx,dwQueueFamilyCount
jl next_family

;After the loop, validate that both required families were found
cmp graphicsFamilyIndex,-1
je no_graphics
cmp presentFamilyIndex,-1
je no_present

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
