wmFrameCommand:

mov r9,lParam ;lParam is already in r9
cmp r9,0
jne endFrmProc

;Distributing with respect to wParam
mov r8,wParam ;wParam is already in r8

cmp r8,IDM_NEW
 je idmFrameNew
cmp r8,IDM_CLOSE
 je idmFrameClose
cmp r8,IDM_CLOSEALL
 je idmFrameCloseAll
cmp r8,IDM_EXIT
 je idmFrameExit
cmp r8,IDM_TILEHORZ
 je idmFrameTileHorz
cmp r8,IDM_TILEVERT
 je idmFrameTileVert
cmp r8,IDM_CASCADE
 je idmFrameCascade
cmp r8,IDM_ABOUT
 je idmFrameAbout

jmp defFrameCmd

include 031_New.asm
include 032_FrameClose.asm
include 033_FrameCloseAll.asm
include 034_FrameExit.asm
include 035_FrameTileHorz.asm
include 036_FrameTileVert.asm
include 037_FrameCascade.asm
include 038_FrameAbout.asm
include 039_defFrameCmd.asm

