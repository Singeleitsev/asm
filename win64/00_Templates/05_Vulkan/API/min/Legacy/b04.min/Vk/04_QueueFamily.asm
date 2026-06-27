getQueueFamilyProperties proc
PROLOG 100h

;1. First call to get count
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
xor r8,r8 ;pQueueFamilyProperties = NULL
call vkGetPhysicalDeviceQueueFamilyProperties
cmp dwQueueFamilyCount,0
je lbl_getQueueFamilyProperties_NoFamilies
LOG_TEXT szFirstPassOK

;2. Allocate memory for queueFamilyProperties
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getQueueFamilyProperties_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwQueueFamilyCount
imul r8,r8,18h ;sizeof VkQueueFamilyProperties = 24 bytes
call HeapAlloc
test rax,rax
jz lbl_getQueueFamilyProperties_WinError
mov gpQueueFamilyProperties,rax
LOG_TEXT szOK

;3. Second pass to get properties
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
mov r8,gpQueueFamilyProperties
call vkGetPhysicalDeviceQueueFamilyProperties
cmp gpQueueFamilyProperties,0
je lbl_getQueueFamilyProperties_VkError
LOG_TEXT szSecondPassOK

;4. Allocate memory for pSupport
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getQueueFamilyProperties_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwQueueFamilyCount
shl r8,2 ;sizeof VkBool32 = 4 bytes
call HeapAlloc
test rax,rax
jz lbl_getQueueFamilyProperties_WinError
mov gpPresentSupport,rax
LOG_TEXT szOK

jmp lbl_getQueueFamilyProperties_End

;Errors
lbl_getQueueFamilyProperties_WinError:
call SpellWinError
jmp lbl_getQueueFamilyProperties_End

lbl_getQueueFamilyProperties_NoFamilies:
LOG_TEXT szErrNoQueueFamilies
;jmp lbl_getQueueFamilyProperties_VkError

lbl_getQueueFamilyProperties_VkError:
call SpellVkError
;jmp lbl_getQueueFamilyProperties_End

lbl_getQueueFamilyProperties_End:
EPILOG
getQueueFamilyProperties endp



selectQueueFamily proc
LOCAL index:DWORD, pProperties:QWORD, pSupport:QWORD
PROLOG 100h

;Iterate to find graphics family and present support
xor rbx,rbx ;index counter (0...count-1)
mov index,ebx
mov rsi,gpQueueFamilyProperties
mov pProperties,rsi
mov rdi,gpPresentSupport ;pointer to presentSupport[familyIndex]
mov pSupport,rdi

next_family:
;Check VkQueueFamilyProperties.queueFlags (first DWORD)
mov rsi,pProperties
mov eax,dword ptr[rsi] ;flags
cmp eax,1 ;VK_QUEUE_GRAPHICS_BIT = 0x00000001
je skip_graphics
;Found graphics family
mov ebx,index
mov graphicsFamilyIndex,ebx

;Check present support for this family
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceSupportKHR
mov rcx,ghVkPhysicalDevice
xor rdx,rdx
mov edx,index
mov r8,ghVkSurface
mov r9,pSupport
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax,eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szOK

mov rdi,pSupport
cmp dword ptr[rdi],0
je skip_present
;This family supports presentation
mov ebx,index
mov presentFamilyIndex,ebx
jmp found_both

skip_present:
;Graphics but not present – keep graphics index, continue searching for present

skip_graphics:
add pProperties,18h ;sizeof VkQueueFamilyProperties
add pSupport,4 ;sizeof VkBool32
inc index
mov ebx,index
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
mov index,ebx
mov rsi,gpQueueFamilyProperties
mov pProperties,rsi
mov rdi,gpPresentSupport ;pointer to presentSupport[familyIndex]
mov pSupport,rdi

next_present:
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceSupportKHR
mov rcx,ghVkPhysicalDevice
xor rdx,rdx
mov edx,index
mov r8,ghVkSurface
mov r9,pSupport
call vkGetPhysicalDeviceSurfaceSupportKHR
test eax,eax
jnz lbl_selectQueueFamily_VkError
LOG_TEXT szSecondPassOK

mov rdi,pSupport
cmp dword ptr[rdi],0
jne found_present

add pProperties,18h ;sizeof VkQueueFamilyProperties
add pSupport,4 ;sizeof VkBool32
inc index
mov ebx,index
cmp ebx,dwQueueFamilyCount
jl next_present

jmp no_present

found_present:
mov ebx,index
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
EPILOG
selectQueueFamily endp
