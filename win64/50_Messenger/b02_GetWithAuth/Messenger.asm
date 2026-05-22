;vulkan-tutorial.com
option casemap:none
option prologue:none
option epilogue:none

;Standard Libraries
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\User32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\kernel32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\ComCtl32.Lib"
;WinINet
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\wininet.Lib"

;WinMain
extern LoadIconA:proc
extern LoadCursorA:proc
extern RegisterClassExA:proc
extern CreateWindowExA:proc
extern ShowWindow:proc
extern UpdateWindow:proc
extern PeekMessageA:proc
extern TranslateAcceleratorA:proc
extern TranslateMessage:proc
extern DispatchMessageA:proc
extern ExitProcess:proc
;Menu
extern CreateMenu:proc
extern CreatePopupMenu:proc
extern AppendMenuA:proc
extern CreateAcceleratorTableA:proc
;StatusBar
extern InitCommonControlsEx:proc
extern SendMessageA:proc
;WndProc
extern GetClientRect:proc
extern DefWindowProcA:proc
extern PostQuitMessage:proc
extern DestroyWindow:proc
;Memory
extern LocalAlloc:proc
extern LocalReAlloc:proc
extern LocalFree:proc
;WinINet
extern InternetOpenA:proc
extern InternetConnectA:proc
extern HttpOpenRequestA:proc
extern HttpSendRequestA:proc
extern InternetReadFile:proc
extern InternetCloseHandle:proc
;SpellError
extern GetLastError:proc
extern MessageBoxA:proc

.const

;Menu IDs
IDM_APP_EXIT equ 10Fh
IDM_FORUM_FETCH equ 200h
IDM_HELP_ABOUT equ 0F01h

; Constants
INTERNET_OPEN_TYPE_DIRECT equ 1
INTERNET_SERVICE_HTTP equ 3
INTERNET_FLAG_SECURE equ 800000h

.data

;WNDCLASSEXA wcx
align 10h
wcx_cbSize dd 50h ;sizeof(WNDCLASSEX)
wcx_style dd 3 ;CS_HREDRAW | CS_VREDRAW
wcx_lpfnWndProc dq offset WndProc
wcx_cbClsExtra dd 0
wcx_cbWndExtra dd 0
wcx_hInstance dq 0 ;hInstance
wcx_hIcon dq 0 ;LoadIcon(hInstance, MAKEINTRESOURCE(IDI_VULKAN))
wcx_hCursor dq 0 ;LoadCursor(nullptr, IDC_ARROW)
wcx_hbrBackground dq 6 ;(HBRUSH)(COLOR_WINDOW+1)
wcx_lpszMenuName dq 0 ;MAKEINTRESOURCEW(IDC_VULKAN)
wcx_lpszClassName dq offset szMainWndClass
wcx_hIconSm dq 0 ;LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL))

;MSG msg
align 10h
msg_hwnd dq 0
msg_message dd 0
msg_dummy0 dd 0
msg_wParam dq 0
msg_lParam dq 0
msg_time dd 0
msg_pt_x dd 0
msg_pt_y dd 0
msg_dummy1 dd 0

;ACCEL accel
align 10h ;Must be aligned to avoid error 0x03e6
accel \
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;dummy
dw 57h ;'W'
dw IDM_APP_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;dummy
dw 70h ;VK_F1 = 0x70
dw IDM_HELP_ABOUT ;command ID

;INITCOMMONCONTROLSEX icce
align 10h
icce_dwSize dd 0
icce_dwICC dd 0

;RECT rect
align 10h
RectMain_left dd 0
RectMain_top dd 0
RectMain_right dd 0
RectMain_bottom dd 0
RectMain_width dd 0
RectMain_height dd 0


;WinMain
ghInstance dq 0
ghPrevInstance dq 0
gpCmdLine dq 0
gnCmdShow dq 0
gnWndClass dq 0
ghWndMain dq 0
isActive db 0
isRefreshed db 0

;Menu
ghMenuMain dq 0
ghMenuFile dq 0
ghMenuHelp dq 0
ghAccTable dq 0

;StatusBar
ghwndStatusBar dq 0
idStatusBar dq 0
;Divide Status Bar by 9 parts
xStatusParts dd 8 dup (0),-1 ;9 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;8 Constants

;Forum
ghMenuForum dq 0

;Strings

szWinMain db "WinMain", 0
szMainWndClass db "WasmInWndClass", 0
szMainWndTitle db "WASM.in", 0

;Menu
szMenuFile db '&File',0
szMenuFileExit db 'E&xit',9,'Ctrl+W',0
szMenuForum db '&Forum',0
szMenuForumFetch db 'Fetch &Threads',0
szMenuHelp db '&Help',0
szMenuHelpAbout db '&About...',9,'F1',0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db 'msctls_statusbar32',0 ;"STATUSCLASSNAMEW"

;WndProc
szMsgCloseText db "Exit?",0

;Forum
szAgent db "ForumClient/1.0",0
szHost db "wasm.in",0 ;https://wasm.in/
szUserName db "ml64",0
szPassword db "Fermentum",0
szVerb db "GET",0
szApiUrl db "/api/threads",0
szApiKeyHeader db "XF-Api-Key: YOUR_API_KEY_HERE",0  ; <-- REPLACE WITH REAL KEY

;AboutProc
szAboutMsgTitle db 'About',0
szAboutMsgText db 'Vulkan Template',0

;SpellError
gnLastError dd 0
szErr db 'Error',0
szErrGetModuleHandle db 'GetModuleHandle Error: 0x' ;No Zero Terminator
szErrGetModuleHandleCode db 5 dup (0) ;'0000',0
szErrRegisterClass db 'RegisterClass Error: 0x'
szErrRegisterClassCode db 5 dup (0)
szErrCreateWindow db 'CreateWindow Error: 0x'
szErrCreateWindowCode db 5 dup (0)
szErrCreateMenu db 'CreateMenu Error: 0x'
szErrCreateMenuCode db 5 dup (0)
;CreateStatusBar
szErrCreateStatusBar db 'CreateStatusBar Error: 0x'
szErrCreateStatusBarCode db 5 dup (0)
;WndProc
szErrGetClientRect db 'GetClientRect Error: 0x'
szErrGetClientRectCode db 5 dup (0)
;Internet
szFetchSuccess db "API Response",0
szFetchFail db "Failed to fetch threads",0

.code

include 00_WinApp\00_WinMain.asm
include 00_WinApp\10_WndProc.asm
include 00_WinApp\18_AboutProc.asm
include 00_WinApp\19_CloseProc.asm
include 00_WinApp\90_SpellErrorProc.asm

include 10_wininet\FetchThreads.asm
include 10_wininet\HttpGetWithAuth.asm

end

