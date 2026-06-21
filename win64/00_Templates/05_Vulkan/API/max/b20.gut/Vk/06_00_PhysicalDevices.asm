enumPhysicalDevices proc
LOCAL index:DWORD, pDevice:QWORD, pStruc:QWORD
PROLOG 100h

;1. First pass to get count
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
xor r8,r8 ;pPhysicalDevices = NULL
call vkEnumeratePhysicalDevices
test eax,eax
jnz lbl_enumPhysicalDevices_VkError
cmp dwPhysicalDeviceCount,0
je lbl_enumPhysicalDevices_NoDevice
LOG_TEXT szFirstPassOK

;2. Allocate memory for the array of pPhysicalDevices Pointers
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumPhysicalDevices_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwPhysicalDeviceCount * sizeof(pointer)
xor r8,r8
mov r8d,dwPhysicalDeviceCount
shl r8,3 ;*8 bytes
call HeapAlloc
test rax,rax
jz lbl_enumPhysicalDevices_WinError
mov ppPhysicalDevices,rax
LOG_TEXT szOK

;3. Second pass to get Device Pointers
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
mov r8,ppPhysicalDevices
call vkEnumeratePhysicalDevices
;case VK_SUCCESS = 0
test eax,eax
jnz lbl_enumPhysicalDevices_VkError
cmp ppPhysicalDevices,0
je lbl_enumPhysicalDevices_VkError
LOG_TEXT szSecondPassOK

;4. Allocate memory for the array of VkPhysicalDeviceProperties structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumPhysicalDevices_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwPhysicalDeviceCount * sizeof(VkPhysicalDeviceProperties)
xor r8,r8
mov r8d,dwPhysicalDeviceCount
imul r8,r8,338h ;sizeof(VkPhysicalDeviceProperties) = 824 bytes
call HeapAlloc
test rax,rax
jz lbl_enumPhysicalDevices_WinError
mov gpPhysicalDeviceProps,rax
LOG_TEXT szOK

;5. Retrieve properties for each device
mov index,0
mov rcx,ppPhysicalDevices
mov pDevice,rcx
mov rdx,gpPhysicalDeviceProps
mov pStruc,rdx

next_device_props:

LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rsi,pDevice
mov rcx,qword ptr[rsi]
mov rdx,pStruc
call vkGetPhysicalDeviceProperties
;No checks, the Function is void

;Log the device name
mov rcx,pStruc
add rcx,14h ;deviceName offset
call WriteLog
LOG_TEXT szCRLF

inc index
add pDevice,8 ;next pPhysicalDevice
add pStruc,338h ;next VkPhysicalDeviceProperties structure
mov ebx,index
cmp ebx,dwPhysicalDeviceCount
jl next_device_props

;6. Call the dump function to write all properties to file
call dumpPhysicalDevices

jmp lbl_enumPhysicalDevices_End

;Errors
lbl_enumPhysicalDevices_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
jmp lbl_enumPhysicalDevices_VkError

lbl_enumPhysicalDevices_WinError:
call SpellWinError
jmp lbl_enumPhysicalDevices_End

lbl_enumPhysicalDevices_VkError:
call SpellVkError
;jmp lbl_enumPhysicalDevices_End

lbl_enumPhysicalDevices_End:
EPILOG
enumPhysicalDevices endp
