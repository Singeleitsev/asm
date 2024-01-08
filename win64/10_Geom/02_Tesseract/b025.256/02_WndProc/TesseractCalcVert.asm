
;push rax
;push rcx
;push rsi
;push rdi

;Store Current Values
;From the Front Buffer (v2)
;to the Back Buffer (v1)
lea rsi,v2 ;Current Coordinates
lea rdi,v1 ;Storage
mov cx,64 ;16 Vertices * 4 Coordinates
lbl_StoreBuffer:
mov eax, dword ptr [rsi]
mov dword ptr [rdi],eax
add rsi,4 ;Size of dword
add rdi,4 ;Size of dword
dec rcx
cmp cx,0
jg lbl_StoreBuffer

;4D Rotation Matrix: no clock order

;Shifts of Addresses for the Affected Coordinates
;Arguments for 'Rot4D_Proc'
;[x0] = 0, [y0] = 40h, [z0] = 80h, [w0] = 0Ch,

;zw-axis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0
;w1 = w0

xor rcx,rcx ;[x0] = [v1]+0
mov rdx,40h ;[y0] = [v1]+40h
lea r8,dword ptr [dA_R4_ZW] ;Angle
;call Rot4D_Proc

;yw-axis rotation
;x1 = x0*cosA-z0*sinA
;y1 = y0
;z1 = x0*sinA+z0*cosA
;w1 = w0

xor rcx,rcx ;[x0] = [v1]+0
mov rdx,80h ;[z0] = [v1]+80h
lea r8,dword ptr [dA_R4_YW] ;Angle
;call Rot4D_Proc

;yz-axis rotation
;x1 = x0*cosA-w0*sinA
;y1 = y0
;z1 = z0
;w1 = x0*sinA+w0*cosA

xor rcx,rcx ;[x0] = [v1]+0
mov rdx,0C0h ;[w0] = [v1]+0Ch
lea r8,dword ptr [dA_R4_YZ] ;Angle
call Rot4D_Proc

;xw-axis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA
;w1 = w0

mov rcx,40h ;[y0] = [v1]+40h
mov rdx,80h ;[z0] = [v1]+80h
lea r8,dword ptr [dA_R4_XW] ;Angle
;call Rot4D_Proc

;xz-axis rotation
;x1 = x0
;y1 = y0*cosA-w0*sinA
;z1 = z0
;w1 = y0*sinA+w0*cosA

mov rcx,40h ;[y0] = [v1]+40h
mov rdx,0C0h ;[w0] = [v1]+0Ch
lea r8,dword ptr [dA_R4_XZ] ;Angle
;call Rot4D_Proc

;xy-axis rotation
;x1 = x0
;y1 = y0
;z1 = z0*cosA-w0*sinA
;w1 = z0*sinA+w0*cosA

mov rcx,80h ;[z0] = [v1]+80h
mov rdx,0C0h ;[w0] = [v1]+0C0h
lea r8,dword ptr [dA_R4_XY] ;Angle
;call Rot4D_Proc

;pop rdi
;pop rsi
;pop rcx
;pop rax
