;2_0_1_checkValidationLayerSupport.asm
checkValidationLayerSupport proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get nValidationLayersCount
xor rax,rax
lea rsi,gpValidationLayer0
@@:
cmp qword ptr[rsi],0
je @f
inc eax
add rsi,8
jmp @b
@@:
mov nValidationLayersCount,eax

;2. Get nAvailableLayersCount

lea rcx,nAvailableLayersCount
xor rdx,rdx
call vkEnumerateInstanceLayerProperties
test eax,eax
jnz lbl_checkValidationLayerSupport_Err_LayerCount

;3. Allocate heap buffer

call GetProcessHeap
test rax,rax
jz lbl_checkValidationLayerSupport_Err_GetHeap

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = nAvailableLayersCount * sizeof(VkLayerProperties)
xor rax,rax
mov eax,nAvailableLayersCount
test eax,eax
je lbl_checkValidationLayerSupport_Err_LayerCount
imul rax,rax,208h ;520 bytes per structure
mov r8,rax
call HeapAlloc
test rax,rax
jz lbl_checkValidationLayerSupport_Err_GetHeap
mov ghAvailableLayers,rax

;4. Enumerate into the buffer

lea rcx,nAvailableLayersCount
mov rdx,rax ;ghAvailableLayers = availableLayers.data()
call vkEnumerateInstanceLayerProperties
test eax,eax
jnz lbl_checkValidationLayerSupport_Err_Enumerate

;5. Iterate over requested layers

call dumpAvailableLayers

call checkLayers
test rax,rax
jz lbl_checkValidationLayerSupport_End ;rax = 0 = VK_SUCCESS
cmp rax,1 ;Layer Missing
je lbl_checkValidationLayerSupport_Err_LayerMissing
cmp rax,0BADh ;Bad Data
je lbl_checkValidationLayerSupport_Err_BadData
mov rax,-1
jmp lbl_checkValidationLayerSupport_End ;rax = -1 for other values

;Error Messages

lbl_checkValidationLayerSupport_Err_LayerCount:
xor rcx,rcx
lea rdx,sz_checkValidationLayerSupport_Err_LayerCount
lea r8,sz_checkValidationLayerSupport ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_checkValidationLayerSupport_End

lbl_checkValidationLayerSupport_Err_GetHeap:
xor rcx,rcx
lea rdx,sz_checkValidationLayerSupport_Err_LayerCount
lea r8,sz_checkValidationLayerSupport ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_checkValidationLayerSupport_End

lbl_checkValidationLayerSupport_Err_Enumerate:
xor rcx,rcx
lea rdx,sz_checkValidationLayerSupport_Err_Enumerate
lea r8,sz_checkValidationLayerSupport ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
jmp lbl_checkValidationLayerSupport_FreeAndFail

lbl_checkValidationLayerSupport_Err_LayerMissing:
xor rcx,rcx
lea rdx,sz_checkValidationLayerSupport_Err_LayerMissing
lea r8,sz_checkValidationLayerSupport ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
jmp lbl_checkValidationLayerSupport_FreeAndFail

lbl_checkValidationLayerSupport_Err_BadData:
xor rcx,rcx
lea rdx,sz_checkValidationLayerSupport_Err_BadData
lea r8,sz_checkValidationLayerSupport ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
jmp lbl_checkValidationLayerSupport_FreeAndFail

;Free Allocated Memory

lbl_checkValidationLayerSupport_FreeAndFail:
call GetProcessHeap
test rax,rax
jnz @f
mov rax,-1
jmp lbl_checkValidationLayerSupport_End
@@:
mov rcx,rax ;hHeap
xor rdx,rdx
mov r8,ghAvailableLayers
call HeapFree
mov rax,-1
;jmp lbl_checkValidationLayerSupport_End

lbl_checkValidationLayerSupport_End:
;Epilogue
leave
ret
checkValidationLayerSupport endp

