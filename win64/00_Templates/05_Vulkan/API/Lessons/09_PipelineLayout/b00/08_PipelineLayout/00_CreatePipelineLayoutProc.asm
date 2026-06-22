;00_CreatePipelineLayoutProc.asm
createPipelineLayout proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogCreatePipelineLayout
mov rcx,ghVkLogicalDevice
lea rdx,pipelineLayoutInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkPipelineLayout
call vkCreatePipelineLayout
test eax,eax
jnz lbl_createPipelineLayout_VkError
LOG_TEXT szOK

jmp lbl_createPipelineLayout_End

lbl_createPipelineLayout_VkError:
call SpellVkError

lbl_createPipelineLayout_End:
;Epilogue
leave
ret
createPipelineLayout endp

