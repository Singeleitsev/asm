option casemap:none
option prologue: none
option epilogue: none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib

;WinAPI
AppendMenuA PROTO :QWORD,:QWORD,:QWORD,:QWORD
BeginPaint PROTO :QWORD,:QWORD
CheckMenuItem PROTO :QWORD,:QWORD,:QWORD
CreateAcceleratorTableA PROTO :QWORD,:QWORD
CreateMenu PROTO
CreatePopupMenu PROTO
CreateSolidBrush PROTO :QWORD
CreateWindowExA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
DefFrameProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
DefMDIChildProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DeleteObject PROTO :QWORD
DestroyAcceleratorTable PROTO :QWORD
DestroyMenu PROTO :QWORD
DispatchMessageA PROTO :QWORD
DrawMenuBar PROTO :QWORD
DrawTextA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
EndPaint PROTO :QWORD,:QWORD
EnumChildWindows PROTO :QWORD,:QWORD,:QWORD
ExitProcess PROTO :QWORD
GetClientRect PROTO :QWORD,:QWORD
GetDC PROTO :QWORD
GetMenu PROTO :QWORD
GetMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
GetParent PROTO :QWORD
GetProcessHeap PROTO
GetStockObject PROTO :QWORD
GetSubMenu PROTO :QWORD,:QWORD
GetWindow PROTO :QWORD,:QWORD
GetWindowLongPtrA PROTO :QWORD,:QWORD
HeapAlloc PROTO :QWORD,:QWORD,:QWORD
HeapFree PROTO :QWORD,:QWORD,:QWORD
InvalidateRect PROTO :QWORD,:QWORD,:QWORD
IsWindow PROTO :QWORD
KillTimer PROTO :QWORD,:QWORD
LoadCursorA PROTO :QWORD,:QWORD
LoadIconA PROTO :QWORD,:QWORD
MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
PostQuitMessage PROTO :QWORD
Rectangle PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
RegisterClassExA PROTO :QWORD
ReleaseDC PROTO :QWORD,:QWORD
SendMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
SelectObject PROTO :QWORD,:QWORD
SetMenu PROTO :QWORD,:QWORD
SetTextColor PROTO :QWORD,:QWORD
SetTimer PROTO :QWORD,:QWORD,:QWORD,:QWORD
SetWindowLongPtrA PROTO :QWORD,:QWORD,:QWORD
ShowWindow PROTO :QWORD,:QWORD
TranslateMDISysAccel PROTO :QWORD,:QWORD
;TranslateAcceleratorA PROTO :QWORD,:QWORD,:QWORD
TranslateAccelerator PROTO :QWORD,:QWORD,:QWORD
TranslateMessage PROTO :QWORD
UpdateWindow PROTO :QWORD

;Structures
WNDCLASSEX64 STRUCT
cbSize dd 50h
style dd 0
lpfnWndProc dq 0
cbClsExtra dd 0
cbWndExtra dd 0
hInstance dq 0
hIcon dq 0
hCursor dq 0
hbrBackground dq 0
lpszMenuName dq 0
lpszClassName dq 0
hIconSm dq 0
WNDCLASSEX64 ENDS

POINT2D STRUCT
x dd ?
y dd ?
POINT2D ENDS

MSG64 STRUCT
hWnd dq 0
message dd 0
dummy0 dd 0
wParam dq 0
lParam dq 0
time dd 0
pt POINT2D <0,0>
dummy1 dd 0
MSG64 ENDS

CLIENTCREATESTRUCT64 STRUCT
hWindowMenu dq 0
idFirstChild dd 0
dummy dd 0 ;Exists only in win64.inc by hutch--
CLIENTCREATESTRUCT64 ENDS

MDICREATESTRUCT64 STRUCT
szClass dq 0
szTitle dq 0
hOwner dq 0
xPos dd 0
yPos dd 0
cxWidth dd 0
cyHeight dd 0
style dd 0
dummy dd 0 ;Exists only in win64.inc by hutch--
lParam dq 0
MDICREATESTRUCT64 ENDS

RECT64 STRUCT
left dd ?
top dd ?
right dd ?
bottom dd ?
RECT64 ENDS

PAINTSTRUCT64 STRUCT
hdc dq ?
fErase dd ?
dummy dd ? ;Exists only in win64.inc by hutch--
rcPaint RECT64 <>
fRestore dd ?
fIncUpdate dd ?
rgbReserved db 32 dup(?)
PAINTSTRUCT64 ENDS

.const

;Class Names
szClassFrame db "FrameWndClass",0
szClassClient db "MDICLIENT",0 ;Pre-Defined by System
szClassChild0 db "Child0WndClass",0
szClassChild1 db "Child1WndClass",0
;Window Captions
szTitleFrame db "MDI OpenGL Template",0
szTitleChild0 db "Child Window Type 0",0
szTitleChild1 db "Child Window Type 1",0

