option casemap:none
;Standard Libraries
	includelib F:\bin\dev\ml64\VS2019\lib\user32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\kernel32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\gdi32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\OpenGL32.lib

;Custom Includes
	include include\API64.inc
	include include\Call.inc
	include include\Mem.inc
	include include\OpenGL64.inc
	include include\Spell.inc
	include include\struct64.inc

.const
;Temporarily Empty

.data

 _title db 'OpenGL example',0
 _class db 'FASMOPENGL32',0

 theta dd 0.6

 wc WNDCLASSEX64 <>

 hdc dq ?
 hrc dq ?

 msg MSG64 <>
 rc RECT64 <>
 pfd PIXELFORMATDESCRIPTOR64 <>

 clock dd ?

.data?
;Temporarily Empty

.code

include 010_WinMain.asm
include 020_WndProc.asm

end

