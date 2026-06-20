;050_CreateDeviceProc.asm
createDevice proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Check Validity
cmp graphicsFamilyIndex,-1
je no_graphics
cmp presentFamilyIndex,-1
je no_present

;Determine if we need one or two VkDeviceQueueCreateInfo structures
mov eax,graphicsFamilyIndex
cmp eax,presentFamilyIndex
je lbl_CreateDevice_OneStructure
jmp lbl_CreateDevice_TwoStructures

lbl_CreateDevice_OneStructure:
mov deviceInfo_queueCreateInfoCount,1
mov eax,graphicsFamilyIndex
mov queueInfo0_queueFamilyIndex,eax
jmp lbl_CreateDevice

lbl_CreateDevice_TwoStructures:
mov deviceInfo_queueCreateInfoCount,2
mov eax,graphicsFamilyIndex
mov queueInfo0_queueFamilyIndex,eax
mov eax,presentFamilyIndex
mov queueInfo1_queueFamilyIndex,eax

lbl_CreateDevice:
LOG_TEXT szLogVkCreateDevice
mov rcx,ghVkPhysicalDevice
lea rdx,deviceInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkLogicalDevice
call vkCreateDevice
test eax,eax
jnz lbl_createDevice_VkError
cmp ghVkLogicalDevice,0
je lbl_createDevice_VkError
LOG_TEXT szOK

;Get Graphics Queue Handle
LOG_TEXT szLogVkGetGraphicsQueue
mov rcx,ghVkLogicalDevice
xor rdx,rdx
mov edx,graphicsFamilyIndex
xor r8,r8 ;One queue, index = 0 
lea r9,ghVkGraphicsQueue
call vkGetDeviceQueue
cmp ghVkGraphicsQueue,0
je lbl_createDevice_VkError
LOG_TEXT szOK

;Get Present Queue Handle
LOG_TEXT szLogVkGetPresentQueue
mov rcx,ghVkLogicalDevice
xor rdx,rdx
mov edx,presentFamilyIndex
xor r8,r8 ;One queue, index = 0
lea r9,ghVkPresentQueue
call vkGetDeviceQueue
cmp ghVkPresentQueue,0
je lbl_createDevice_VkError
LOG_TEXT szOK

jmp lbl_createDevice_End

no_graphics:
LOG_TEXT szErrNoGraphicsQueue
jmp lbl_createDevice_End

no_present:
LOG_TEXT szErrNoPresentQueue
jmp lbl_createDevice_End

lbl_createDevice_VkError:
call SpellVkError

lbl_createDevice_End:
;Epilogue
leave
ret
createDevice endp

