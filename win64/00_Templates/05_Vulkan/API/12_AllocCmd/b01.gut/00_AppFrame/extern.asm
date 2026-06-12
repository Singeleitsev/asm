;WinMain
extern LoadIconA:proc
extern LoadCursorA:proc
extern RegisterClassExA:proc
extern CreateWindowExA:proc
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
extern GetProcessHeap:proc
extern HeapAlloc:proc
extern HeapFree:proc

;Files
extern CreateFileA:proc
extern GetFileSize:proc
extern lstrlenA:proc
extern ReadFile:proc
extern WriteFile:proc
extern CloseHandle:proc

;Debug
extern GetLastError:proc
extern MessageBoxA:proc