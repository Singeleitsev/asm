;WinMain.asm
WinMain proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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

call createInstance
test rax,rax ;createInstance must return 0
jnz lbl_WinMain_Err

lbl_WinMain_Loop:
mov rcx,ghWnd
call glfwWindowShouldClose
test rax,rax
jnz lbl_WinMain_CleanUp
call glfwPollEvents
jmp lbl_WinMain_Loop

lbl_WinMain_CleanUp:
mov rcx,ghWnd
call glfwDestroyWindow
cmp ghVkInstance,0
je lbl_WinMain_Return0 ;Skip vkDestroyInstance
mov rcx,ghVkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
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