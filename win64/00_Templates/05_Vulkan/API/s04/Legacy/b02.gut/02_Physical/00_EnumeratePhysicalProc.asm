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
test eax,eax
jnz lbl_enumeratePhysicalDevices_Error
LOG_TEXT szFirstPassOK

;Check if any devices found
cmp dwPhysicalDeviceCount,0
je lbl_enumeratePhysicalDevices_NoDevice

;Second pass
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
mov r8,offset gpPhysicalDevice0
call vkEnumeratePhysicalDevices
test eax,eax
jnz lbl_enumeratePhysicalDevices_Error
LOG_TEXT szSecondPassOK

;Pick the first found Device (simple selection)
mov rax,qword ptr[gpPhysicalDevice0] ;First Device Handle
mov ghVkPhysicalDevice,rax

;Get the First Device Name
LOG_TEXT szLogGetPhysicalDeviceProperties
mov rcx,qword ptr[gpPhysicalDevice0]
lea rdx,deviceProp_apiVersion
call vkGetPhysicalDeviceProperties

;Write the First Device Name
lea rcx,deviceProp_deviceName
call WriteLog
LOG_TEXT szCRLF

;No stack CleanUp needed - Exit the Function
jmp lbl_enumeratePhysicalDevices_End

;Errors
lbl_enumeratePhysicalDevices_NoDevice:
LOG_TEXT szErrNoPhysicalDevices

lbl_enumeratePhysicalDevices_Error:
call SpellError

lbl_enumeratePhysicalDevices_End:
;Epilogue
leave
ret
enumeratePhysicalDevices endp
