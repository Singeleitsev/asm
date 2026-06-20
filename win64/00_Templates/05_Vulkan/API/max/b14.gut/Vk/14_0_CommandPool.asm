createCommandPool proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill the VkCommandPoolCreateInfo structure
mov eax,graphicsFamilyIndex
mov cmdPoolInfo_queueFamilyIndex,eax

LOG_TEXT szLogVkCreateCommandPool
mov rcx,ghVkLogicalDevice
lea rdx,cmdPoolInfo_sType
xor r8,r8
lea r9,ghVkCommandPool
call vkCreateCommandPool
test eax,eax
jnz lbl_createCommandPool_VkError
cmp ghVkCommandPool,0
je lbl_createCommandPool_VkError
LOG_TEXT szOK

jmp lbl_createCommandPool_End

lbl_createCommandPool_VkError:
call SpellVkError

lbl_createCommandPool_End:
;Epilogue
leave
ret
createCommandPool endp



destroyCommandPool proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkCommandPool,0
je lbl_destroyCommandPool_End
LOG_TEXT szLogVkDestroyCommandPool
mov rcx,ghVkLogicalDevice
mov rdx,ghVkCommandPool
xor r8,r8
call vkDestroyCommandPool
LOG_TEXT szOK
mov ghVkCommandPool,0

lbl_destroyCommandPool_End:
;Epilogue
leave
ret
destroyCommandPool endp


