;Application
szMainWndClass db "MainWndClass",0
szMainWndTitle db "MASM32 OpenGL Environment" ;No Zero Terminator
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
szOverflow db "Too far",0 ;Two dwords

;About Dialog
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

;Close Dialog
szMsgCloseTitle db "MASM32 OpenGL Demo",0
szMsgCloseText db "Exit?",0

;Buffers
szTextBuffer db TEXT_BUFFER_SIZE dup (0)

;Logger
szLogFileName db "m408gl32.log",0
szOK db ": OK",0Dh,0Ah,0
szError db " Error",0Dh,0Ah,0
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szCRLF db 0Dh,0Ah,0

;Spell
szErrWarning db "An Error occurred",0Dh,0Ah,"See the log file",0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
szEAX db "eax = 0000.0000",0

;WinMain Log
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

;InitializeGL Log
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
szLastColumn db "Last Column Read: ",0
szVertices db "Vertices Written: ",0
szIndices db "Indices Written: ",0

;OBJ
szFileNameObj db "OBJ\m408.obj",0
szLogObjLoad db "Loading OBJ file",0Dh,0Ah,0
szLogObjOpened  db "OBJ file opened, size: ",0
szLogObjSuccess db "OBJ data loaded successfully",0Dh,0Ah,0
szErrObjOpen db "Cannot open OBJ file",0Dh,0Ah,0
szErrObjFileSize db "OBJ file size error",0Dh,0Ah,0
szErrObjMap db "Mapping OBJ failed",0Dh,0Ah,0
szErrUnexpectedEOF db "Unexpected End Of File",0Dh,0Ah,0

;Tokens
szLogFoundObjTokens db "Found OBJ tokens:",0Dh,0Ah,0
szLogCount_mtllib db "mtllib: ",0
szLogCount_o db "o: ",0
szLogCount_g db "g: ",0
szLogCount_usemtl db "usemtl: ",0
szLogCount_s db "s: ",0
szLogCount_v db "v: ",0
szLogCount_vn db "vn: ",0
szLogCount_vt db "vt: ",0
szLogCount_f db "f: ",0

;Parser
szLogParsedObjEntities db "Parsed OBJ entities:",0Dh,0Ah,0
szLogParsed_mtllib db "Parsed Material Libraries: ",0
szLogParsed_o db "Parsed Objects: ",0
szLogParsed_g db "Parsed Groups: ",0
szLogParsed_usemtl db "Used Materials: ",0
szLogParsed_s db "Parsed Smoothing Groups: ",0
szLogParsed_v db "Parsed Vertices: ",0
szLogParsed_vn db "Parsed Normals: ",0
szLogParsed_vt db "Parsed Texture Vectors: ",0
szLogParsed_f db "Parsed Faces: ",0

;MTL
szFileNameMtl db "OBJ\m408.Mtl",0
szLogMtlLoad db "Loading MTL file",0Dh,0Ah,0
szLogMtlOpened  db "MTL file opened, size: ",0
szLogMtlSuccess db "MTL data loaded successfully",0Dh,0Ah,0
szErrMtlOpen db "Cannot open MTL file",0Dh,0Ah,0
szErrMtlFileSize db "MTL file size error",0Dh,0Ah,0
szErrMtlMap db "Mapping MTL failed",0Dh,0Ah,0

;Tokens
szLogFoundMtlTokens db "Found MTL tokens:",0Dh,0Ah,0
szLogCount_newmtl db "newmtl: ",0

;Parser
szLogParsedMtlEntities db "Parsed Mtl entities:",0Dh,0Ah,0
szLogParsed_newmtl db "New Materials: ",0


