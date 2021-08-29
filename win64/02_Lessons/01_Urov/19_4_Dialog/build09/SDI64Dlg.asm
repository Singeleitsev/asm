option casemap:none
;Standard Includes and Libraries
	include F:\bin\dev\asm\ml64\include\user32.inc
	include F:\bin\dev\asm\ml64\include\kernel32.inc
	include F:\bin\dev\asm\ml64\include\gdi32.inc
	includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
;Custom Includes
	include include\struct64.inc
	include include\Mem.inc
	include include\Call.inc
	include include\Spell.inc
;Urov Includes
	include include\sim4_to_RAXbin64.inc

.const
;System
	IDOK		equ 1
	IDCANCEL	equ 2
;Menu
	MYMENU		equ 100h
	IDM_DRAWTEXT	equ 111h
	IDM_TEXTOUT	equ 112h
	IDM_LENGTH	equ 211h
	IDM_RECTANGLE	equ 212h
	IDM_PEACOCK	equ 221h
	IDM_LACES	equ 222h
	IDM_ABOUT	equ 311h
;Dialog
	IDC_EDIT11 equ 1011h
	IDC_EDIT12 equ 1012h
	IDC_EDIT13 equ 1013h
	IDC_EDIT14 equ 1014h
	IDC_EDIT21 equ 1021h
	IDC_EDIT22 equ 1022h
	IDC_EDIT23 equ 1023h
	IDC_EDIT24 equ 1024h

.data
;Class Names
	szWndClass db "clsSDI64Dlg",0
;Window Captions
	szAppTitle db "64-bit SDI Application assembled with MASM",0
;Dialog Names
	szMenuName db "MyMenu",0 ;<-----
	szDialog1Name db "IDD_DIALOG1",0 ;<-----
	szDialog2Name db "IDD_DIALOG2",0 ;<-----
	szDialog3Name db "AboutBox",0 ;<-----
;Info Messages
	szHello db 'Hello,World!',0
;Prompt Messages
	szExit db "Close this Application?",0
;Debug Messages
	szDC db "Device Context: 0000.0000.0000.0000h",0	
	szStackPointer db "rsp: 0000.0000.0000.0000h",0
;Error Messages
	szErrFrameHandle db "Failed to get the Main Window Handle",0
	szErrWinMain db "Error in WinMain",0

.data?
;Handles
	hInst dq ?
	hWndMain dq ?
	hMenu dq ? ;<-----
	hDC dq ?
;Coordinates
	X_start dq ?
	Y_start dq ?
	X_end dq ?
	Y_end dq ?
;Structures
	wc WNDCLASSEX64 <?>
	msg MSG64 <?>

.code

include 00_WinMain.asm
include 10_WndProc.asm
include 20_MenuProc.asm
include 30_Dialog1Proc.asm
include 40_Dialog2Proc.asm
include 50_Dialog3Proc.asm

end



