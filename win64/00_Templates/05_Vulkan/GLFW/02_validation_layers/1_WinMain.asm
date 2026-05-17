;1_WinMain.asm
WinMain proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1
;void initWindow()
call glfwInit
test rax,rax
jz lbl_WinMain_Err

mov rcx,22001h; GLFW_CLIENT_API
xor rdx,rdx ;GLFW_NO_API = 0
call glfwWindowHint

mov rcx,20003h ;GLFW_RESIZABLE
xor rdx,rdx ;GLFW_FALSE = 0
call glfwWindowHint

mov rcx,3C0h ;1920/2=960
mov rdx,21Ch ;1080/2=540
lea r8,szAppTitle
xor r9,r9
mov qword ptr[rsp+20h],0 ;share = NULL
call glfwCreateWindow
mov ghWnd,rax
test rax,rax
jz lbl_WinMain_Err

;2
;void initVulkan()
call createInstance
test rax,rax ;createInstance must return 0
jnz lbl_WinMain_Err

call setupDebugMessenger
test rax,rax ;setupDebugMessenger must return 0
jnz lbl_WinMain_Err

;3
;void mainLoop()
lbl_WinMain_Loop:
mov rcx,ghWnd
call glfwWindowShouldClose
test rax,rax
jnz lbl_WinMain_CleanUp
call glfwPollEvents
jmp lbl_WinMain_Loop

;4
;void cleanup()
lbl_WinMain_CleanUp:
mov rcx,ghVkInstance
mov rdx,ghDebugMessenger
test rdx,rdx
jz @f
xor r8,r8 ;pAllocator = nullptr
call DestroyDebugMessenger
@@:
call GetProcessHeap
test rax,rax
jz @f
mov rcx,rax ;hHeap
xor rdx,rdx
mov r8,ghAvailableLayers
test r8,r8
jz @f
call HeapFree
mov ghAvailableLayers,0
@@:
mov rcx,ghVkInstance
test rcx,rcx
jz @f
xor rdx,rdx ;pAllocator = nullptr
call vkDestroyInstance
@@:
mov rcx,ghWnd
call glfwDestroyWindow
;jmp lbl_WinMain_Return0

lbl_WinMain_Return0:
call glfwTerminate
xor rcx,rcx
call ExitProcess

lbl_WinMain_Err:
call glfwTerminate
mov rcx,-1
call ExitProcess

WinMain endp
