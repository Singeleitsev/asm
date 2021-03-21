SetTreeDataPointers:

;TREEDATA
;
;00h-i ;Iteration Counter
;04h-cx ;CenterX
;08h-cy ;CenterY
;0Ñh-ml ;Margin Left
;10h-mr ;Margin Right
;14h-mt ;Margin Top
;18h-mb ;Margin Bottom
;1Ñh-mw ;Margin Width
;20h-mh ;Margin Height
;
;lpTreeX = [lpTreeData+24h] ;x Coordinate
;
;lpTreeY = [lpTreeData+30h] ;y Coordinate
;
;lpTreeR = [lpTreeData+3Ch] ;Red Color goes first
;02h-b[0];01h-g[0];00h-r[0] ;Variables
;
;lpTreeCell = [lpTreeData+3Fh] ;Buffer
;
;Coordinates of Current Point are calculated in wmTreePaint

;Re-Load TREEDATA address
;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpTreeData,rax
	add rax,4 ;[lpTreeData+04h]
        mov lpTreeCX,rax
	add rax,4 ;[lpTreeData+08h]
	mov lpTreeCY,rax
	add rax,4 ;[lpTreeData+0Ch]
        mov lpTreeML,rax
	add rax,4 ;[lpTreeData+10h]
	mov lpTreeMR,rax
	add rax,4 ;[lpTreeData+14h]
	mov lpTreeMT,rax
	add rax,4 ;[lpTreeData+18h]
	mov lpTreeMB,rax
	add rax,4 ;[lpTreeData+1Ch]
	mov lpTreeMW,rax
	add rax,4 ;[lpTreeData+20h]
	mov lpTreeMH,rax

	add rax,4 ;[lpTreeData+24h]
        mov lpTreeX1,rax
	add rax,4 ;[lpTreeData+28h]
	mov lpTreeX2,rax
	add rax,4 ;[lpTreeData+2Ch]
	mov lpTreeX3,rax

	add rax,4 ;[lpTreeData+30h]
	mov lpTreeY1,rax
	add rax,4 ;[lpTreeData+34h]
	mov lpTreeY2,rax
	add rax,4 ;[lpTreeData+38h]
	mov lpTreeY3,rax

	add rax,4 ;[lpTreeData+3Ch]
	mov lpTreeR,rax
	inc rax ;[lpTreeData+3Dh]
	mov lpTreeG,rax
	inc rax ;[lpTreeData+3Eh]
	mov lpTreeB,rax
	inc rax ;[lpTreeData+3Fh]
	mov lpTreeCell,rax

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax
