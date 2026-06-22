;01_GetFormatsProc.asm
getFormats proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get Surface Formats - First Pass
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceFormatsKHR
;First call to get count
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,surfaceFormatsCount
xor r9,r9
call vkGetPhysicalDeviceSurfaceFormatsKHR
cmp surfaceFormatsCount,0
jz lbl_getFormats_VkError
LOG_TEXT szFirstPassOK

;2. Allocate memory for VkSurfaceFormatKHR structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getFormats_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor rax,rax
mov eax,surfaceFormatsCount
shl rax,3 ;sizeof VkSurfaceFormatKHR = 8 bytes
mov r8,rax
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
LOG_TEXT szSecondPassOK

;4. Choose format – prefer VK_FORMAT_B8G8R8A8_SRGB or VK_FORMAT_R8G8B8A8_SRGB
mov rsi,gpSurfaceFormats
xor ecx,ecx
mov edx,surfaceFormatsCount

search_format:
cmp dword ptr [rsi],32h ; VK_FORMAT_B8G8R8A8_SRGB = 50
je format_found
cmp dword ptr [rsi],2Bh ; VK_FORMAT_R8G8B8A8_SRGB = 43
je format_found
add rsi,8
inc ecx
cmp ecx,edx
jl search_format

LOG_TEXT szErrFormat
jmp lbl_getFormats_VkError

format_found:
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
;Epilogue
leave
ret
getFormats endp

