;WinMain
szWndClassDummy db "WndClassDummy",0
szWndClassMain db "WndClassMain",0
szWndTitleDummy db "Dummy",0
szWndTitleMain db "MASM64 OpenGL Environment" ;No Zero Terminator
szWndTitleMainFPS db " - [000 FPS]",0 ;Concatenation Ends

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

;About
szAboutMsgTitle db "About MASM64 OpenGL Demo",0
szAboutMsgText label byte ;Concatenation
db "Controls:",0Dh,0Ah ;No Zero Terminator
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
db "Space, Esc - Reset Scene",0 ;Concatenation Ends

;Close
szMsgCloseTitle db "MASM64 OpenGL Demo",0
szMsgCloseText db "Exit?",0

;Spell
szErrWarning db "An Error occurred",0Dh,0Ah,"See the log file",0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0

;Shader Files
szFileNameShaderV db "glsl\vertex.glsl",0
szFileNameShaderF db "glsl\fragment.glsl",0

;VAO
szAttributePos db "aPos",0
szAttributeNormal db "aNormal",0
szAttributeDiffuse db "aDiffuse",0
szAttributeSpecular db "aSpecular",0
szAttributeAmbient db "aAmbient",0
szAttributeEmissive db "aEmissive",0
szAttributeProps0 db "aProps0",0
szAttributeProps1 db "aProps1",0

;Uniforms
szUniformProjection db "uProjection",0
szUniformModel db "uModel",0
szUniformView db "uView",0
szUniformLightDir db "uLightDir",0
szUniformCamera db "uCameraPos",0
szUniformDiffuse db "uDiffuse",0
szUniformSpecular db "uSpecular",0
szUniformAmbient db "uAmbient",0
szUniformEmissive db "uEmissive",0
szUniformProps0 db "uProps0",0
szUniformProps1 db "uProps1",0

;OpenGL Functions from the vendor's driver DLL

;ARB Functions
szWglCreateContextAttribsARB db "wglCreateContextAttribsARB",0
szWglChoosePixelFormatARB db "wglChoosePixelFormatARB",0

;VBO Functions
szGlGenBuffers db "glGenBuffers",0
szGlBindBuffer db "glBindBuffer",0
szGlBufferData db "glBufferData",0
szGlDeleteBuffers db "glDeleteBuffers",0

;VAO Functions
szGlEnableVertexAttribArray db "glEnableVertexAttribArray",0
szGlDisableVertexAttribArray db "glDisableVertexAttribArray",0
szGlVertexAttribPointer db "glVertexAttribPointer",0
szGlBindAttribLocation db "glBindAttribLocation",0
szGlGenVertexArrays db "glGenVertexArrays",0
szGlBindVertexArray db "glBindVertexArray",0
szGlDeleteVertexArrays db "glDeleteVertexArrays",0

;Shader Functions
szGlCreateShader db "glCreateShader",0
szGlShaderSource db "glShaderSource",0
szGlCompileShader db "glCompileShader",0
szGlGetShaderiv db "glGetShaderiv",0
szGlCreateProgram db "glCreateProgram",0
szGlAttachShader db "glAttachShader",0
szGlLinkProgram db "glLinkProgram",0
szGlGetProgramiv db "glGetProgramiv",0
szGlUseProgram db "glUseProgram",0
szGlDeleteShader db "glDeleteShader",0
szGlDeleteProgram db "glDeleteProgram",0
szGlGetAttribLocation db "glGetAttribLocation",0

;Uniform Functions
szGlUniform3f db "glUniform3f",0
szGlUniform3fv db "glUniform3fv",0
szGlUniformMatrix4fv db "glUniformMatrix4fv",0
szGlGetUniformLocation db "glGetUniformLocation",0

;OpenGL Logger Functions
szGlGetShaderInfoLog db "glGetShaderInfoLog",0
szGlGetProgramInfoLog db "glGetProgramInfoLog",0

;Log

;Application Log
szLogFileName db "m408gl64.log",0
;szLogBuffer db 100h dup (0)
szOK db ": OK",0Dh,0Ah,0
szError db " Error",0Dh,0Ah,0
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szCRLF db 0Dh,0Ah,0

;WinMain - Log
szLogInit db "Log Started",0Dh,0Ah,0
szGetModuleHandleA db "GetModuleHandleA",0
szExitProcess db "ExitProcess",0Dh,0Ah,0

