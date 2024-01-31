lblWinMainCheckKeys:

cmp keys[26h],0 ;VK_UP
je @f
fld aYZ
fsub lenStep ;Camera Up
fstp aYZ
jmp lblWinMainReDraw

@@:
cmp keys[28h],0 ;VK_DOWN
je @f
fld aYZ
fadd lenStep ;Camera Down
fstp aYZ
jmp lblWinMainReDraw

@@:
cmp keys[27h],0 ;VK_RIGHT
je @f
fld aXY
fadd lenStep ;Camera Right
fstp aXY
jmp lblWinMainReDraw

@@:
cmp keys[25h],0 ;VK_LEFT
je @f
fld aXY
fsub lenStep ;Camera Left
fstp aXY
jmp lblWinMainReDraw

;------------------------

@@:
cmp keys[57h],0 ;VK_W
je @f
fld zTrans
fsub lenStep ;Camera Step Forward
fstp zTrans
@@:
cmp keys[53h],0 ;VK_S
je @f
fld zTrans
fadd lenStep ;Camera Step Backward
fstp zTrans
@@:
cmp keys[41h],0 ;VK_A
je @f
fld xTrans
fsub lenStep ;Camera Step Left
fstp xTrans
@@:
cmp keys[44h],0 ;VK_D
je @f
fld xTrans
fadd lenStep ;Camera Step Right
fstp xTrans
jmp lblWinMainReDraw

;-------------------------

@@:
cmp keys[20h],0 ;VK_SPACE
je @f
call SetupWorld
jmp lblWinMainReDraw

;-------------------------

@@:
cmp keys[1Bh],0 ;VK_ESCAPE
jne lblWinMainEnd
;-------------------------
