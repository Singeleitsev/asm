enumeratePhysicalDevices proc
PROLOG 100h

;First pass to get count
LOG_TEXT szVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
xor r8,r8 ;pPhysicalDevices = NULL
call vkEnumeratePhysicalDevices
test eax,eax
jnz lbl_enumeratePhysicalDevices_VkError
cmp dwPhysicalDeviceCount,0
je lbl_enumeratePhysicalDevices_NoDevice
LOG_TEXT szFirstPassOK

;Second pass to get devices
LOG_TEXT szVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
lea r8,gpPhysicalDevice0
call vkEnumeratePhysicalDevices
;case VK_SUCCESS = 0
test eax,eax
jz lbl_enumeratePhysicalDevices_Done
;case VK_INCOMPLETE = 5
cmp eax,5
je lbl_enumeratePhysicalDevices_Done
;case else
jmp lbl_enumeratePhysicalDevices_VkError

lbl_enumeratePhysicalDevices_Done:
cmp gpPhysicalDevice0,0
je lbl_enumeratePhysicalDevices_VkError
LOG_TEXT szSecondPassOK

;Pick the first found Device (simple selection)
mov rax,gpPhysicalDevice0
mov ghVkPhysicalDevice,rax

;Get the Device0 Name
LOG_TEXT szVkGetPhysicalDeviceProperties
mov rcx,gpPhysicalDevice0
lea rdx,deviceProp0_apiVersion
call vkGetPhysicalDeviceProperties

;Write the Device0 Name
lea rcx,deviceProp0_deviceName
call WriteLog
LOG_TEXT szCRLF

cmp dwPhysicalDeviceCount,1
je lbl_enumeratePhysicalDevices_End

cmp gpPhysicalDevice1,0
je lbl_enumeratePhysicalDevices_End

;Get the Device1 Name
LOG_TEXT szVkGetPhysicalDeviceProperties
mov rcx,gpPhysicalDevice1
lea rdx,deviceProp1_apiVersion
call vkGetPhysicalDeviceProperties

;Write the Device1 Name
lea rcx,deviceProp1_deviceName
call WriteLog
LOG_TEXT szCRLF

;Get DEvice Memory Properties
LOG_TEXT szVkGetPhysicalDeviceMemoryProperties
mov rcx,ghVkPhysicalDevice
lea rdx,memProps_memoryTypeCount
call vkGetPhysicalDeviceMemoryProperties
cmp memProps_memoryTypeCount,0
je lbl_Error_NoDeviceMemory
LOG_TEXT szOK

jmp lbl_enumeratePhysicalDevices_End

;Errors
lbl_enumeratePhysicalDevices_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
jmp lbl_enumeratePhysicalDevices_VkError

lbl_Error_NoDeviceMemory:
LOG_TEXT szNoDeviceMemory
;jmp lbl_enumeratePhysicalDevices_VkError

lbl_enumeratePhysicalDevices_VkError:
call SpellVkError
;jmp lbl_enumeratePhysicalDevices_End

lbl_enumeratePhysicalDevices_End:
EPILOG
enumeratePhysicalDevices endp



;-------------------------
;FindHostVisibleMemoryType
;Find memory type with HOST_VISIBLE | HOST_COHERENT
;Input:  ECX = memoryTypeBits (from VkMemoryRequirements)
;Output: EAX = memory type index,or -1 on failure
;-------------------------------------------------

FindHostVisibleMemoryType proc
LOCAL memTypeBits:DWORD, neededFlags:DWORD
PROLOG 100h

mov memTypeBits,ecx
;VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT = 2
;VK_MEMORY_PROPERTY_HOST_COHERENT_BIT = 4
mov neededFlags,6 ;2+4 = 6

xor rcx,rcx ;counter

lbl_Loop:
;Check if this type is allowed
mov rax,1
shl eax,cl ;1 << index
test eax,memTypeBits
jz lbl_next_memory_type

mov rdx,rcx ;index
shl rdx,3 ;i*8
lea rsi,memProps_memoryTypes
add rsi,rdx
mov eax,dword ptr[rsi] ;propertyFlags

and eax,neededFlags
cmp eax,neededFlags
je lbl_Found

lbl_next_memory_type:
inc ecx
cmp ecx,memProps_memoryTypeCount
jl lbl_Loop

;Not found
mov eax,-1
jmp lbl_End

lbl_Found:
mov eax,ecx

lbl_End:
EPILOG
FindHostVisibleMemoryType endp



;-------------------------
;FindDeviceLocalMemoryType
;Find memory type with DEVICE_LOCAL_BIT
;Input:  ECX = memoryTypeBits (from VkMemoryRequirements)
;Output: EAX = memory type index,or -1 on failure
;-------------------------------------------------
FindDeviceLocalMemoryType proc
LOCAL memTypeBits:DWORD, neededFlags:DWORD
PROLOG 100h

mov memTypeBits,ecx
;VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT = 1
mov neededFlags,1

xor rcx,rcx ;counter

lbl_Loop:
mov eax,1
shl eax,cl ;1 << index
test eax,memTypeBits
jz lbl_Next

mov rdx,rcx ;index
shl rdx,3 ;i*8
lea rsi,memProps_memoryTypes
add rsi,rdx
mov eax,dword ptr[rsi] ;propertyFlags

and eax,neededFlags
cmp eax,neededFlags
je lbl_Found

lbl_Next:
inc ecx
cmp ecx,memProps_memoryTypeCount
jl lbl_Loop

;Not found
mov eax,-1
jmp lbl_End

lbl_Found:
mov eax,ecx

lbl_End:
EPILOG
FindDeviceLocalMemoryType endp


