;01_DestroyInstanceProc.asm
destroyInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Skip if No vkInstance
cmp ghVkInstance,0
je lbl_destroyInstance_End

;Destroy the vkInstance
LOG_TEXT szLogVkDestroyInstance
mov rcx,ghVkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
mov ghVkInstance,0
LOG_TEXT szOK

;jmp lbl_destroyInstance_End

lbl_destroyInstance_End:
;Epilogue
leave
ret
destroyInstance endp

