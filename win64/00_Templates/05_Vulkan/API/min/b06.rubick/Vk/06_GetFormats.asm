getFormats proc
PROLOG 100h

;1. Get Surface Formats - First Pass
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceFormatsKHR
;First call to get count
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,surfaceFormatsCount
xor r9,r9
call vkGetPhysicalDeviceSurfaceFormatsKHR
test eax,eax
jnz lbl_getFormats_VkError
cmp surfaceFormatsCount,0
je lbl_getFormats_VkError
LOG_TEXT szFirstPassOK

;2. Allocate memory for VkSurfaceFormatKHR structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getFormats_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,surfaceFormatsCount
shl r8,3 ;sizeof VkSurfaceFormatKHR = 8 bytes
call HeapAlloc
test rax,rax
jz lbl_getFormats_WinError
mov gpSurfaceFormats,rax
LOG_TEXT szOK

;3. Get Surface Formats - Second Pass
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceFormatsKHR
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,surfaceFormatsCount
mov r9,gpSurfaceFormats
call vkGetPhysicalDeviceSurfaceFormatsKHR
test eax,eax
jnz lbl_getFormats_VkError
cmp gpSurfaceFormats,0
je lbl_getFormats_VkError
LOG_TEXT szSecondPassOK

;4. Choose format – prefer VK_FORMAT_B8G8R8A8_SRGB or VK_FORMAT_R8G8B8A8_SRGB
xor ecx,ecx
mov rsi,gpSurfaceFormats

search_format:
cmp dword ptr [rsi],32h ; VK_FORMAT_B8G8R8A8_SRGB = 50
je format_found
cmp dword ptr [rsi],2Bh ; VK_FORMAT_R8G8B8A8_SRGB = 43
je format_found
add rsi,8
inc ecx
cmp ecx,surfaceFormatsCount
jl search_format

LOG_TEXT szErrFormat
jmp lbl_getFormats_VkError

format_found:
mov rsi,gpSurfaceFormats
mov eax,dword ptr[rsi] ;VkFormat
mov chosenFormat,eax
LOG_TEXT szLogFormatChosen

jmp lbl_getFormats_End

lbl_getFormats_WinError:
call SpellWinError
jmp lbl_getFormats_End

lbl_getFormats_VkError:
call SpellVkError

lbl_getFormats_End:
EPILOG
getFormats endp

