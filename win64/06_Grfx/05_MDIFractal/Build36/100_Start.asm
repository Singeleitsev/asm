option casemap:none

;Standard Libraries
        includelib C:\bin\dev\ml64\VS2017\lib\user32.lib
        includelib C:\bin\dev\ml64\VS2017\lib\kernel32.lib
        includelib C:\bin\dev\ml64\VS2017\lib\gdi32.lib
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
;Window Captions
        szFrameTitle db "Fractals",0
        szSieveTitle db "Sierpinski Sieve",0
        szGasketTitle db "Sierpinski Gasket",0
        szNgonTitle db "Ngon",0
;Prompt Messages
        szClose db "Close window?",0
;Error Messages
        szErr db "Error",0
        szErrFrameHandle db "Failed to get the Frame Window Handle",0
        szErrChildHandle db "Failed to get the Child Window Handle",0

.data
;Global Handles
        hInst dq 0
;Menu Handles
        hMenuInit dq 0
        hMenuSieve dq 0
        hMenuGasket dq 0
        hMenuNgon dq 0
;Menu Window Handles
        hMenuInitWindow dq 0
        hMenuSieveWindow dq 0
        hMenuGasketWindow dq 0
        hMenuNgonWindow dq 0
;Static Frame Handles
        hwndClientF dq 0
;Static Sieve Handles
        hwndFrameS dq 0
        hwndClientS dq 0
;static Gasket Handles
        hwndFrameG dq 0
        hwndClientG dq 0
;static Ngon Handles
        hwndFrameN dq 0
        hwndClientN dq 0
;Debug Messages
	szRAX db "Stack Pointer: 0000.0000.0000.0000h",0
        szRSP db "Stack Pointer: 0000.0000.0000.0000h",0
        szHeapAddress db "Heap Allocated at: 0000.0000.0000.0000h",0
        szGetWindow db "Got Window Handle: 0000.0000.0000.0000h",0
        szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

;.data?


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
        include 200_WinMain.asm
;FrameWndProc
        include 300_Frame.asm
;CloseEnumProc
        include 400_CloseEnum.asm
;SieveWndProc
        include 500_Sieve.asm
;GasketWndProc
        include 600_Gasket.asm
;NgonWndProc
        include 700_Ngon.asm
end