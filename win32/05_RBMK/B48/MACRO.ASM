;Reads lParam into xMouseOld/yMouseOld
GET_REFERENCE_CURSOR_POSITION macro
mov eax,lParam
;Extract X Component
movzx ecx,ax
mov xMouseOld,ecx
;Extract Y Component
shr eax,16
mov yMouseOld,eax
endm

;Copies new into old, in preparation for the next move
SAVE_OLD_CURSOR_POSITION macro
mov eax,xMouseNew
mov xMouseOld,eax
mov eax,yMouseNew
mov yMouseOld,eax
endm

;Reads lParam into xMouseNew/yMouseNew (current position)
GET_NEW_CURSOR_POSITION macro
mov eax,lParam
;Extract X Component
movzx ecx,ax
mov xMouseNew,ecx
;Extract Y Component
shr eax,16
mov yMouseNew,eax
endm

;Computes dxMouse/dyMouse from new minus old
COMPUTE_MOUSE_DELTA macro
mov eax,xMouseNew
sub eax,xMouseOld
mov dxMouse,eax
mov eax,yMouseNew
sub eax,yMouseOld
mov dyMouse,eax
endm
