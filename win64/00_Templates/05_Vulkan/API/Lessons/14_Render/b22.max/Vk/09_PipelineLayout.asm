createPipelineLayout proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogVkCreatePipelineLayout
mov rcx,ghVkLogicalDevice
lea rdx,pipelineLayoutInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkPipelineLayout
call vkCreatePipelineLayout
test rax,rax
jnz lbl_createPipelineLayout_VkError
cmp ghVkPipelineLayout,0
je lbl_createPipelineLayout_VkError
LOG_TEXT szOK

jmp lbl_createPipelineLayout_End

lbl_createPipelineLayout_VkError:
call SpellVkError

lbl_createPipelineLayout_End:
;Epilogue
leave
ret
createPipelineLayout endp



destroyPipelineLayout proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkPipelineLayout,0
je lbl_destroyPipelineLayout_End

LOG_TEXT szLogVkDestroyPipelineLayout
mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineLayout
xor r8,r8
call vkDestroyPipelineLayout
mov ghVkPipelineLayout,0
LOG_TEXT szOK

lbl_destroyPipelineLayout_End:
;Epilogue
leave
ret
destroyPipelineLayout endp
