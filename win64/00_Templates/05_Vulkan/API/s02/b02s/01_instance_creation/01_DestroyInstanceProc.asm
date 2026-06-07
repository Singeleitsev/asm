destroyInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Skip if No vkInstance
cmp vkInstance,0
je lbl_destroyInstance_End

;Destroy All Contents
call destroyDebugMessenger

;Destroy the Instance Frame
LOG_TEXT szLogVkDestroyInstance
mov rcx,vkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
LOG_TEXT szOK

jmp lbl_destroyInstance_End

;Errors
lbl_destroyInstance_Error:
call SpellError

lbl_destroyInstance_End:
;Epilogue
leave
ret
destroyInstance endp

