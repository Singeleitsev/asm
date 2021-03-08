sub rsp,20h

;invoke GetClientRect,[hwnd],addr rc
	mov rcx,hWnd
	lea rdx,rc
	call GetClientRect
	
;invoke glViewport,0,0,[rc.right],[rc.bottom]
	xor rcx,rcx
	xor rdx,rdx
	xor r8,r8
	mov r8d,rc.right
	xor r9,r9
	mov r9d,rc.bottom
	call glViewport

add rsp,20h


