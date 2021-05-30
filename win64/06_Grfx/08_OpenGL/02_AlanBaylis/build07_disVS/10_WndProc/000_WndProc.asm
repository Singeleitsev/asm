;LRESULT CALLBACK WndProc(HWND hWnd, UINT uMessage, WPARAM wParam, LPARAM lParam)
;{ //1

;switch(uMessage)

;{ //2

include 010_WM_CREATE.asm
include 020_WM_COMMAND.asm
include 030_WM_CLOSE.asm
include 040_WM_DESTROY.asm
include 050_Default.asm

;} //2

;return 0;

;} //1