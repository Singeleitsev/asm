;00_EnumeratePhysicalProc.asm
enumeratePhysicalDevices proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;First pass to get count
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
xor r8,r8 ;pPhysicalDevices = NULL
call vkEnumeratePhysicalDevices

;Check if any devices found
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
LOG_TEXT szSecondPassOK

;Pick the first found Device (simple selection)
mov rax,qword ptr[gpPhysicalDevice0] ;Device0 Handle
mov ghVkPhysicalDevice,rax

;Get the Device0 Name
LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rcx,qword ptr[gpPhysicalDevice0] ;Device0 Handle
lea rdx,deviceProp0_apiVersion
call vkGetPhysicalDeviceProperties

;Write the Device0 Name
lea rcx,deviceProp0_deviceName
call WriteLog
LOG_TEXT szCRLF

cmp dwPhysicalDeviceCount,1
je lbl_enumeratePhysicalDevices_End

;Get the Device1 Name
LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rcx,qword ptr[gpPhysicalDevice1] ;Device1 Handle
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
;Epilogue
leave
ret
enumeratePhysicalDevices endp
