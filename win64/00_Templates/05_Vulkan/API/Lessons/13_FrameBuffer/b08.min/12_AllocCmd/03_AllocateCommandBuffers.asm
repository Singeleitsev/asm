;03_AllocateCommandBuffers.asm
allocateCommandBuffers proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Allocate memory for the array of Command Buffer handles
LOG_TEXT szLogMemoryAllocating
mov eax,dwSwapchainImageCount
shl eax,3 ;*8 bytes per handle
mov r8,rax
call GetProcessHeap
test rax,rax
jz lbl_allocateCommandBuffers_WinError

mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
call HeapAlloc
test rax,rax
jz lbl_allocateCommandBuffers_WinError
mov gpCommandBuffers,rax
LOG_TEXT szOK

;2. Fill the VkCommandBufferAllocateInfo structure
mov rax,ghVkCommandPool
mov allocInfo_commandPool,rax
mov eax,dwSwapchainImageCount
mov allocInfo_commandBufferCount,eax

;3. Allocate Command Buffers
LOG_TEXT szLogVkAllocateCommandBuffers
mov rcx,ghVkLogicalDevice
lea rdx,allocInfo_sType
mov r8,gpCommandBuffers
call vkAllocateCommandBuffers
test eax,eax
jnz lbl_allocateCommandBuffers_VkError
LOG_TEXT szOK

jmp lbl_allocateCommandBuffers_End

lbl_allocateCommandBuffers_WinError:
call SpellWinError
jmp lbl_allocateCommandBuffers_End

lbl_allocateCommandBuffers_VkError:
call SpellVkError

lbl_allocateCommandBuffers_End:
;Epilogue
leave
ret
allocateCommandBuffers endp
