;LRESULT CALLBACK Child3DWndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)

;{ //1
;switch(uMessage)

;{ //2
include 10_KeyDown.asm
include 11_KeyUp.asm
include 20_LButtonDown.asm
include 21_MouseMove.asm
include 22_LButtonUp.asm
;include 23_NCMouseMove.asm
;include 30_Paint.asm
include 40_Close.asm
include 50_MDIActivate.asm

;} //2
;return DefMDIChildProc(hWnd, uMessage, wParam, lParam);

;} //1


