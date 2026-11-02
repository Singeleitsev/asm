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
include app\98_SpellEAX.asm
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
include ogl\22_MulMat4Mat4.asm
include ogl\30_GetGlobalOrigin.asm
include ogl\31_Determinant.asm
include ogl\32_SetGlobalOrigin.asm
include ogl\80_DrawScene.asm
;include ogl\81_DrawElements.asm ;inlined by 80_DrawScene.asm
;include Obj\82_Opaque.asm ;inlined by 81_DrawElements.asm
;include Obj\83_Transparent.asm ;inlined by 81_DrawElements.asm
include ogl\90_CloseGL.asm

include obj\00_ReadObjFile.asm
include obj\01_CountObjEntities.asm
include obj\02_AllocObjBuffers.asm
include Obj\10_ReadMtlFile.asm
include Obj\11_CountMtlEntities.asm
include Obj\12_AllocMtlBuffers.asm
include Obj\20_ParseMtlData.asm
include Obj\21_Parse_newmtl.asm
include Obj\22_Properties.asm
include Obj\30_ParseObjData.asm
include Obj\31_Parse_v.asm
include Obj\32_Parse_vn.asm
include Obj\33_Parse_vt.asm
include Obj\34_Parse_f.asm
include Obj\35_Parse_o.asm
include Obj\36_Parse_g.asm
include Obj\37_Parse_usemtl.asm
include Obj\38_Parse_s.asm
include Obj\39_Parse_mtllib.asm
;include Obj\40_FindOrAddCombinedVertex.asm
include Obj\41_BuildGeometry.asm
include Obj\42_MaterialMap.asm
include Obj\70_TextHelpers.asm
include Obj\80_ParseString.asm
include Obj\81_ParseFloat.asm
include Obj\82_ParseSignedInt.asm

end


