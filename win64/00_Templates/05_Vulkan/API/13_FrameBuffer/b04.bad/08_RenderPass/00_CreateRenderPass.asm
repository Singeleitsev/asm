;00_CreateRenderPassProc.asm
createRenderPass proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Set the format from chosenFormat
mov eax,chosenFormat
mov colorAttachment_format,eax

LOG_TEXT szLogVkCreateRenderPass
mov rcx, ghVkLogicalDevice
lea rdx, renderPassInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkRenderPass
call vkCreateRenderPass
test rax,rax
jnz lbl_createRenderPass_VkError
cmp ghVkRenderPass,0
jz lbl_createRenderPass_VkError
LOG_TEXT szOK

jmp lbl_createRenderPass_End

lbl_createRenderPass_VkError:
call SpellVkError

lbl_createRenderPass_End:
;Epilogue
leave
ret
createRenderPass endp

