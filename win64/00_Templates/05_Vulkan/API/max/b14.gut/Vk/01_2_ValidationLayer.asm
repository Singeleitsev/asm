checkValidationLayer proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szValidationLayerName

mov eax,dwInstanceLayersCount
test eax,eax
jz lbl_checkValidationLayer_VkError

mov rsi,gpLayerProperties
xor r15,r15 ;index

lbl_CheckNextLayer:
mov rcx,rsi ;string1 = LayerName
;Compare layerName at [rsi] with szLayerValidation
lea rdx,szValidationLayerName ;"VK_LAYER_KHRONOS_validation",0
mov rdi,rsi
call lstrcmpA
test eax,eax
je lbl_checkValidationLayer_Success

add rsi,208h ;sizeof(VkLayerProperties) = 520 bytes
inc r15
cmp r15d,dwInstanceLayersCount
jb lbl_CheckNextLayer

lbl_checkValidationLayer_NotFound:
LOG_TEXT szIsNotSupported
mov rax,1 ;NO_VALIDATION_LAYER
jmp lbl_checkValidationLayer_End

lbl_checkValidationLayer_Success:
;Store the Validation Layer Name to the Array of Pointers
mov rdi,createInfo_ppEnabledLayerNames
mov qword ptr [rdi],rsi ;First Item in the List, no Address computing
;Increase the number of Enabled Layers
inc createInfo_enabledLayerCount
;Set the flag for createDebugMessenger
mov gfValidationLayerSupport,1
LOG_TEXT szIsFound
xor rax,rax ;rax = 0 = VK_SUCCESS
jmp lbl_checkValidationLayer_End

lbl_checkValidationLayer_VkError:
call SpellVkError
mov rax,1
;jmp lbl_checkValidationLayer_End

lbl_checkValidationLayer_End:
leave
ret
checkValidationLayer endp
