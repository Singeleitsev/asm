option casemap:none
option prologue: none
option epilogue: none

;WinAPI
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\kernel32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\User32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\ComCtl32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\Gdi32.Lib"
;OpenGL
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\OpenGL32.Lib"
includelib "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64\GlU32.Lib"

include extern.asm ;External Functions
include macro.asm ;Macros

.const

include const.asm
include obj\00_Layout.asm

.data

include struct.asm ;Structures
include var.asm ;Single Numeric Variables
include sz.asm ;Text Strings

.code

include app\00_WinMain.asm
include app\01_DummyWnd.asm
include app\02_MainWnd.asm
;include app\03_Menu.asm ;inlined by 01_MainWnd.asm
;include app\04_Accel.asm ;inlined by 01_MainWnd.asm
;include app\05_StatusBar.asm ;inlined by 01_MainWnd.asm
;include app\06_CheckKeys.asm ;inlined by 00_WinMain.asm
include app\10_000_WndProc.asm
;include app\10_005_Size.asm ;inlined by 10_WndProc.asm
;include app\10_100_KeyDown.asm ;inlined by 10_WndProc.asm
;include app\10_111_Command.asm ;inlined by 10_WndProc.asm
include app\11_RefreshTitle.asm
include app\12_RefreshStatus.asm
include app\13_FloatToANSI.asm
include app\18_About.asm
include app\19_Close.asm
include app\80_FPS.asm
include app\90_Logger.asm
include app\91_WriteDecimal.asm
;include app\98_SpellRAX.asm
include app\99_SpellError.asm

include ogl\00_InitDummyGL.asm
include ogl\01_InitCoreGL.asm
include ogl\02_GetNames.asm
include ogl\10_Compile.asm
include ogl\11_LinkShaders.asm
include ogl\20_SetVBO.asm
include ogl\21_SetVAO.asm
include ogl\30_GetDefaults.asm
include ogl\31_ResetScene.asm
include ogl\40_CameraMove.asm
include ogl\41_CameraDrag.asm
include ogl\42_CameraDolly.asm
include ogl\43_CameraRotate.asm
include ogl\50_ObjectMove.asm
include ogl\51_ObjectRotate.asm
include ogl\52_MulMat4Mat4.asm
include ogl\60_GetGlobalOrigin.asm
include ogl\61_Determinant.asm
include ogl\62_SetGlobalOrigin.asm
include ogl\80_DrawScene.asm
;include obj\81_LightDirection.asm ;inlined by 80_DrawScene.asm
;include obj\82_DrawVBO.asm ;inlined by 80_DrawScene.asm
include ogl\90_CloseGL.asm

;include obj\00_Layout.asm ;inlined by RBMK64.ASM
include obj\10_BuildGeometry.asm

end


