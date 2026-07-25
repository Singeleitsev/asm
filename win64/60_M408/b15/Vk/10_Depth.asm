createDepthImage proc
LOCAL index:DWORD
PROLOG 100h

;1. Fill VkImageCreateInfo
mov eax,chosenExtent_width
mov imageInfo_extent_width,eax
mov eax,chosenExtent_height
mov imageInfo_extent_height,eax

;2. Create Depth Image
LOG_TEXT szVkCreateImage
mov rcx,ghVkLogicalDevice
lea rdx,imageInfo_sType
xor r8,r8
lea r9,ghVkDepthImage
call vkCreateImage
test rax,rax
jnz lbl_VkError
cmp ghVkDepthImage,0
je lbl_VkError
mov rax,ghVkDepthImage
mov depthViewInfo_image,rax
LOG_TEXT szOK

;3. Get Image Memory Requirements
LOG_TEXT szVkGetImageMemoryRequirements
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDepthImage
lea r8,depthMemReqs_size ;address of VkMemoryRequirements structure
call vkGetImageMemoryRequirements
cmp depthMemReqs_size,0
je lbl_Error_NoImgMemReqs
cmp depthMemReqs_alignment,0
je lbl_Error_NoImgMemReqs
LOG_TEXT szOK

;4. Find memory type index
LOG_TEXT szVkGetPhysicalDeviceMemoryProperties
mov rcx,ghVkPhysicalDevice
lea rdx,memProps_memoryTypeCount ;address of VkPhysicalDeviceMemoryProperties
call vkGetPhysicalDeviceMemoryProperties
cmp memProps_memoryTypeCount,0
je lbl_Error_NoDeviceMemory
LOG_TEXT szOK

;5. Loop through memory types
xor rcx,rcx ;i = 0
mov index,ecx

;Check if this type supports the required memory type bits
search_memory_type:
mov rax,1
mov ecx,index
shl eax,cl ;1 << index
and eax,depthMemReqs_memoryTypeBits
jz next_memory_type

;Check if it has VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT (0x01)
;Offset of memoryTypes[i].propertyFlags is i * 8
shl rcx,3 ;i*8
lea rsi,memProps_memoryTypes
add rsi,rcx
test dword ptr[rsi],1 ;check if VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT is set
jnz found_memory_type

next_memory_type:
inc index
mov ecx,index
cmp ecx,memProps_memoryTypeCount
jl search_memory_type

;If not found, fallback to any type matching bits (without checking properties)
xor rcx,rcx
mov index,ecx

fallback_search:
mov rax,1
mov ecx,index
shl eax,cl ;1 << index
and eax,depthMemReqs_memoryTypeBits
jnz found_memory_type

inc index
mov ecx,index
cmp ecx,memProps_memoryTypeCount
jl fallback_search

;If still not found -> error
LOG_TEXT szNoDeviceMemory
jmp lbl_Error_NoDeviceMemory

found_memory_type:
mov ecx,index
mov depthAllocInfo_memoryTypeIndex,ecx
LOG_TEXT szDeviceMemoryFound

;6. Align allocation size to the required alignment
mov rax,depthMemReqs_size
mov rbx,depthMemReqs_alignment
cmp rbx,0
je lbl_Error_NoImgMemReqs

dec rbx
add rax,rbx
not rbx
and rax,rbx
; Ensure non-zero
test rax,rax
jz lbl_Error_ZeroSize

;7. Set allocation size from requirements
mov depthAllocInfo_allocationSize,rax

;8. Allocate the Device Memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,depthAllocInfo_sType ;address of VkMemoryAllocateInfo structure
xor r8,r8 ;pAllocator
lea r9,ghVkDepthDeviceMemory
call vkAllocateMemory
test rax,rax
jnz lbl_VkError
cmp ghVkDepthDeviceMemory,0
je lbl_VkError
LOG_TEXT szOK

;9. Bind the memory to the image
LOG_TEXT szVkBindImageMemory
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDepthImage
mov r8,ghVkDepthDeviceMemory
xor r9,r9 ;memoryOffset = 0
call vkBindImageMemory
test rax,rax
jnz lbl_VkError
LOG_TEXT szOK

;10. Create Depth Image View
LOG_TEXT szVkCreateImageView
mov rcx,ghVkLogicalDevice
lea rdx,depthViewInfo_sType ;Reuse the existing VkImageViewCreateInfo structure
xor r8,r8
lea r9,ghVkDepthImageView
call vkCreateImageView
test rax,rax
jnz lbl_VkError
cmp ghVkDepthImageView,0
je lbl_VkError
LOG_TEXT szOK

jmp lbl_End

lbl_Error_NoImgMemReqs:
LOG_TEXT szNoImgMemReqs
jmp lbl_End

lbl_Error_ZeroSize:
LOG_TEXT szErrorZeroSize
jmp lbl_End

lbl_Error_NoDeviceMemory:
LOG_TEXT szNoDeviceMemory
jmp lbl_End

lbl_VkError:
call SpellVkError

lbl_End:
EPILOG
createDepthImage endp



destroyDepthImage proc
PROLOG 100h

cmp ghVkDepthImageView,0
je @f

LOG_TEXT szVkDestroyImageView
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDepthImageView
xor r8,r8
call vkDestroyImageView
LOG_TEXT szOK

@@:
cmp ghVkDepthDeviceMemory,0
je @f

LOG_TEXT szVkFreeMemory
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDepthDeviceMemory
xor r8,r8
call vkFreeMemory
LOG_TEXT szOK

@@:
cmp ghVkDepthImage,0
je lbl_End

LOG_TEXT szVkDestroyImage
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDepthImage
xor r8,r8
call vkDestroyImage
LOG_TEXT szOK

lbl_End:
EPILOG
destroyDepthImage endp
