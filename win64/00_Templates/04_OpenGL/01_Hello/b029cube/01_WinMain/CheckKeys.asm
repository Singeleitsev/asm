lblWinMainCheckKeys:

cmp keys[26h],0 ;VK_UP
je @f
fld aYZ
fsub lenStep ;Camera Up
fstp aYZ
@@:
cmp keys[28h],0 ;VK_DOWN
je @f
fld aYZ
fadd lenStep ;Camera Down
fstp aYZ
@@:
cmp keys[27h],0 ;VK_RIGHT
je @f
fld aXY
fadd lenStep ;Camera Right
fstp aXY
@@:
cmp keys[25h],0 ;VK_LEFT
je @f
fld aXY
fsub lenStep ;Camera Left
fstp aXY

;------------------------

@@:
cmp keys[57h],0 ;VK_W
je @f


@@:
cmp keys[53h],0 ;VK_S
je @f


@@: ;Gut!!!
cmp keys[41h],0 ;VK_A
je @f
;xpos -= sin(heading*piover180) * 0.05f;
;zpos -= cos(heading*piover180) * 0.05f;
fld aXY
fmul f32_pi180
fsincos
fmul lenStep
fsub xTrans
fchs
fstp xTrans
fmul lenStep
fsub zTrans
fchs
fstp zTrans

@@: ;Gut!!!
cmp keys[44h],0 ;VK_D
je @f
;xpos += sin(heading*piover180) * 0.05f;
;zpos += cos(heading*piover180) * 0.05f;
fld aXY
fmul f32_pi180
fsincos
fmul lenStep
fadd xTrans
fstp xTrans
fmul lenStep
fadd zTrans
fstp zTrans

;-------------------------
@@:
cmp keys[20h],0 ;VK_SPACE
je @f
call SetupWorld
;-------------------------
@@:
cmp keys[1Bh],0 ;VK_ESCAPE
je @f
jmp lblWinMainEnd
;-------------------------
@@: ;Default
jmp lblWinMainReDraw
;-------------------------


