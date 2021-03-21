option casemap:none

;Standard Libraries
        includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
        includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
        includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom Includes
        include include\API64.inc
        include include\struct64.inc
        include include\Mem.inc
        include include\Call.inc
        include include\Spell.inc

.const
;Menu Equates
        include include\Menu.inc
;Classes
        szFrameClass db "MdiFrame",0
        szClientClass db "MDICLIENT",0 ;Pre-Defined by System
        szSieveClass db "MdiSieveChild",0
        szGasketClass db "MdiGasketChild",0
        szNgonClass db "MdiNgonChild",0
        szTreeClass db "MdiTreeChild",0
;Window Captions
        szFrameTitle db "Fractals",0
        szSieveTitle db "Sierpinski Sieve",0
        szGasketTitle db "Sierpinski Gasket",0
        szNgonTitle db "Sierpinski Ngon",0
        szTreeTitle db "Brownian Tree",0
;Prompt Messages
        szClose db "Close window?",0
;Error Messages
	;szErr db "Error",0

.data
;Global Handles
        hInst dq 0
;Menu Handles
        hMenuInit dq 0
        hMenuSieve dq 0
        hMenuGasket dq 0
        hMenuNgon dq 0
        hMenuTree dq 0
;Menu Window Handles
        hMenuInitWindow dq 0
        hMenuSieveWindow dq 0
        hMenuGasketWindow dq 0
        hMenuNgonWindow dq 0
        hMenuTreeWindow dq 0
;Static Frame Handles
        hwndClientF dq 0
;Static Sieve Handles
        hwndFrameS dq 0
        hwndClientS dq 0
;Static Gasket Handles
        hwndFrameG dq 0
        hwndClientG dq 0
;Static Ngon Handles
        hwndFrameN dq 0
        hwndClientN dq 0
;Static Tree Handles
        hwndFrameT dq 0
        hwndClientT dq 0
;Debug Messages
	szRAX db "RAX: 0000.0000.0000.0000h",0
	;szCX db "CX: 0000.0000.0000.0000h",0
	;szCY db "CY: 0000.0000.0000.0000h",0
	;szX0 db "x[0]: 0000.0000.0000.0000h",0
	;szY0 db "y[0]: 0000.0000.0000.0000h",0

;.data?
	;NgonSides dd ? ;Number of Ngon Vertices

.code
start proc
;Align the Stack by 10h
        and rsp,-16

;Get Application Handle
	sub rsp,20h
	xor rcx,rcx
        call GetModuleHandleA
	;add rsp,20h
        mov hInst,rax

;Go to Main Procedure
	;sub rsp,20h
	mov rcx,hInst
	xor rdx,rdx
	xor r8,r8
	mov r9,1
        call WinMain
	;add rsp,20h

;End All
	;sub rsp,20h
        call FatalExit
	;add rsp,20h
start endp

;Procedures
        include 0200_WinMain.asm
;FrameWndProc
        include 0300_Frame.asm
;CloseEnumProc
        include 0400_CloseEnum.asm
;SieveWndProc
        include 0500_Sieve.asm
;GasketWndProc
        include 0600_Gasket.asm
;NgonWndProc
        include 0700_Ngon.asm
;TreeWndProc
        include 0800_Tree.asm

end
