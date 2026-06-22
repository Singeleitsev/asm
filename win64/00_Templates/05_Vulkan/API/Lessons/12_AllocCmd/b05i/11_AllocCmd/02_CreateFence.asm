;02_CreateFence.asm
createFence proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogVkCreateFence
mov rcx,ghVkLogicalDevice
lea rdx,fenceInfo_sType
xor r8,r8
lea r9,ghVkFence
call vkCreateFence
test eax, eax
jnz lbl_createFence_VkError
cmp ghVkFence,0
je lbl_createFence_VkError
LOG_TEXT szOK

jmp lbl_createFence_End

lbl_createFence_VkError:
call SpellVkError

lbl_createFence_End:
;Epilogue
leave
ret
createFence endp

