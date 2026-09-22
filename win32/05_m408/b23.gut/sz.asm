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
sz_xCamText db "xCam = " ;No Zero Terminator
sz_xCamValue db 11 dup (0) ;"-1234.5678",0
sz_yCamText db "yCam = "
sz_yCamValue db 11 dup (0)
sz_zCamText db "zCam = "
sz_zCamValue db 11 dup (0)
sz_aYZ_CamText db "aYZ_Cam = "
sz_aYZ_CamValue db 10 dup (0) ;"-360.1234",0
sz_aXY_CamText db "aXY_Cam = "
sz_aXY_CamValue db 10 dup (0)
sz_aXZ_CamText db "aXZ_Cam = "
sz_aXZ_CamValue db 10 dup (0)
sz_aYZ_ModelText db "aYZ_Model = "
sz_aYZ_ModelValue db 10 dup (0)
sz_aXY_ModelText db "aXY_Model = "
sz_aXY_ModelValue db 10 dup (0)
sz_aXZ_ModelText db "aXZ_Model = "
sz_aXZ_ModelValue db 10 dup (0)

;Log
szLogFileName db "m408ogl.log",0
szLogBuffer db 100h dup (0)
szOK db ": OK",0Dh,0Ah,0
szError db " Error",0Dh,0Ah,0
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szCRLF db 0Dh,0Ah,0

;Spell
szErrWarning db "An Error occurred",0Dh,0Ah,"See the log file",0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
;szEAX db "eax = 0000.0000",0

;WinMain
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

;WndProc

;About
szAboutMsgTitle db "MASM32 OpenGL template",0
szAboutMsgText db "About",0

;Close
szMsgCloseTitle db "MASM32 OpenGL template",0
szMsgCloseText db "Exit?",0

;InitializeGL
szGetDC db "GetDC",0
szChoosePixelFormat db "ChoosePixelFormat",0
szSetPixelFormat db "SetPixelFormat",0
szWglCreateContext db "wglCreateContext",0
szWglMakeCurrent db "wglMakeCurrent",0
szGlViewport db "glViewport",0

;Message Box
;szCaption db "",0
;szMsgText db "",0
;szMsgTitle db "",0



