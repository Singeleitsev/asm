option casemap:none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib

;Standard Includes
include D:\bin\dev\asm\ml64\include\user32.inc
include D:\bin\dev\asm\ml64\include\kernel32.inc

;Custom Includes
include include\struct64_20.inc
include include\Mem_03.inc
include include\Call_02.inc
include include\Spell_09.inc

.const
include Const.asm

;Class Names
szWndClass db "clsSDI64",0
;Window Captions
szAppTitle db "64-bit SDI Application assembled with MASM",0
;Info Messages
szIntersection db "The specified Lines have an Intersection Point",0
szExactSkew db "Exact Skew",0
szCollinear db "The specified Lines are Collinear",0
szParallel db "The specified Lines are Parallel",0
szNearSkew db "Near Skew",0
szPlaneLine3D_Intersection db "The Line intersects the Plane",0
szPlaneLine3D_Parallel db "The Line is Parallel to the Plane",0
szPlaneLine3D_LineInPlane db "The Line lays in the Plane",0
;Prompt Messages
;szExit db "Close this Application?",0
;Error Messages
szErrFrameHandle db "Failed to get the Main Window Handle",0
szErrWinMain db "Error in WinMain",0

.data
align 16
;Window Handles
hWndMain dq 0
;Structures
wc WNDCLASSEX64 <>
msg MSG64 <>

;The first dword after msg MSG64 <> was being destroyed
;So I inserted this dummy to protect the data
;To be examined later
dummy dd 4 dup (0)

;Difference Vectors
dx10 dd 0
dy10 dd 0
dz10 dd 0
dw10 dd 0 ;Dummy
dx32 dd 0
dy32 dd 0
dz32 dd 0
dw32 dd 0 ;Dummy
dx20 dd 0
dy20 dd 0
dz20 dd 0
dw20 dd 0 ;Dummy

;Dot Products
a dd 0
b dd 0
c dd 0
;d is not used
e dd 0
f dd 0

;Determinant
det dd 0

t dd 0
s dd 0

;Intersection Points
;On the Line 0
x4t dd 0
y4t dd 0
z4t dd 0
w4t dd 0 ;Dummy
;On the Line 1
x4s dd 0
y4s dd 0
z4s dd 0
w4s dd 0 ;Dummy

;Tolerance
treshold dd 0 ;eps * (a+c)

;Debug Messages
szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
szWndHandle db "Main Window Handle: 0000.0000.0000.0000h",0	
szStackPointer db "rsp: 0000.0000.0000.0000h",0

.code
;======================================================================
WinMain proc hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:QWORD
;======================================================================

;This Procedure has parameters hence Assembler WILL add following instructions here:
;push rbp ;<-- ;sub rsp,8
;mov rbp,rsp ;<--
;Align the Stack by 10h
mov rax,rsp
and rax,0Fh
;Reserve 100h Bytes as Buffer for possible 16 Parameters
add rax,100h
sub rsp,rax

Call1 GetModuleHandleA,0
mov hInst,rax
cmp rax,0
je errWinMain

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
mov wc.style,4003h ;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
m64addr wc.lpfnWndProc,WndProc
mov wc.cbClsExtra,0
mov wc.cbWndExtra,0
m64m64 wc.hInstance,hInst
;Load Icon
Call2 LoadIconA,0,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
mov wc.hIcon,rax
;Load Cursor
Call2 LoadCursorA,0,7F89h ;hCursor = IDC_HAND = 32649 =7F89h
mov wc.hCursor,rax
;Fill up the rest of WNDCLASSEX64
mov wc.hbrBackground,1
mov wc.lpszMenuName,0
m64addr wc.lpszClassName,szWndClass
mov wc.hIconSm,0
;Now call the Function
Call1 RegisterClassEx,offset wc
cmp rax,0
je errWinMain

;Create the Main Window
xor rcx,rcx ;dwExStyle
lea rdx,szWndClass
lea r8,szAppTitle
mov r9,0CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
mov qword ptr [rsp+40h],0 ;hWndParent 
mov qword ptr [rsp+48h],0 ;hMenu
m64m64 qword ptr [rsp+50h],hInst
mov qword ptr [rsp+58h],0 ;lpParam 
call CreateWindowExA
;Store the Handle
mov hWndMain,rax
cmp rax,0
je errWndHandle

;Show and Update the Main Window
Call2 ShowWindow,hWndMain,1 ;nCmdShow = SW_SHOWNORMAL = 1
Call1 UpdateWindow,hWndMain

;Enter the Loop
MsgLoop: ;Critical time, don't use macros
lea rcx,msg ;lpMsg
xor rdx,rdx ;hWnd
xor r8,r8 ;wMsgFilterMin
xor r9,r9 ;wMsgFilterMax
call GetMessageA
cmp rax,0
je CleanUp
lea rcx,msg
call TranslateMessage
lea rcx,msg ;Re-Load is necessary
call DispatchMessageA
jmp MsgLoop