;accel ACCEL64 5 dup (<>)
StructAccel \
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 31h ;key = VK_1
dw IDM_FILE_NEW_CHILD_0 ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 32h ;key = VK_2
dw IDM_FILE_NEW_CHILD_1 ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 57h ;key = VK_W
dw IDM_FILE_CLOSE ;cmd
dw 5 ;fVirt = FVIRTKEY | FSHIFT = 1 + 4
dw 73h ;key = VK_F4
dw IDM_WINDOW_TILE ;cmd
dw 5 ;fVirt = FVIRTKEY | FSHIFT = 1 + 4
dw 74h ;key = VK_F5
dw IDM_WINDOW_CASCADE ;cmd

;Menu Constants
IDM_FIRSTCHILD equ 100h ;1.0000.0000b ;ah=1, al=0
IDM_FILE_NEW_CHILD_0 equ 200h
IDM_FILE_NEW_CHILD_1 equ 201h
IDM_FILE_CLOSE equ 20Eh
IDM_FILE_EXIT equ 20Fh
IDM_VIEW_BLACK equ 210h
IDM_VIEW_RED equ 211h
IDM_VIEW_GREEN equ 212h
IDM_VIEW_BLUE equ 213h
IDM_VIEW_WHITE equ 214h
IDM_WINDOW_TILE equ 220h
IDM_WINDOW_CASCADE equ 221h
IDM_WINDOW_ARRANGE equ 222h
IDM_WINDOW_CLOSEALL equ 223h
IDM_ACCEL equ 300h

;Menu Names
szMenu_File db "&File",0
szMenu_FileNewChild0 db "New Child Type &0",9,"Ctrl+1",0
szMenu_FileNewChild1 db "New Child Type &1",9,"Ctrl+2",0
szMenu_FileClose db "&Close",0
szMenu_FileExit db "E&xit",9,"Ctrl+W",0
szMenu_View db "&View",0
szMenu_ViewBlack db "&Black",0
szMenu_ViewRed db "&Red",0
szMenu_ViewGreen db "&Green",0
szMenu_ViewBlue db "B&lue",0
szMenu_ViewWhite db "&White",0
szMenu_Window db "&Window",0
szMenu_WindowTile db "Tile",9,"Shift+F4",0
szMenu_WindowCascade db "&Cascade",9,"Shift+F5",0
szMenu_WindowArrange db "Arrange &Icons",0
szMenu_WindowCloseAll db "Close &All",0

;static COLORREF clrTextArray[]
rgbBlack dq 0
rgbRed dq 0FFh
rgbGreen dq 0FF00h
rgbBlue dq 0FF0000h
rgbWhite dq 0C0C0C0h

;Prompt Messages
szChildClose db "OK to close window?",0

;Error Messages
;WinMain
szWinMain db "WinMain",0
szRegisterClass_Err db "Failed to Register the Window",0
szCreateWindowFrame_Err db "Failed to Create the Frame Window",0
szCreateMenu_Err db "Failed to Create the Menu",0
szLoadMenu_Err db "Failed to Load the Menu",0
szAccel_Err db "Failed to Create the Accelerators",0

;szChildHandle_Err db "Failed to get the Child Window Handle",0
;szHeapAlloc_Err db "Failed to allocate memory in Heap",0
;szHeapFree_Err db "Failed to free memory from Heap",0

.data

;Global Variables
g_hInst dq 0
g_hWndFrame dq 0
g_hWndClient dq 0
g_hWndChild0 dq 0
g_hWndChild1 dq 0

g_hMenuFrame dq 0
g_hMenuFrame_File dq 0
g_hMenuFrame_Window dq 0

g_hMenuChild0 dq 0
g_hMenuChild0_File dq 0
g_hMenuChild0_View dq 0
g_hMenuChild0_Window dq 0

g_hMenuChild1 dq 0
g_hMenuChild1_File dq 0
g_hMenuChild1_Window dq 0

g_hAccel dq 0

;Debug Messages
;szHeapAddress db "Heap Allocated at: 0000.0000.0000.0000h",0
;szGetWindow db "Got Window Handle: 0000.0000.0000.0000h",0
;szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

.code

include 0_WinMain\00_WinMain.asm
;include 01_0_CreateMenuFrame.asm
;include 01_1_CreateMenuChild0.asm
;include 01_2_CreateMenuChild1.asm
;include 02_Accel.asm
;include 03_0_MainLoop.asm
;include 09_Errors.asm
include 1_Frame\10_FrameWndProc.asm
;include 11_001_Create.asm
;include 11_111_Command.asm
;include 19_Errors.asm
include 2_Child0\20_Child0WndProc.asm
;include 21_001_Create.asm
;include 21_002_Destroy.asm
;include 21_010_Close.asm
;include 21_00F_Paint.asm
;include 21_111_Command.asm
;include 21_222_Activate.asm
;include 29_Errors.asm
include 3_Child1\30_Child1WndProc.asm
;include 31_001_Create.asm
;include 31_002_Destroy.asm
;include 31_005_Size.asm
;include 31_00F_Paint.asm
;include 31_113_Timer.asm
;include 31_222_Activate.asm
;include 39_Errors.asm
include 4_CloseEnum\40_CloseEnumProc.asm
;include 49_Errors.asm

end
