;vulkan-tutorial.com
option casemap:none
option prologue:none
option epilogue:none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
;GLFW
includelib D:\bin\dev\ogl\glfw-3.4.bin.WIN64\lib-vc2022\glfw3dll.lib

;WinMain
extrn glfwInit:PROC
extrn glfwWindowHint:PROC
extrn glfwCreateWindow:PROC
extrn glfwWindowShouldClose:PROC
extrn glfwPollEvents:PROC
extrn glfwDestroyWindow:PROC
extrn glfwTerminate:PROC
extrn ExitProcess:PROC

.data
hWnd dq 0
szAppTitle db "Vulkan", 0

.code
WinMain proc

;Prologue:
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
mov hWnd,rax
test rax,rax
jz lbl_WinMain_Err

lbl_WinMain_Loop:
mov rcx,hWnd
call glfwWindowShouldClose
test rax,rax
jnz lbl_WinMain_CleanUp
call glfwPollEvents
jmp lbl_WinMain_Loop

lbl_WinMain_CleanUp:
mov rcx,hWnd
call glfwDestroyWindow
call glfwTerminate
xor rcx,rcx
call ExitProcess

lbl_WinMain_Err:
call glfwTerminate
mov rcx,1
call ExitProcess

WinMain endp

;include procedures

end

