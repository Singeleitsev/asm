;GetNgonData:

;NGONDATA
;
;00h-N ;Number of Vertices
;04h-Alpha ;Minimal Angle
;08h-AlphaCurr ;Current Angle
;0Ch-CenterX
;10h-CenterY
;14h-Radius
;18h-i ;Iteration Counter
;1Ch-Buffer
;
;lpNgonX = [lpNgonData+20h]
;(N*4)-x[N];...;04h-x[1];00h-x[0]
;
;lpNgonY = [lpNgonData+20h+(N+1)*4]
;(N*4)-y[N];...;04h-y[1];00h-y[0]
;
;lpNgonR = [lpNgonData+20h+(N+1)*4+(N+1)*4]
;02h-b[0];01h-g[0];00h-r[0]
;05h-b[1];04h-g[1];03h-r[1]
;(N*3+3)-b[N];(N*3+2)-g[N];(N*3+1)-r[N]
;
;sizeof NGONDATA =
;= 20h+(N+1)*4+(N+1)*4+(N+1)*3 =
;= 20h+(N+1)*0Bh = (N*0Bh)+2Bh
;
;Vertex Colors are loaded in wmNgonCreate
;Coordinates of Vertices are calculated in wmNgonSize
;Coordinates of Current Point are calculated in wmNgonPaint

;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpNgonData,rax
	mov rdi,rax ;lpNgonData

	add rdi,4 ;[lpNgonData+04h]
	mov lpAlpha,rdi
	add rdi,4 ;[lpNgonData+08h]
	mov lpAlphaCurr,rdi
	add rdi,4 ;[lpNgonData+0Ñh]
	mov lpCenterX,rdi
	add rdi,4 ;[lpNgonData+10h]
	mov lpCenterY,rdi
	add rdi,4 ;[lpNgonData+14h]
	mov lpRadius,rdi
	add rdi,4 ;[lpNgonData+18h]
	mov lpIteration,rdi
	add rdi,4 ;[lpNgonData+1Ch]
	mov lpBuffer,rdi ;Radius
;X-Coordinates Array
	add rdi,4 ;[lpNgonData+20h]
	mov lpNgonX,rdi
;Y-Coordinates Array
	xor rbx,rbx
	mov ebx,dword ptr[rax] ;rbx = N
	inc ebx ;rbx = N+1
	shl rbx,2 ;rbx = (N+1)*4
	add rdi,rbx ;rdi = rdi+(N+1)*4
	mov lpNgonY,rdi
;Color Array
	add rdi,rbx ;rdi = rdi+(N+1)*4
	mov lpNgonR,rdi
	inc rdi
	mov lpNgonG,rdi
	inc rdi
	mov lpNgonB,rdi