;Window Query
szLogCreateWindowDummy db "Started Creating the Dummy Window",0Dh,0Ah,0
szRegisterClassExA db "RegisterClassExA",0
szCreateWindowExA db "CreateWindowExA",0
szLogDestroyWindowDummy db "Dummy Window Created and Destroyed",0Dh,0Ah,0
szLogCreatingMainWnd db "Started Creating the Main Window",0Dh,0Ah,0
szLogCreatingMenu db "Creating the Menu",0
szCreateAcceleratorTableA db "CreateAcceleratorTableA",0
szLogCreatingStatusBar db "Creating the Status Bar",0
szLogMainWndCreated db "Main Window Created Successfully",0Dh,0Ah,0

;Initialize Dummy GL - Log
szInitDummyGL db "Initializing the Dummy OpenGL Context",0
szGetDC db "GetDC",0
szChoosePixelFormat db "ChoosePixelFormat",0
szSetPixelFormat db "SetPixelFormat",0
szWglCreateContext db "wglCreateContext",0
szWglMakeCurrent db "wglMakeCurrent",0
szWglGetProcAddress db "wglGetProcAddress",0
szGlVendor db "GL_VENDOR: ",0
szGlRenderer db "GL_RENDERER: ",0
szGlVersion db "GL_VERSION: ",0
szGlContextProfileMask db "GL_CONTEXT_PROFILE_MASK: ",0
szWglDeleteContext db "wglDeleteContext",0
szReleaseDC db "ReleaseDC",0
szDestroyWindow db "DestroyWindow",0
szUnregisterClassA db "UnregisterClassA",0

;Initialize Core GL - Log
szInitCoreGL db "Initializing the Core OpenGL Context",0
szGlViewport db "glViewport",0
szErrSetShaders db "Failed to Set the Shaders",0Dh,0Ah,0
szErrSetVBO db "Failed to Set the VBO Environment",0Dh,0Ah,0
szErrSetVAO db "Failed to Set the VAO Environment",0Dh,0Ah,0
szErrLoadExtension db "Failed to load the OpenGL Extension",0Dh,0Ah,0

;Shaders - Log
szLogLoadShaderV db "Loading Vertex Shader Source",0Dh,0Ah,0
szLogLoadShaderF db "Loading Fragment Shader Source",0Dh,0Ah,0
szCreateFileA db "CreateFileA",0
szLogFileSize db "File Size: ",0
szHeapAlloc db "HeapAlloc",0
szLogReadFile db "Reading the File",0Dh,0Ah,0
szBytesRead db "Bytes Read: ",0
szLogSourceLoadSuccess db "Shader Source Loaded Successfully",0Dh,0Ah,0
szLogCompileSuccess db "Shader Compiled Successfully",0Dh,0Ah,0
szLinkShadersSuccess db "Shaders Linked Successfully",0Dh,0Ah,0
szErrUniformNotFound db "Uniform Variable Not Found",0Dh,0Ah,0

;OBJ

szFileNameObj db "Obj\m408.obj",0
szLogObjLoad db "Loading OBJ file",0Dh,0Ah,0
szLogObjOpened  db "OBJ file opened, size: ",0
szLogObjSuccess db "OBJ loaded successfully",0Dh,0Ah,0
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

szFileNameMtl db "Obj\m408.mtl",0
szLogMtlLoad db "Loading MTL file",0Dh,0Ah,0
szLogMtlOpened db "MTL file opened, size: ",0
szLogMtlSuccess db "MTL loaded successfully",0Dh,0Ah,0
szErrMtlOpen db "Cannot open MTL file",0Dh,0Ah,0
szErrMtlFileSize db "MTL file size error",0Dh,0Ah,0
szErrMtlMap db "Mapping MTL failed",0Dh,0Ah,0

;Tokens
szLogFoundMtlTokens db "Found MTL tokens:",0Dh,0Ah,0
szLogCount_newmtl db "newmtl: ",0

;Parser
szLogParsedMtlEntities db "Parsed Mtl entities:",0Dh,0Ah,0
szLogParsed_newmtl db "New Materials: ",0

;VBO
szVboSuccess db "VBO Set Successfully",0Dh,0Ah,0

;VAO
szVaoSuccess db "VAO Set Successfully",0Dh,0Ah,0


