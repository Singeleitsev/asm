;2_0_0_createInstance.asm
createInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;if (enableValidationLayers && !checkValidationLayerSupport())
;{throw std::runtime_error("validation layers requested, but not available!");}
call checkValidationLayerSupport

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
;Setting createInfo.pNext = 0 instead of DebugCreateInfo eliminates the crash
;because it prevents vkCreateInstance from automatically creating a debug messenger.
;Your explicit setupDebugMessenger call then creates exactly one messenger,
;which your cleanup code properly destroys.
;This avoids the double-free/use-after-free inside the validation layer that caused the crash.
mov createInfo.pNext,0 ;rax
mov createInfo.flags,0
lea rax,appInfo
mov createInfo.pApplicationInfo,rax
;createInfo.enabledLayerCount = static_cast<uint32_t>(validationLayers.size());
mov eax,nValidationLayersCount
mov createInfo.enabledLayerCount,eax
;createInfo.ppEnabledLayerNames = validationLayers.data();
lea rax,gpValidationLayer0 ;Pointer to Array of Pointers to Validation Layer Names
mov createInfo.ppEnabledLayerNames,rax
lea rcx,glfwExtensionCount ;Load Address

call glfwGetRequiredInstanceExtensions
mov glfwExtensions,rax

;mov rax,glfwExtensions
;mov createInfo.ppEnabledExtensionNames,rax
;mov ecx,glfwExtensionCount ;Load Value
;mov createInfo.enabledExtensionCount,ecx

xor rcx,rcx
mov ecx,glfwExtensionCount ;Load Value
mov combinedExtCount,ecx ; store GLFW count
lea rbx,combinedExtensions
xor r10,r10
test ecx,ecx
jz @copy_done
@copy_loop:
mov r11,[rax+r10*8] ;get pointer from GLFW array
mov [rbx+r10*8],r11 ;copy into combined buffer
inc r10
cmp r10,rcx
jl @copy_loop
@copy_done:
lea r11,sz_debugUtilsExt ;VK_EXT_debug_utils
mov [rbx+rcx*8],r11 ;Place after copied ones
mov eax,combinedExtCount
inc eax
mov combinedExtCount,eax

mov eax, combinedExtCount ;Total count (GLFW + Custom)
mov createInfo.enabledExtensionCount,eax
lea rax, combinedExtensions
mov createInfo.ppEnabledExtensionNames,rax

lea rcx,createInfo ;const VkInstanceCreateInfo* pCreateInfo
xor rdx,rdx ;const VkAllocationCallbacks* pAllocator
lea r8,ghVkInstance ;VkInstance* instance
call vkCreateInstance
test rax,rax
jne lbl_createInstance_Err ;If not VK_SUCCESS

jmp lbl_createInstance_Return0 ;VK_SUCCESS

lbl_createInstance_Err:
xor rcx,rcx
lea rdx,sz_createInstance_Err ;Failed to create a vk Instance
lea r8,sz_createInstance ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_createInstance_End

lbl_createInstance_Return0: ;VK_SUCCESS
xor rax,rax

lbl_createInstance_End:
;Epilogue
leave
ret
createInstance endp
