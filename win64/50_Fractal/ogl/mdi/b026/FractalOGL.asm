option casemap:none

;Standard Libraries
 includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
;Extended Libraries for CryptGenRandom
 includelib F:\bin\dev\asm\ml64\VS2019\lib\advapi32.lib

;Custom Includes
 include inc\API64.inc
 include inc\Call.inc
 include inc\Mem.inc
 include inc\OpenGL64.inc
 include inc\Spell.inc
 include inc\struct64.inc

.const
;Menu Equates
 include inc\Menu.inc

;Class Names
 clsFrame db "mdiFrame",0
 clsClient db "MDICLIENT",0 ;Pre-Defined by System

;Window Captions
 titFrame db "MDI Fractal Demo",0
 titChild00 db "Sierpinski Sieve",0
 titChild01 db "Sierpinski Gasket",0
 titChild02 db "Ngon",0
 titChild03 db "Hexagon",0
 titChild04 db "Sierpinski Pyramid",0
 titChild05 db "Sierpinski Sponge",0
 titChild06 db "Ball",0
 titChild07 db "Iterated function system (IFS)",0
 titChild08 db "Brownian Tree",0

;Prompt Messages
 szClose db "OK to close window?",0
;Error Messages
 szErrFrameHandle db "Failed to get the Frame Window Handle",0
 szErrChildHandle db "Failed to get the Child Window Handle",0
 szHeapAlloc db "Failed to allocate memory in Heap",0
 szHeapFree db "Failed to free memory from Heap",0

;Rotation angle
 theta dd 0.6 ;GLfloat

.data
;Class Names
 clsChild00 db "mdiChild00",0

;Window Captions
 lptitChild dq 16 dup (0)

;Global Variables
 g_hInst dq 0

 g_hMenuInit dq 0
 g_hMenuWindowInit dq 0

 g_hMenu dq 16 dup (0)
 g_hMenuWindow dq 16 dup (0)

;Static Variables
 s_hwndClientF dq 0 ;Frame

 s_hwndFrame dq 16 dup (0)
 s_hwndClient dq 16 dup (0)


;For CryptGenRandom
 hProv dq 0
 pbBuffer dq 0 ;db 8 dup (0)
 ;dwLen = $-pbBuffer
;Debug Messages
 szHeapAddress db "Heap Allocated at: 0000.0000.0000.0000h",0
 szGetWindow db "Got Window Handle: 0000.0000.0000.0000h",0
 szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

;.data?
 ;lpGlobalData dq ?

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
;FrameWndProc
 include 02_FrameWndProc\00_Frame.asm
;GetRandom64Proc
 ;include 03_RandomProc\00_GetRandom64.asm
;R2WndProc
 include 10_SieveWndProc\00_Sieve.asm
;R3WndProc
 include 15_SpongeWndProc\00_Sponge.asm
;CloseEnumProc
 include 90_CloseEnumProc\00_CloseEnum.asm

end