;Error Alarms
errWndHandle:
lea rdx,szErrFrameHandle ;lpText
jmp errWinMainAlarm
errWinMain:
lea rdx,szErrWinMain ;lpText
;jmp errWinMainAlarm
errWinMainAlarm:
;MB_OK + MB_ICONERROR = 0 + 10h = 10h
Call4 MessageBoxA,0,rdx,offset szAppTitle,10h

CleanUp:
Call1 ExitProcess,0
WinMain endp

;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp
;Ensure the Stack is Aligned by 10h
mov rax,rsp
and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
add rax,80h
sub rsp,rax

;Store Values retrieved by DispatchMessageA:
mov hWnd,rcx
mov uMsg,rdx
mov wParam,r8
mov lParam,r9

;Distributing with respect to uMsg
cmp rdx,101h ;WM_KEYUP = 0x0101
je wmKeyUp
cmp rdx,202h ;WM_LBUTTONUP = 0x0202
je wmLButtonUp
cmp rdx,2 ;WM_DESTROY = 0x0002
je wmDestroy
;cmp rdx,1 ;WM_CREATE = 0x0001
;je wmCreate
jmp defWndProc

;wmCreate:
;jmp finWndProc

wmKeyUp:
;LineLine
cmp r8w,31h ;Keyboard 1
je lbl_Case1
cmp r8w,32h ;Keyboard 2
je lbl_Case2
cmp r8w,33h ;Keyboard 3
je lbl_Case3
cmp r8w,34h ;Keyboard 4
je lbl_Case4
cmp r8w,35h ;Keyboard 5
je lbl_Case5
;PlaneLine
cmp r8w,36h ;Keyboard 6
je lbl_Case6
cmp r8w,37h ;Keyboard 7
je lbl_Case7
jmp finWndProc ;Any other key
;LineLine
lbl_Case1:
movups xmm0, xmmword ptr [x0_01] ;Intersection
movups xmm1, xmmword ptr [x1_01]
movups xmm2, xmmword ptr [x2_01]
movups xmm3, xmmword ptr [x3_01]
jmp lbl_LineLine3D
lbl_Case2:
movups xmm0, xmmword ptr [x0_02] ;Far Skew
movups xmm1, xmmword ptr [x1_02]
movups xmm2, xmmword ptr [x2_02]
movups xmm3, xmmword ptr [x3_02]
jmp lbl_LineLine3D
lbl_Case3:
movups xmm0, xmmword ptr [x0_03] ;Collinear
movups xmm1, xmmword ptr [x1_03]
movups xmm2, xmmword ptr [x2_03]
movups xmm3, xmmword ptr [x3_03]
jmp lbl_LineLine3D
lbl_Case4:
movups xmm0, xmmword ptr [x0_04] ;Parallel
movups xmm1, xmmword ptr [x1_04]
movups xmm2, xmmword ptr [x2_04]
movups xmm3, xmmword ptr [x3_04]
jmp lbl_LineLine3D
lbl_Case5:
movups xmm0, xmmword ptr [x0_05] ;Near Skew
movups xmm1, xmmword ptr [x1_05]
movups xmm2, xmmword ptr [x2_05]
movups xmm3, xmmword ptr [x3_05]
jmp lbl_LineLine3D
;PlaneLine
lbl_Case6:
movups xmm0, xmmword ptr [x0_06] ;Intersection
movups xmm1, xmmword ptr [x1_06]
movups xmm2, xmmword ptr [x2_06]
movups xmm3, xmmword ptr [x3_06]
movups xmm4, xmmword ptr [x4_06]
jmp lbl_PlaneLine3D
lbl_Case7:
movups xmm0, xmmword ptr [x0_07] ;Parallel
movups xmm1, xmmword ptr [x1_07]
movups xmm2, xmmword ptr [x2_07]
movups xmm3, xmmword ptr [x3_07]
movups xmm4, xmmword ptr [x4_07]
jmp lbl_PlaneLine3D
;LineLine
lbl_LineLine3D:
call LineLine3D
jmp finWndProc
;PlaneLine
lbl_PlaneLine3D:
call PlaneLine3D
jmp finWndProc

wmLButtonUp:
mov rax,rsp
Spell64rax hWnd,szAppTitle,szStackPointer
jmp finWndProc

wmDestroy:
Call1 PostQuitMessage,0
xor rax,rax
jmp finWndProc

defWndProc:
Call4 DefWindowProc,hWnd,uMsg,wParam,lParam
jmp finWndProc

finWndProc:
;Assembler will add this epilogue automatically:
;leave 
ret
WndProc endp

include LineLine3D.asm
include PlaneLine3D.asm

end
