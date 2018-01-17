
;Small MDI Window - DednDave - 8,2011

; =============================================================================================

; =========== Preamble ===========

        .586
        .MODEL  Flat,StdCall
        OPTION  CaseMap:None

; =========== Includes ===========

        .XCREF
        .NOLIST
        INCLUDE    \masm32\include\windows.inc
        INCLUDE    \masm32\include\kernel32.inc
        INCLUDE    \masm32\include\shell32.inc
        INCLUDE    \masm32\include\user32.inc
        INCLUDE    \masm32\include\comctl32.inc
        INCLUDE    \masm32\include\comdlg32.inc
        INCLUDE    \masm32\include\gdi32.inc
        INCLUDE    \masm32\include\ole32.inc
        INCLUDE    \masm32\include\oleaut32.inc
        INCLUDE    \masm32\include\msvcrt.inc
        INCLUDE    \masm32\include\masm32.inc
        INCLUDE    \masm32\include\dialogs.inc
        INCLUDE    \masm32\macros\macros.asm

        INCLUDELIB \masm32\lib\kernel32.lib
        INCLUDELIB \masm32\lib\shell32.lib
        INCLUDELIB \masm32\lib\user32.lib
        INCLUDELIB \masm32\lib\comctl32.lib
        INCLUDELIB \masm32\lib\comdlg32.lib
        INCLUDELIB \masm32\lib\gdi32.lib
        INCLUDELIB \masm32\lib\ole32.lib
        INCLUDELIB \masm32\lib\oleaut32.lib
        INCLUDELIB \masm32\lib\msvcrt.lib
        INCLUDELIB \masm32\lib\masm32.lib
        .LIST

; =========== Prototypes ===========

WndProc         PROTO    :HWND,:UINT,:WPARAM,:LPARAM
ChildProc       PROTO    :HWND,:UINT,:WPARAM,:LPARAM

; =========== Equates ===========

IDI_ICON                 EQU 100
IDM_MAINMENU             EQU 543
IDM_FILENEW              EQU 544   ;= WM_MDICREATE
IDM_FILEARRANGE_TILEHORZ EQU 549   ;= WM_MDITILE - 1
IDM_FILEARRANGE_TILEVERT EQU 550   ;= WM_MDITILE
IDM_FILEARRANGE_CASCADE  EQU 551   ;= WM_MDICASCADE
IDM_FILEARRANGE_ICONS    EQU 552   ;= WM_MDIICONARRANGE
IDM_FILEEXIT             EQU 545
IDA_ACC                  EQU 999
IDW_FIRSTCHILD           EQU 1000

;end of include file