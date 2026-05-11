;101_createInstance.asm
createInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill the VkApplicationInfo Structure
mov appInfo.sType,0 ;VK_STRUCTURE_TYPE_APPLICATION_INFO
mov appInfo.pNext,0 ;nullptr
lea rax,sz_AppName
mov appInfo.pApplicationName,rax
mov appInfo.applicationVersion,1
lea rax,sz_EngineName
mov appInfo.pEngineName,rax
mov appInfo.engineVersion,1
;VK_API_VERSION_1_0 == ((((uint32_t)(0)) << 29U) | (((uint32_t)(1)) << 22U) | (((uint32_t)(0)) << 12U) | ((uint32_t)(0)));
mov appInfo.apiVersion,400000h 

;Fill the VkInstanceCreateInfo Structure
mov createInfo.sType,1 ;VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
mov createInfo.pNext,0 ;nullptr
mov createInfo.flags,0
lea rax,appInfo
mov createInfo.pApplicationInfo,rax
mov createInfo.enabledLayerCount,0 ;Temporarily 0
mov createInfo.ppEnabledLayerNames,0 ;Temporarily nullptr
lea rcx,glfwExtensionCount ;Load Address
call glfwGetRequiredInstanceExtensions
;mov glfwExtensions,rax
mov createInfo.ppEnabledExtensionNames,rax ;glfwExtensions
mov ecx,glfwExtensionCount ;Load Value
mov createInfo.enabledExtensionCount,ecx

lea rcx,createInfo
xor rdx,rdx
lea r8,ghVkInstance
call vkCreateInstance
test rax,rax
jne lbl_createInstance_Err ;!= VK_SUCCESS
jmp lbl_createInstance_Return0

lbl_createInstance_Err:
xor rcx,rcx
lea rdx,sz_createInstance_Err ;Failed to create a vk Instance!
lea r8,sz_createInstance ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_createInstance_End

lbl_createInstance_Return0:
xor rax,rax

lbl_createInstance_End:
;Epilogue
leave
ret
createInstance endp
