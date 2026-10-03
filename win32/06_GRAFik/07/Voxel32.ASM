.686
.xmm
.model flat, stdcall
option casemap:none

;WinAPI
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\comctl32.lib
includelib \masm32\lib\gdi32.lib

;OpenGL API
includelib \masm32\lib\opengl32.lib
includelib \masm32\lib\glu32.lib

include extern.asm ;External Functions
include macro.asm ;Macros

.const

include const.asm

.data

include struct.asm ;Structures
include var.asm ;Single Numeric Variables
include sz.asm ;Text Strings

.code

include app\00_WinMain.asm
;include app\01_Menu.asm ;inlined by 00_WinMain.asm
;include app\02_Accel.asm ;inlined by 00_WinMain.asm
;include app\03_StatusBar.asm ;inlined by 00_WinMain.asm
;include app\04_CheckKeys.asm ;inlined by 00_WinMain.asm
;include app\05_AutoRotate.asm ;<--- inlined, Custom
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
include app\99_SpellError.asm

include ogl\00_InitGL.asm
include ogl\01_GetDefaults.asm
include ogl\02_ResetScene.asm
include ogl\03_DisplayLists.asm
include ogl\10_CameraMove.asm
include ogl\11_CameraDrag.asm
include ogl\12_CameraDolly.asm
include ogl\13_CameraRotate.asm
include ogl\20_ObjectMove.asm
include ogl\21_ObjectRotate.asm
include ogl\30_GetGlobalOrigin.asm
include ogl\31_SetGlobalOrigin.asm
include ogl\80_DrawScene.asm
include ogl\90_CloseGL.asm

;include obj\00_Axes.asm ;inlined by ogl\80_DrawScene.asm
;include obj\01_Floor.asm ;inlined by ogl\80_DrawScene.asm
;include obj\10_DrawObject.asm ;inlined by ogl\80_DrawScene.asm
include obj\11_Cylinder.asm
include obj\12_Ring.asm
include obj\13_Cube.asm

end
