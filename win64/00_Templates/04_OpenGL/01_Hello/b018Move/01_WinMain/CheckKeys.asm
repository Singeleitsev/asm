lblWinMainCheckKeys:

cmp keys[26h],0 ;VK_UP
je @f
fld yCam
fadd dbl_TENTH
fstp yCam
mov keys[26h],0
jmp lblWinMainCheckActive
@@:
cmp keys[28h],0 ;VK_DOWN
je @f
fld yCam
fsub dbl_TENTH
fstp yCam
mov keys[28h],0
jmp lblWinMainCheckActive
@@:
cmp keys[27h],0 ;VK_RIGHT
je @f
fld xCam
fadd dbl_TENTH
fstp xCam
mov keys[27h],0
jmp lblWinMainCheckActive
@@:
cmp keys[25h],0 ;VK_LEFT
je @f
fld xCam
fsub dbl_TENTH
fstp xCam
mov keys[25h],0
jmp lblWinMainCheckActive

@@:
cmp keys[57h],0 ;VK_W
je @f
fld yAim
fadd dbl_TENTH
fstp yAim
mov keys[57h],0
jmp lblWinMainCheckActive
@@:
cmp keys[53h],0 ;VK_S
je @f
fld yAim
fsub dbl_TENTH
fstp yAim
mov keys[53h],0
jmp lblWinMainCheckActive
@@:
cmp keys[44h],0 ;VK_D
je @f
fld xAim
fadd dbl_TENTH
fstp xAim
mov keys[44h],0
jmp lblWinMainCheckActive
@@:
cmp keys[41h],0 ;VK_A
je @f
fld xAim
fsub dbl_TENTH
fstp xAim
mov keys[41h],0
jmp lblWinMainCheckActive
@@:
cmp keys[0Dh],0 ;VK_RETURN
je @f
mov rax,dbl_45
mov aCam,rax
mov rax,dbl_5
mov xCam,rax
mov yCam,rax
mov zCam,rax
mov xAim,0
mov yAim,0
mov zAim,0
mov keys[0Dh],0
jmp lblWinMainCheckActive

;-------------------------
@@:
cmp keys[1Bh],0 ;VK_ESCAPE
jne lblWinMainEnd
;-------------------------
