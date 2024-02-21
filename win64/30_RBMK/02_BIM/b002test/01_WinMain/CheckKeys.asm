lblWinMainCheckKeys:

cmp keys[26h],0 ;VK_UP
je @f
fld yTrans
fadd dL_Cam
fstp yTrans

@@:
cmp keys[28h],0 ;VK_DOWN
je @f
fld yTrans
fsub dL_Cam
fstp yTrans

@@: ;Gut!!!
cmp keys[25h],0 ;VK_LEFT
je @f
;xpos -= sin(heading*piover180) * 0.05f;
;zpos -= cos(heading*piover180) * 0.05f;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fsub xTrans
fchs
fstp xTrans
fmul dL_Cam
fsub zTrans
fchs
fstp zTrans

@@: ;Gut!!!
cmp keys[27h],0 ;VK_RIGHT
je @f
;xpos += sin(heading*piover180) * 0.05f;
;zpos += cos(heading*piover180) * 0.05f;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fadd xTrans
fstp xTrans
fmul dL_Cam
fadd zTrans
fstp zTrans

;------------------------

@@:
cmp keys[57h],0 ;VK_W
je @f
fld aYZ
fsub dA_Cam ;Camera Up
fstp aYZ

@@:
cmp keys[53h],0 ;VK_S
je @f
fld aYZ
fadd dA_Cam ;Camera Down
fstp aYZ

@@:
cmp keys[41h],0 ;VK_A
je @f
fld aXY
fsub dA_Cam ;Camera Left
fstp aXY

@@:
cmp keys[44h],0 ;VK_D
je @f
fld aXY
fadd dA_Cam ;Camera Right
fstp aXY

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
