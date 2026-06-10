;00_SelectQueueFamilyProc.asm
selectQueueFamily proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. First call to get count
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
xor r8,r8 ;pQueueFamilyProperties = NULL
call vkGetPhysicalDeviceQueueFamilyProperties

;Check if any families found
cmp dwQueueFamilyCount,0
je lbl_selectQueueFamily_NoFamilies
LOG_TEXT szFirstPassOK

;2. Allocate memory for queueFamilyProperties
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_selectQueueFamily_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor rax,rax
mov eax,dwQueueFamilyCount
imul rax,rax,18h ;sizeof VkQueueFamilyProperties = 24 bytes
mov r8,rax
call HeapAlloc
test rax,rax
jz lbl_selectQueueFamily_WinError
mov gpQueueFamilyProperties,rax
LOG_TEXT szOK

;3. Second pass to get properties
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
mov r8,gpQueueFamilyProperties
call vkGetPhysicalDeviceQueueFamilyProperties
LOG_TEXT szSecondPassOK

;4. Allocate memory for pSupport
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_selectQueueFamily_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor rax,rax
mov eax,dwQueueFamilyCount
shl rax,2 ;sizeof VkBool32 = 4 bytes
mov r8,rax
call HeapAlloc
test rax,rax
jz lbl_selectQueueFamily_WinError
mov gpPresentSupport,rax
LOG_TEXT szOK

;5. Iterate to find graphics family and present support
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
lea r9,[rdi]
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax,eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szFirstPassOK

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
cmp graphicsFamilyIndex, -1
je no_graphics

;If present not found, try to find any family that supports present (maybe separate from graphics)
cmp presentFamilyIndex, -1
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
lea r9,[rdi]
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
LOG_TEXT szLogQueueFamilySuccess
jmp lbl_selectQueueFamily_End

;Errors
lbl_selectQueueFamily_WinError:
call SpellWinError
jmp lbl_selectQueueFamily_End

no_graphics:
LOG_TEXT szErrNoGraphicsQueue
jmp lbl_selectQueueFamily_End

no_present:
LOG_TEXT szErrNoPresentQueue
jmp lbl_selectQueueFamily_End

lbl_selectQueueFamily_NoFamilies:
LOG_TEXT szErrNoQueueFamilies
;jmp lbl_selectQueueFamily_VkError

lbl_selectQueueFamily_VkError:
call SpellVkError
;jmp lbl_selectQueueFamily_End

lbl_selectQueueFamily_End:
;Epilogue:
leave
ret
selectQueueFamily endp
