option casemap:none

;Standard Libraries
 includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
;Extended Libraries for CryptGenRandom
 includelib D:\bin\dev\asm\ml64\VS2019\lib\advapi32.lib

;Custom Includes
 include inc\API64.inc
 include inc\Call.inc
 include inc\Mem.inc
 include inc\OpenGL64.inc
 include inc\Spell.inc
 include inc\struct64.inc


.const
CHILDREN_NUMBER equ 9 ;Number of Child Window Types
;Menu Equates
 include inc\Menu.inc

;Class Names
 szClassFrame db "mdiFrame",0
 szClassClient db "MDICLIENT",0 ;Pre-Defined by System
 szClassChild00 db "mdiChild00",0
 szClassChild01 db "mdiChild01",0
 szClassChild02 db "mdiChild02",0
 szClassChild03 db "mdiChild03",0
 szClassChild04 db "mdiChild04",0
 szClassChild05 db "mdiChild05",0
 szClassChild06 db "mdiChild06",0
 szClassChild07 db "mdiChild07",0
 szClassChild08 db "mdiChild08",0

;Window Captions
 szTitleFrame db "MDI Fractal Demo",0
 szTitleChild00 db "Iterated function system (IFS)",0
 szTitleChild01 db "Sierpinski Sieve",0
 szTitleChild02 db "Sierpinski Gasket",0
 szTitleChild03 db "Ngon",0
 szTitleChild04 db "Hexagon",0
 szTitleChild05 db "Sierpinski Pyramid",0
 szTitleChild06 db "Sierpinski Sponge",0
 szTitleChild07 db "Ball",0
 szTitleChild08 db "Brownian Tree",0

;Prompt Messages
 szClose db "OK to close window?",0

;Error Messages
 ;szErrCPUID db "This Program Requires a Newer Processor",0
 szErrHandleFrame db "Failed to get the Frame Window Handle",0
 szErrHandleChild db "Failed to get the Child Window Handle",0
 szErrHeapAlloc db "Failed to allocate memory in Heap",0
 szErrHeapFree db "Failed to free memory from Heap",0


.data
;Global Variables
 g_hInst dq 0

 g_hMenuInit dq 0
 g_hMenuChild dq CHILDREN_NUMBER dup (0)

 g_hSubMenuInit dq 0
 g_hSubMenuChild dq CHILDREN_NUMBER dup (0)

;Static Variables
 s_hwndFrame dq 0
 s_hwndFrameChild dq CHILDREN_NUMBER dup (0)
 s_hwndClientChild dq CHILDREN_NUMBER dup (0)

 s_clrTextArray dq 0

 theta dd 0.3

;For CryptGenRandom
 hProv dq 0
 pbBuffer dq 0 ;db 8 dup (0)
 ;dwLen = $-pbBuffer

;Debug Messages
 szHeapAddress db "Heap Allocated at: 0000.0000.0000.0000h",0
 szGetWindow db "Got Window Handle: 0000.0000.0000.0000h",0
 szLastErr db "Last Error Code: 0000.0000.0000.0000h",0


.data?
 ;lpGlobalData dq ?

;Child Procedure Addresses
 lpChildProc dq CHILDREN_NUMBER dup (?)


.code
start proc
;Align the Stack by 10h
 and rsp,-16
;Create the Buffer for Calling API Functions
 sub rsp,20h
;Get Application Handle
 xor rcx,rcx
 call GetModuleHandleA
 mov g_hInst,rax
;Go to Main Application Cycle
 mov rcx,g_hInst
 xor rdx,rcx
 xor r8,r8
 mov r9,1
 call WinMain
;End All
 call ExitProcess
start endp

;Procedures
 include 01_WinMain\00_WinMain.asm
 include 02_FrameWndProc\00_Frame.asm
 ;include 03_RandomProc\00_GetRandom64.asm
 include 10_ChildWndProc\SieveWndProc\00_Sieve.asm
 include 10_ChildWndProc\SpongeWndProc\00_Sponge.asm
 include 90_CloseEnumProc\00_CloseEnum.asm

end
