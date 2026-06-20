choosePresentMode proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get Present Modes - First Pass
LOG_TEXT szLogVkGetPhysicalDeviceSurfacePresentModesKHR
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,presentModesCount
xor r9,r9
call vkGetPhysicalDeviceSurfacePresentModesKHR
test eax,eax
jnz lbl_choosePresentMode_VkError
cmp presentModesCount,0
je lbl_choosePresentMode_VkError
LOG_TEXT szFirstPassOK

;2. Allocate memory for VkPresentModeKHR array
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_choosePresentMode_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,presentModesCount
shl r8,2 ;sizeof VkPresentModeKHR =  4 
call HeapAlloc
test rax,rax
jz lbl_choosePresentMode_WinError
mov gpPresentModes,rax
LOG_TEXT szOK

;3. Get Present Modes - Second Pass
LOG_TEXT szLogVkGetPhysicalDeviceSurfacePresentModesKHR
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,presentModesCount
mov r9,gpPresentModes
call vkGetPhysicalDeviceSurfacePresentModesKHR
test eax,eax
jnz lbl_choosePresentMode_VkError
cmp gpPresentModes,0
je lbl_choosePresentMode_VkError
LOG_TEXT szSecondPassOK

;4. Choose present mode – prefer MAILBOX (1),else FIFO (0)
mov rsi,gpPresentModes
mov edx,presentModesCount
xor ecx,ecx

search_mode:
cmp dword ptr[rsi],1 ;VK_PRESENT_MODE_MAILBOX_KHR
je mode_found
add rsi,4
inc ecx
cmp ecx,edx
jl search_mode
;Fallback to FIFO
mov chosenPresentMode,0
jmp mode_done

mode_found:
mov chosenPresentMode,1
mode_done:
LOG_TEXT szLogPresentModeChosen

jmp lbl_choosePresentMode_End

lbl_choosePresentMode_WinError:
call SpellWinError
jmp lbl_choosePresentMode_End

lbl_choosePresentMode_VkError:
call SpellVkError

lbl_choosePresentMode_End:
;Epilogue
leave
ret
choosePresentMode endp

