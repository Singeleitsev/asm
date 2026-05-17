createInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

lea rcx,createInfo_sType ;pCreateInfo
xor rdx,rdx ;pAllocator = NULL
lea r8,vkInstance ;pInstance
call vkCreateInstance
test eax,eax
jnz lbl_ErrCreateInstance
jmp lbl_createInstance_End

;Errors
lbl_ErrCreateInstance:
lea rcx, szErrVkCreateInstance
lea rdx, szErrVkCreateInstanceCode
call SpellError

;Exit Messages
lbl_createInstance_End:
;Epilogue
leave
ret
createInstance endp

