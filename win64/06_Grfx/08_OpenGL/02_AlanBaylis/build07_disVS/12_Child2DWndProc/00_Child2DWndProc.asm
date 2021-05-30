;LRESULT CALLBACK Child2DWndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
;{ //1
;switch(uMessage)
;{ //2
include 10_Size.asm
include 20_KeyDown.asm
include 21_KeyUp.asm
include 30_LButtonDown.asm
include 31_LButtonUp.asm
include 32_MouseMove.asm
include 40_Close.asm
include 50_MDIActivate.asm

;} //2
;return DefMDIChildProc(hWnd, uMessage, wParam, lParam);
;} //1