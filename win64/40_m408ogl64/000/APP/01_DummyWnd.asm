CreateDummyWnd proc
PROLOG 100h

lea rcx,szLogCreateWindowDummy 
call WriteLog

;1. Register the Dummy Window Class

;1.1. Fill the rest of WNDCLASSEX Structure
mov wcx_style,20h ;CS_OWNDC = 20h
lea rax,DefWindowProcA
mov wcx_lpfnWndProc,rax
lea rax,szWndClassDummy
mov wcx_lpszClassName,rax

;1.2. Now call to the Registering Function
lea rcx,szRegisterClassExA
call WriteLog

lea rcx,wcx
call RegisterClassExA
test rax,rax
jz CreateDummyWnd_Error
mov gnWndClass,rax

lea rcx,szOK
call WriteLog

;2. Create the Dummy Window
lea rcx,szCreateWindowExA
call WriteLog

xor rcx,rcx ;dwExStyle = 0
lea rdx,szWndClassDummy
lea r8,szWndTitleDummy
mov r9,20h ;dwStyle = CS_OWNDC
mov qword ptr[rsp+20h],0 ;x = 0
mov qword ptr[rsp+28h],0 ;y = 0
mov qword ptr[rsp+30h],DEFAULT_WND_WIDTH ;nWidth = 800
mov qword ptr[rsp+38h],DEFAULT_WND_HEIGHT ;nHeight = 600
mov qword ptr[rsp+40h],0 ;hWndParent
mov qword ptr[rsp+48h],0 ;hMenu
mov rax,ghInst
mov qword ptr[rsp+50h],rax
mov qword ptr[rsp+58h],0 ;lpParam
call CreateWindowExA
test rax,rax
jz CreateDummyWnd_Error
mov ghWnd,rax

lea rcx,szOK
call WriteLog

;3. Initialize OpenGL 1.0 (Dummy) Environment
call InitDummyGL
test rax,rax
jnz CreateDummyWnd_Error

;4. Success - Clean Up
mov rcx,ghWnd
call DestroyWindow
mov ghWnd,0

lea rcx,szWndClassDummy
mov rdx,ghInst
call UnregisterClassA

lea rcx,szLogDestroyWindowDummy 
call WriteLog
xor rax,rax ;Return Success
jmp CreateDummyWnd_End

;Error - Clean Up
CreateDummyWnd_Error:
cmp ghWnd,0
je @f

mov rcx,ghWnd
call DestroyWindow
mov ghWnd,0

lea rcx,szWndClassDummy
mov rdx,ghInst
call UnregisterClassA

@@:
lea rcx,szLogDestroyWindowDummy 
call WriteLog
call SpellError
mov rax,-1 ;Return Error

CreateDummyWnd_End:
EPILOG
CreateDummyWnd endp


