;WinMain
szMainWndClass db "MainWndClass",0
szMainWndTitle db "MASM32 OpenGL Environment" ;No Zero Terminator
szMainWndTitleFrame db " - [Frame 00000000]" ;No Zero Terminator
szMainWndTitleFPS db " - [000 FPS]",0

;Menu
szMenuFile db "&File",0
szMenuFileSave db "&Save",9,"Ctrl+S",0
szMenuFileExit db "E&xit",9,"Ctrl+W",0
szMenuHelp db "&Help",0
szMenuHelpAbout db "&About...",9,"F1",0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db "msctls_statusbar32",0 ;"STATUSCLASSNAMEW"
sz_xCamText db "xCam: " ;No Zero Terminator
sz_xCamValue db 14 dup (0) ;"-1234567.1234",0
sz_yCamText db "yCam: "
sz_yCamValue db 14 dup (0)
sz_zCamText db "zCam: "
sz_zCamValue db 14 dup (0)
sz_xObjText db "xObj: " ;No Zero Terminator
sz_xObjValue db 14 dup (0) ;"-1234567.1234",0
sz_yObjText db "yObj: "
sz_yObjValue db 14 dup (0)
sz_zObjText db "zObj: "
sz_zObjValue db 14 dup (0)
szZero db "0.0000",0,0 ;Two dwords
szNaN db "NaN",0 ;One dword
szInfinity db "Inf",0 ;One dword

;About
szAboutMsgTitle db "About MASM32 OpenGL Demo",0
szAboutMsgText db "Controls:",0Dh,0Ah ;No Zero Terminator
db 0Dh,0Ah
db "Left Mouse Button - Rotate the Camera",0Dh,0Ah
db "Mouse Wheel Down - Drag the Camera",0Dh,0Ah
db "Mouse Scroll - Dolly the Camera",0Dh,0Ah
db "Right Mouse Button - Rotate the Object",0Dh,0Ah
db 0Dh,0Ah
db "Arrows, Page Up, Page Down - Move the Camera",0Dh,0Ah
db "W,S,A,D,Q,E - Move the Object",0Dh,0Ah
db "Shift - Boost",0Dh,0Ah
db 0Dh,0Ah
db "Space, Esc - Reset Scene",0

;Close
szMsgCloseTitle db "MASM32 OpenGL Demo",0
szMsgCloseText db "Exit?",0

;Log
szLogFileName db "RBMK32.log",0
;szLogBuffer db 100h dup (0)
szOK db ": OK",0Dh,0Ah,0
szError db " Error",0Dh,0Ah,0
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szCRLF db 0Dh,0Ah,0

;WinMain - Log
szLogInit db "Application Started",0Dh,0Ah,0
szLogEnterWinMain db "Entered WinMain",0Dh,0Ah,0
szGetModuleHandleA db "GetModuleHandleA",0
szRegisterClassExA db "RegisterClassExA",0
szLogCreatingMenu db "Creating the Menu",0
szCreateAcceleratorTableA db "CreateAcceleratorTableA",0
szLogCreatingMainWnd db "Started Creating the Main Window",0Dh,0Ah,0
szCreateWindowExA db "CreateWindowExA",0
szLogMainWndCreated db "The Main Window Created Successfully",0Dh,0Ah,0
szLogCreatingStatusBar db "Creating the Status Bar",0
szExitProcess db "ExitProcess",0Dh,0Ah,0

;InitializeGL - Log
szGetDC db "GetDC",0
szChoosePixelFormat db "ChoosePixelFormat",0
szSetPixelFormat db "SetPixelFormat",0
szWglCreateContext db "wglCreateContext",0
szWglMakeCurrent db "wglMakeCurrent",0
szGlViewport db "glViewport",0

;Object Log
szLogDataLoaded db "Object Data Loaded Successfully",0Dh,0Ah,0
szErrDataLoading db "Object Data Loading Error",0Dh,0Ah,0
szLastRow db "Last Row Read: ",0
szLastColumn db ", Last Column Read: ",0
szBytesWritten db ", Bytes Written: ",0

;Spell
szErrWarning db "An Error occurred",0Dh,0Ah,"See the log file",0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
szEAX db "eax = 0000.0000",0

;Message Box
;szCaption db "",0
;szMsgText db "",0
;szMsgTitle db "",0



