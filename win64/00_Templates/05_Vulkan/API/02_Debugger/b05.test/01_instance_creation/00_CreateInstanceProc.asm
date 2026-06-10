createInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogVkCreateInstance
lea rcx,createInfo_sType ;pCreateInfo
xor rdx,rdx ;pAllocator = NULL
lea r8,vkInstance ;pInstance
call vkCreateInstance
test eax,eax
jnz lbl_createInstance_Error
LOG_TEXT szOK
jmp lbl_createInstance_End

;Errors
lbl_createInstance_Error:
call SpellError

lbl_createInstance_End:
;Epilogue
leave
ret
createInstance endp

