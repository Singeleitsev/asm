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
;include app\02_StatusBar.asm ;inlined by 00_WinMain.asm
include app\03_Timer.asm
;include app\04_CheckKeys.asm ;inlined by 00_WinMain.asm
include app\10_000_WndProc.asm
;include app\10_005_Size.asm ;inlined by 10_WndProc.asm
;include app\10_100_KeyDown.asm ;inlined by 10_WndProc.asm
;include app\10_111_Command.asm ;inlined by 10_WndProc.asm
include app\11_RefreshTitle.asm
include app\12_RefreshStatus.asm
include app\13_ConvertFloat.asm
include app\18_About.asm
include app\19_Close.asm
include app\90_Logger.asm
include app\91_WriteDecimal.asm
;include app\98_SpellEAX.asm
include app\99_SpellError.asm

include ogl\00_InitGL.asm
include ogl\01_GetDefaults.asm
include ogl\02_ResetScene.asm
include ogl\10_CameraMove.asm
include ogl\11_ModelMove.asm
include ogl\12_ModelRotate.asm
include ogl\20_Drift.asm
;include ogl\20_Orbit.asm
include ogl\21_Pan.asm
include ogl\22_Dolly.asm
include ogl\23_Geocentric.asm
include ogl\30_Arcball.asm
include ogl\80_DrawScene.asm
include ogl\90_CloseGL.asm

include obj\00_ParseObjFile.asm
;include obj\01_OpenObjFile.asm
;include obj\02_GetReqObjRAM.asm
;include obj\03_AllocObjRAM.asm
;include obj\10_ParseVertex.asm
;include obj\11_ParseNormal.asm
;include obj\12_ParseObject.asm
;include obj\13_ParseGroup.asm
;include obj\14_ParseFace.asm
;include obj\15_CombinedVertex.asm
include obj\20_ParseMtlFile.asm
;include obj\21_OpenMtlFile.asm
;include obj\22_GetReqMtlRAM.asm
;include obj\23_AllocMtlRAM.asm
;include obj\30_ParseMtlName.asm
;;include obj\31_ParseMtlTexture.asm
;include obj\32_ParseUseMtl.asm
;include obj\33_GroupMaterials.asm
;include obj\80_SkipSpace.asm
;include obj\81_ParseFloat.asm
;include obj\82_ParseSignedInt.asm

end
