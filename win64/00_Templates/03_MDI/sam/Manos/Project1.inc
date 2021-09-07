include \masm32\include\windows.inc
include \masm32\include\masm32.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\gdi32.inc
include \masm32\include\comctl32.inc
include \masm32\include\debug.inc	

includelib \masm32\lib\masm32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\comctl32.lib
includelib \masm32\lib\debug.lib

WinMain					PROTO :DWORD,:DWORD,:DWORD,:DWORD
AboutDlgProc			PROTO :DWORD,:DWORD,:DWORD,:DWORD
CreateStatus			PROTO :DWORD
strCopy             	PROTO :DWORD,:DWORD

.const
IDB_TOOLBAR				equ 51
IDR_MAINMENU			equ	101
IDR_CHILDMENU			equ	102
IDM_FILE_NEW			equ	201
IDM_FILE_OPEN			equ 202
IDM_FILE_CLOSE			equ	203
IDM_FILE_EXIT 			equ	204
IDM_FILE_SAVE			equ 205
IDM_FILE_PRINT			equ 206
IDM_EDIT_CUT			equ 207
IDM_EDIT_COPY			equ 208
IDM_EDIT_PASTE			equ 209
IDM_VIEW_TOOLBAR		equ 210
IDM_VIEW_STATUS			equ 211
IDM_WIN_TILEHORZ		equ	212
IDM_WIN_TILEVERT		equ	213
IDM_WIN_CASCADE			equ	214
IDM_HELP_CONTENTS		equ 215
IDM_HELP_ABOUT			equ 216
ID_TOOLBAR				equ 250
IDC_STATIC_ABOUT		equ 1001
IDC_BTN_OK				equ 1002
IDC_BTN_OK				equ 1002

.data
szAppName				db "Multi Document Interface",0
szFrameClass			db "FrameClass",0
szClientClass			db "MDICLIENT",0
szChildClass			db "ChildClass",0
szChildName				db "MDIChild",0
szChildTitle			db "Child Window",0
szAboutDlg				db 'AboutDlg',0

tbb		TBBUTTON <0, IDM_FILE_NEW,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <1, IDM_FILE_OPEN,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <2, IDM_FILE_SAVE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0,0>
		TBBUTTON <3, IDM_FILE_PRINT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0,0>
		TBBUTTON <4, IDM_EDIT_CUT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <5, IDM_EDIT_COPY,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <6, IDM_EDIT_PASTE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0,0>
		TBBUTTON <7, IDM_HELP_ABOUT,TBSTATE_ENABLED,TBSTYLE_BUTTON ,0,0,0>
		TBBUTTON <8, IDM_HELP_CONTENTS,TBSTATE_ENABLED,TBSTYLE_BUTTON ,0,0,0>

.data?
hInstance			dd ?
hMainMenu			dd ?
hChildMenu			dd ?
hClient				dd ?
hwndMain			dd ?
hStatus             dd ?
hToolbar            dd ?
sbParts				dd 4 dup(?)

mdiCreate			MDICREATESTRUCT <>

MAKEDWORD MACRO LoWord,HiWord
          mov ax, HiWord
          ror eax, 16
          mov ax, LoWord
ENDM
LOWORD MACRO bigword  
       mov  eax,bigword
       and  eax,0FFFFh      
ENDM
HIWORD MACRO bigword  
       mov  eax,bigword
       shr  eax,16
ENDM       
