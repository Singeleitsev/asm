enumeratePhysicalDevices proc
PROLOG 100h

;First pass to get count
LOG_TEXT szLogVkEnumeratePhysicalDevices
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
LOG_TEXT szLogVkEnumeratePhysicalDevices
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
LOG_TEXT szLogVkGetPhysicalDeviceProperties
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
LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rcx,gpPhysicalDevice1
lea rdx,deviceProp1_apiVersion
call vkGetPhysicalDeviceProperties

;Write the Device1 Name
lea rcx,deviceProp1_deviceName
call WriteLog
LOG_TEXT szCRLF

jmp lbl_enumeratePhysicalDevices_End

;Errors
lbl_enumeratePhysicalDevices_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
;jmp lbl_enumeratePhysicalDevices_VkError

lbl_enumeratePhysicalDevices_VkError:
call SpellVkError
;jmp lbl_enumeratePhysicalDevices_End

lbl_enumeratePhysicalDevices_End:
EPILOG
enumeratePhysicalDevices endp
