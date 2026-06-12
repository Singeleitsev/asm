;03_AllocateCommandBuffers.asm
allocateCommandBuffers proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogVkAllocateCommandBuffers
mov rcx,ghVkLogicalDevice
lea rdx,allocInfo_sType
xor r8,r8
lea r9,ghVkCommandBuffer
call vkCreateFence
test eax, eax
jnz lbl_allocateCommandBuffers_VkError
cmp ghVkCommandBuffer,0
je lbl_allocateCommandBuffers_VkError
LOG_TEXT szOK

jmp lbl_allocateCommandBuffers_End

lbl_allocateCommandBuffers_VkError:
call SpellVkError

lbl_allocateCommandBuffers_End:
;Epilogue
leave
ret
allocateCommandBuffers endp
